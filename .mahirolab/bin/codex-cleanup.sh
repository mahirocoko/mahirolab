#!/bin/bash
# Codex Cleanup Utility
# Manages old logs, compresses archives, and maintains disk space

VERSION="1.0.0"

# Exit code constants
EXIT_SUCCESS=0
EXIT_INVALID_INPUT=1

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Default settings
OUTPUT_DIR=".mahirolab"
MAX_AGE_DAYS=7
COMPRESS_AGE_DAYS=3
DRY_RUN=false
FORCE=false

# Handle flags
if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
    echo "codex-cleanup v${VERSION}"
    exit $EXIT_SUCCESS
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  Codex Cleanup Utility              ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}USAGE:${NC}"
    echo "  ./codex-cleanup.sh [options]"
    echo ""
    echo -e "${YELLOW}OPTIONS:${NC}"
    echo "  -d, --dry-run       Preview what will be cleaned without deleting"
    echo "  -f, --force         Skip confirmation prompts"
    echo "  -a, --age DAYS      Delete files older than DAYS (default: 7)"
    echo "  -c, --compress-only Only compress old files, don't delete"
    echo "  -s, --stats         Show storage statistics"
    echo "  -h, --help          Show this help message"
    echo "  -v, --version       Show version information"
    echo ""
    echo -e "${YELLOW}EXAMPLES:${NC}"
    echo "  ./codex-cleanup.sh --dry-run       # Preview cleanup"
    echo "  ./codex-cleanup.sh --age 14        # Delete files older than 14 days"
    echo "  ./codex-cleanup.sh --compress-only # Just compress old files"
    echo "  ./codex-cleanup.sh --stats         # Show disk usage"
    exit $EXIT_SUCCESS
fi

# Parse options
COMPRESS_ONLY=false
SHOW_STATS=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        -a|--age)
            MAX_AGE_DAYS="$2"
            shift 2
            ;;
        -c|--compress-only)
            COMPRESS_ONLY=true
            shift
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

# Function to show statistics
show_stats() {
    echo -e "${BOLD}${CYAN}📊 Storage Statistics${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    if [ ! -d "$OUTPUT_DIR" ]; then
        echo -e "${YELLOW}⚠️  Output directory does not exist: $OUTPUT_DIR${NC}"
        return
    fi

    TOTAL_SIZE=$(du -sh "$OUTPUT_DIR" 2>/dev/null | cut -f1)
    TOTAL_FILES=$(find "$OUTPUT_DIR" -type f | wc -l | tr -d ' ')

    echo -e "  Total Size:      ${YELLOW}${TOTAL_SIZE}${NC}"
    echo -e "  Total Files:     ${GREEN}${TOTAL_FILES}${NC}"
    echo ""

    # Size by category
    if [ -d "$OUTPUT_DIR/workers" ]; then
        WORKERS_SIZE=$(du -sh "$OUTPUT_DIR/workers" 2>/dev/null | cut -f1)
        WORKERS_COUNT=$(find "$OUTPUT_DIR/workers" -type f | wc -l | tr -d ' ')
        echo -e "  Workers:         ${BLUE}${WORKERS_SIZE}${NC} (${WORKERS_COUNT} files)"
    fi

    if [ -d "$OUTPUT_DIR/research" ]; then
        RESEARCH_SIZE=$(du -sh "$OUTPUT_DIR/research" 2>/dev/null | cut -f1)
        RESEARCH_COUNT=$(find "$OUTPUT_DIR/research" -type f | wc -l | tr -d ' ')
        echo -e "  Research:        ${MAGENTA}${RESEARCH_SIZE}${NC} (${RESEARCH_COUNT} files)"
    fi

    echo ""

    # Age distribution
    echo -e "${CYAN}Age Distribution:${NC}"
    RECENT=$(find "$OUTPUT_DIR" -type f -mtime -1 | wc -l | tr -d ' ')
    WEEK=$(find "$OUTPUT_DIR" -type f -mtime -7 -mtime +1 | wc -l | tr -d ' ')
    MONTH=$(find "$OUTPUT_DIR" -type f -mtime -30 -mtime +7 | wc -l | tr -d ' ')
    OLD=$(find "$OUTPUT_DIR" -type f -mtime +30 | wc -l | tr -d ' ')

    echo -e "  < 1 day:         ${GREEN}${RECENT} files${NC}"
    echo -e "  1-7 days:        ${YELLOW}${WEEK} files${NC}"
    echo -e "  7-30 days:       ${MAGENTA}${MONTH} files${NC}"
    echo -e "  > 30 days:       ${RED}${OLD} files${NC}"
    echo ""
}

