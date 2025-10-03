#!/bin/bash
# Codex Job Status Dashboard
# Usage: ./codex-status.sh [options]

VERSION="1.0.0"

# Exit code constants
EXIT_SUCCESS=0
EXIT_INVALID_INPUT=1

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Default settings
CODEX_OUTPUT_DIR=".mahirolab"

# Handle flags
if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
    echo "codex-status v${VERSION}"
    exit $EXIT_SUCCESS
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  Codex Job Status Dashboard         ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}USAGE:${NC}"
    echo "  ./codex-status.sh [options]"
    echo ""
    echo -e "${YELLOW}OPTIONS:${NC}"
    echo "  -a, --all      Show all jobs (including old ones)"
    echo "  -w, --workers  Show only worker jobs"
    echo "  -r, --research Show only research jobs"
    echo "  -l, --latest N Show only N latest jobs (default: 10)"
    echo "  -s, --stats    Show statistics summary"
    echo "  -h, --help     Show this help message"
    echo "  -v, --version  Show version information"
    echo ""
    echo -e "${YELLOW}EXAMPLES:${NC}"
    echo "  ./codex-status.sh              # Show recent jobs"
    echo "  ./codex-status.sh --workers    # Show worker jobs only"
    echo "  ./codex-status.sh --latest 20  # Show 20 latest jobs"
    echo "  ./codex-status.sh --stats      # Show statistics"
    exit $EXIT_SUCCESS
fi

# Parse options
SHOW_ALL=false
FILTER_TYPE=""
LIMIT=10
SHOW_STATS=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -a|--all)
            SHOW_ALL=true
            shift
            ;;
        -w|--workers)
            FILTER_TYPE="workers"
            shift
            ;;
        -r|--research)
            FILTER_TYPE="research"
            shift
            ;;
        -l|--latest)
            LIMIT="$2"
            shift 2
            ;;
        -s|--stats)
            SHOW_STATS=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

# Function to format file size
format_size() {
    local size=$1
    if [ $size -lt 1024 ]; then
        echo "${size}B"
    elif [ $size -lt 1048576 ]; then
        echo "$(($size / 1024))KB"
    else
        echo "$(($size / 1048576))MB"
    fi
}

# Function to get time ago
time_ago() {
    local file=$1
    local now=$(date +%s)
    local modified=$(stat -f %m "$file" 2>/dev/null || stat -c %Y "$file" 2>/dev/null)
    local diff=$((now - modified))

    if [ $diff -lt 60 ]; then
        echo "${diff}s ago"
    elif [ $diff -lt 3600 ]; then
        echo "$((diff / 60))m ago"
    elif [ $diff -lt 86400 ]; then
        echo "$((diff / 3600))h ago"
    else
        echo "$((diff / 86400))d ago"
    fi
}

# Function to extract info from filename
extract_info() {
    local filename=$(basename "$1")
    local timestamp=$(echo "$filename" | cut -d'_' -f1-2)
    local pid=$(echo "$filename" | cut -d'_' -f3)

    echo "${timestamp}|${pid}"
}

# Print header
echo -e "${BOLD}${CYAN}╔════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║              CODEX JOB STATUS DASHBOARD                            ║${NC}"
echo -e "${BOLD}${CYAN}╚════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if output directory exists
if [ ! -d "$CODEX_OUTPUT_DIR" ]; then
    echo -e "${YELLOW}⚠️  No jobs found. Output directory does not exist: ${CODEX_OUTPUT_DIR}${NC}"
    exit $EXIT_SUCCESS
fi

# Collect all job files
ALL_FILES=()

if [ -z "$FILTER_TYPE" ] || [ "$FILTER_TYPE" = "workers" ]; then
    if [ -d "$CODEX_OUTPUT_DIR/workers" ]; then
        while IFS= read -r file; do
            ALL_FILES+=("$file")
        done < <(find "$CODEX_OUTPUT_DIR/workers" -name "*.md" -type f)
    fi
fi

if [ -z "$FILTER_TYPE" ] || [ "$FILTER_TYPE" = "research" ]; then
    if [ -d "$CODEX_OUTPUT_DIR/research" ]; then
        while IFS= read -r file; do
            ALL_FILES+=("$file")
        done < <(find "$CODEX_OUTPUT_DIR/research" -name "*.md" -type f)
    fi
fi

# Sort by modification time (newest first)
IFS=$'\n' SORTED_FILES=($(ls -t "${ALL_FILES[@]}" 2>/dev/null))

# Show statistics if requested
if [ "$SHOW_STATS" = true ]; then
    TOTAL_JOBS=${#SORTED_FILES[@]}
    TOTAL_WORKERS=$(find "$CODEX_OUTPUT_DIR/workers" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
    TOTAL_RESEARCH=$(find "$CODEX_OUTPUT_DIR/research" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
    TOTAL_SIZE=$(du -sh "$CODEX_OUTPUT_DIR" 2>/dev/null | cut -f1)

    echo -e "${BOLD}📊 Statistics Summary${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  Total Jobs:      ${GREEN}${TOTAL_JOBS}${NC}"
    echo -e "  Worker Jobs:     ${BLUE}${TOTAL_WORKERS}${NC}"
    echo -e "  Research Jobs:   ${MAGENTA}${TOTAL_RESEARCH}${NC}"
    echo -e "  Total Size:      ${YELLOW}${TOTAL_SIZE}${NC}"
    echo ""
fi

# Display jobs
if [ ${#SORTED_FILES[@]} -eq 0 ]; then
    echo -e "${YELLOW}📭 No jobs found${NC}"
    exit $EXIT_SUCCESS
fi

echo -e "${BOLD}📋 Recent Jobs${NC} ${CYAN}(showing latest ${LIMIT})${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

count=0
for file in "${SORTED_FILES[@]}"; do
    if [ $count -ge $LIMIT ] && [ "$SHOW_ALL" = false ]; then
        break
    fi

    filename=$(basename "$file")
    dirname=$(basename $(dirname "$file"))
    filesize=$(stat -f %z "$file" 2>/dev/null || stat -c %s "$file" 2>/dev/null)
    size_formatted=$(format_size $filesize)
    modified=$(time_ago "$file")

    # Extract timestamp and PID
    info=$(extract_info "$file")
    timestamp=$(echo "$info" | cut -d'|' -f1)
    pid=$(echo "$info" | cut -d'|' -f2)

    # Color code by type
    if [ "$dirname" = "workers" ]; then
        TYPE_COLOR="${BLUE}"
        TYPE_ICON="⚙️"
    else
        TYPE_COLOR="${MAGENTA}"
        TYPE_ICON="🔍"
    fi

    echo -e "${TYPE_ICON}  ${TYPE_COLOR}${dirname}${NC} │ ${GREEN}${timestamp}${NC} │ PID: ${YELLOW}${pid}${NC} │ ${size_formatted} │ ${CYAN}${modified}${NC}"
    echo -e "   └─ ${file}"
    echo ""

    ((count++))
done

# Show tip
if [ ${#SORTED_FILES[@]} -gt $LIMIT ] && [ "$SHOW_ALL" = false ]; then
    remaining=$((${#SORTED_FILES[@]} - LIMIT))
    echo -e "${CYAN}💡 Tip: Use ${YELLOW}--all${CYAN} to see all ${remaining} more jobs${NC}"
fi

echo ""
echo -e "${CYAN}Run ${YELLOW}'./codex-status.sh --help'${CYAN} for more options${NC}"

exit $EXIT_SUCCESS
