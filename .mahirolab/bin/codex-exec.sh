#!/bin/bash
# Codex Direct Execution Helper Script
# Usage: ./codex-exec.sh [reasoning_level] "Your task description"
# Examples:
#   ./codex-exec.sh low "List all files"
#   ./codex-exec.sh high "Refactor the API endpoints"
#   ./codex-exec.sh "Quick task" (defaults to low reasoning)

VERSION="1.0.0"

# Exit code constants
EXIT_SUCCESS=0
EXIT_INVALID_INPUT=1
EXIT_TASK_FAILED=2

# Default reasoning level
REASONING="${1:-low}"

# If only one argument, it's the prompt with default reasoning
if [ $# -eq 1 ]; then
    PROMPT="$1"
    REASONING="low"
else
    PROMPT="$2"
fi

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Parse flags
DRY_RUN=false

# Handle flags
if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
    echo "codex-exec v${VERSION}"
    exit $EXIT_SUCCESS
fi

if [ "$1" = "--dry-run" ] || [ "$1" = "-d" ]; then
    DRY_RUN=true
    shift
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  Codex Direct Execution Helper      ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}USAGE:${NC}"
    echo "  ./codex-exec.sh [reasoning_level] \"task description\""
    echo "  ./codex-exec.sh \"task description\"  (defaults to low)"
    echo ""
    echo -e "${YELLOW}REASONING LEVELS:${NC}"
    echo -e "  ${MAGENTA}minimal${NC}  - Fastest (~5-10s) for trivial tasks"
    echo -e "  ${GREEN}low${NC}      - Balanced speed and depth (~10-15s) ${CYAN}[DEFAULT]${NC}"
    echo -e "  ${YELLOW}medium${NC}   - Moderate complexity (~15-25s)"
    echo -e "  ${RED}high${NC}     - Deepest reasoning (~30-60s+)"
    echo ""
    echo -e "${YELLOW}EXAMPLES:${NC}"
    echo "  ./codex-exec.sh \"List all TypeScript files\""
    echo "  ./codex-exec.sh low \"Fix syntax errors in src/\""
    echo "  ./codex-exec.sh high \"Refactor authentication system\""
    echo ""
    echo -e "${YELLOW}OPTIONS:${NC}"
    echo "  -d, --dry-run  Preview what will be executed without running"
    echo "  -h, --help     Show this help message"
    echo "  -v, --version  Show version information"
    exit $EXIT_SUCCESS
fi

# Check if prompt is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}❌ Error: No task description provided${NC}"
    echo -e "Run ${CYAN}'./codex-exec.sh --help'${NC} for usage information"
    exit $EXIT_INVALID_INPUT
fi

if [ "$DRY_RUN" = true ]; then
    echo -e "${CYAN}🔍 DRY RUN MODE - Preview Only${NC}"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}Command that would be executed:${NC}"
    echo ""
    echo -e "  ${GREEN}codex exec \\${NC}"
    echo -e "    ${CYAN}-s danger-full-access \\${NC}"
    echo -e "    ${CYAN}-c model_reasoning_effort=\"${REASONING}\" \\${NC}"
    echo -e "    ${CYAN}\"${PROMPT}\"${NC}"
    echo ""
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${MAGENTA}Configuration:${NC}"
    echo -e "  Reasoning Level: ${YELLOW}${REASONING}${NC}"
    echo -e "  Task: ${GREEN}${PROMPT}${NC}"
    echo -e "  Safety Mode: ${RED}danger-full-access${NC}"
    echo ""
    echo -e "${CYAN}💡 Remove ${YELLOW}--dry-run${CYAN} flag to execute this command${NC}"
    exit $EXIT_SUCCESS
fi

echo -e "${BLUE}🤖 Codex Direct Execution${NC}"
echo -e "${YELLOW}Reasoning: ${REASONING}${NC}"
echo -e "${GREEN}Task: ${PROMPT}${NC}"
echo "----------------------------------------"

# Execute Codex with full access and no approval needed
codex exec \
    -s danger-full-access \
    -c model_reasoning_effort="${REASONING}" \
    "$PROMPT"

# Capture exit code
EXIT_CODE=$?

echo "----------------------------------------"
if [ $EXIT_CODE -eq 0 ]; then
    echo -e "${GREEN}✅ Task completed successfully${NC}"
    exit $EXIT_SUCCESS
else
    echo -e "${RED}❌ Task failed with exit code: $EXIT_CODE${NC}"
    exit $EXIT_TASK_FAILED
fi