# Function to compress old files
compress_files() {
    local age=$1
    echo -e "${BLUE}🗜️  Compressing files older than ${age} days...${NC}"

    find "$OUTPUT_DIR" -name "*.md" -type f -mtime +${age} | while read file; do
        if [ ! -f "${file}.gz" ]; then
            if [ "$DRY_RUN" = true ]; then
                echo -e "  ${CYAN}[DRY RUN]${NC} Would compress: $file"
            else
                gzip -k "$file" && echo -e "  ${GREEN}✓${NC} Compressed: $file"
            fi
        fi
    done
}

# Function to delete old files
delete_old_files() {
    local age=$1
    echo -e "${RED}🗑️  Deleting files older than ${age} days...${NC}"

    local files_to_delete=$(find "$OUTPUT_DIR" -name "*.md" -type f -mtime +${age})
    local count=$(echo "$files_to_delete" | grep -c '^' 2>/dev/null || echo 0)

    if [ $count -eq 0 ]; then
        echo -e "${GREEN}✓ No files to delete${NC}"
        return
    fi

    if [ "$DRY_RUN" = true ]; then
        echo "$files_to_delete" | while read file; do
            echo -e "  ${CYAN}[DRY RUN]${NC} Would delete: $file"
        done
        echo -e "\n${YELLOW}Total files that would be deleted: ${count}${NC}"
        return
    fi

    if [ "$FORCE" = false ]; then
        echo -e "${YELLOW}⚠️  About to delete ${count} files. Continue? (y/N)${NC}"
        read -r response
        if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
            echo -e "${BLUE}Cleanup cancelled${NC}"
            exit $EXIT_SUCCESS
        fi
    fi

    echo "$files_to_delete" | while read file; do
        rm "$file" && echo -e "  ${GREEN}✓${NC} Deleted: $file"
    done

    echo -e "\n${GREEN}✓ Deleted ${count} files${NC}"
}

# Main execution
echo -e "${BOLD}${CYAN}╔════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║              CODEX CLEANUP UTILITY                                 ║${NC}"
echo -e "${BOLD}${CYAN}╚════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

if [ "$SHOW_STATS" = true ]; then
    show_stats
    exit $EXIT_SUCCESS
fi

if [ ! -d "$OUTPUT_DIR" ]; then
    echo -e "${YELLOW}⚠️  Output directory does not exist: $OUTPUT_DIR${NC}"
    echo -e "Nothing to clean up!"
    exit $EXIT_SUCCESS
fi

if [ "$DRY_RUN" = true ]; then
    echo -e "${CYAN}🔍 DRY RUN MODE - No files will be modified${NC}"
    echo ""
fi

echo -e "${BLUE}Configuration:${NC}"
echo -e "  Output Directory: ${CYAN}$OUTPUT_DIR${NC}"
echo -e "  Max Age:          ${YELLOW}$MAX_AGE_DAYS days${NC}"
echo -e "  Compress Age:     ${YELLOW}$COMPRESS_AGE_DAYS days${NC}"
echo ""

# Show current stats
show_stats

# Compress old files first
if [ "$COMPRESS_ONLY" = false ]; then
    compress_files $COMPRESS_AGE_DAYS
    echo ""
fi

# Delete very old files
if [ "$COMPRESS_ONLY" = false ]; then
    delete_old_files $MAX_AGE_DAYS
else
    compress_files $COMPRESS_AGE_DAYS
fi

echo ""
if [ "$DRY_RUN" = false ]; then
    echo -e "${GREEN}✅ Cleanup completed!${NC}"
    echo ""
    show_stats
else
    echo -e "${CYAN}💡 Remove ${YELLOW}--dry-run${CYAN} flag to actually perform cleanup${NC}"
fi

exit $EXIT_SUCCESS
