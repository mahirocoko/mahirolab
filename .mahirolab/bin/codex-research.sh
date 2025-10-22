#!/bin/bash
# Research Script - Simplified Codex Research with Web Search
# Usage: ./codex-research.sh "research topic"
# Example: ./codex-research.sh "Next.js 15 performance improvements"

VERSION="1.0.0"

# Exit code constants
EXIT_SUCCESS=0
EXIT_INVALID_INPUT=1
EXIT_TASK_FAILED=2

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Handle flags
if [ "$1" = "--version" ] || [ "$1" = "-v" ]; then
    echo "codex-research v${VERSION}"
    exit $EXIT_SUCCESS
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  Codex Research Engine              ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}USAGE:${NC}"
    echo "  ./codex-research.sh \"research topic\""
    echo ""
    echo -e "${YELLOW}FEATURES:${NC}"
    echo "  • Web search enabled for latest information"
    echo "  • Structured markdown report output"
    echo "  • Fixed ${MAGENTA}medium${NC} reasoning level"
    echo "  • Direct URL citations (no markdown titles)"
    echo ""
    echo -e "${YELLOW}EXAMPLES:${NC}"
    echo "  ./codex-research.sh \"Next.js 15 performance improvements\""
    echo "  ./codex-research.sh \"PostgreSQL vs MySQL comparison\""
    echo "  ./codex-research.sh \"Docker build cache best practices\""
    echo ""
    echo -e "${YELLOW}OUTPUT:${NC}"
    echo "  Reports saved to: ${CYAN}.mahirolab/research/${NC}"
    echo ""
    echo -e "${YELLOW}OPTIONS:${NC}"
    echo "  -h, --help     Show this help message"
    echo "  -v, --version  Show version information"
    exit $EXIT_SUCCESS
fi

# Check if topic is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}❌ Error: Please provide a research topic${NC}"
    echo -e "Run ${CYAN}'./codex-research.sh --help'${NC} for usage information"
    exit $EXIT_INVALID_INPUT
fi

# Get research topic and sanitize for filename
RESEARCH_TOPIC="$1"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")
TASK_NAME=$(echo "$RESEARCH_TOPIC" | sed 's/[^a-zA-Z0-9]/_/g' | tr '[:upper:]' '[:lower:]' | sed 's/__*/_/g' | sed 's/^_\|_$//g')
OUTPUT_FILE=".mahirolab/research/${TIMESTAMP}_PLACEHOLDER_codex_${TASK_NAME}.md"

# Create output directory if it doesn't exist
mkdir -p .mahirolab/research

# Load template if exists
TEMPLATE_FILE=".mahirolab/templates/research-report.md"
if [ -f "$TEMPLATE_FILE" ]; then
    TEMPLATE_CONTENT=$(cat "$TEMPLATE_FILE")
    # Replace placeholders
    TEMPLATE_CONTENT=$(echo "$TEMPLATE_CONTENT" | sed "s|{{TOPIC}}|${RESEARCH_TOPIC}|g")
    TEMPLATE_CONTENT=$(echo "$TEMPLATE_CONTENT" | sed "s|{{DATE}}|${CURRENT_DATE}|g")
    TEMPLATE_CONTENT=$(echo "$TEMPLATE_CONTENT" | sed "s|{{REASONING_LEVEL}}|medium|g")
    USE_TEMPLATE=true
    echo -e "${GREEN}✓ Template loaded: ${TEMPLATE_FILE}${NC}"
else
    USE_TEMPLATE=false
    echo -e "${YELLOW}⚠ Template not found, using default structure${NC}"
fi

echo -e "${BLUE}🔍 Codex Research Engine${NC}"
echo -e "${YELLOW}Topic: ${RESEARCH_TOPIC}${NC}"
echo -e "${GREEN}Output: ${OUTPUT_FILE}${NC}"
echo "----------------------------------------"

# Build prompt based on template availability
if [ "$USE_TEMPLATE" = true ]; then
    # Use template-based prompt
    PROMPT="Research: ${RESEARCH_TOPIC}

Use the following template structure for your research report:

${TEMPLATE_CONTENT}

**IMPORTANT INSTRUCTIONS**:
1. Replace PLACEHOLDER in filename '${OUTPUT_FILE}' with your process ID
2. Use DIRECT URLs ONLY in citations (NOT [Title](URL) format)
3. Example: https://docs.docker.com/build/cache/, https://github.com/github/spec-kit
4. Do NOT use markdown link titles: AVOID [Docker Cache](https://url), [Spec-Kit](https://url)
5. Include publication dates where available
6. Prioritize official documentation and authoritative sources
7. Use web search to get the most current information
8. Keep all citations clean and simple with direct URLs only
9. Follow the template structure exactly as provided above

Save output to: ${OUTPUT_FILE}"
else
    # Fallback to default structure
    PROMPT="Research: ${RESEARCH_TOPIC}

Create a comprehensive markdown report with the following structure:

## Research Report: ${RESEARCH_TOPIC}

### Executive Summary
[Brief overview of the research topic]

### Key Findings
- Main discoveries and insights
- Important trends or developments
- Critical information points

### Technical Specifications
- Version numbers, requirements
- Compatibility information
- Technical details and specifications

### References & Sources
**CRITICAL**: Include DIRECT URLs only (no markdown titles):
- https://complete-url-here
- https://full-documentation-url
- https://complete-official-url
- https://complete-repo-url

### Conclusion
[Summary and recommendations based on research]

**IMPORTANT INSTRUCTIONS**:
1. Replace PLACEHOLDER in filename '${OUTPUT_FILE}' with your process ID
2. Use DIRECT URLs ONLY in citations (NOT [Title](URL) format)
3. Example: https://docs.docker.com/build/cache/, https://github.com/github/spec-kit
4. Do NOT use markdown link titles: AVOID [Docker Cache](https://url), [Spec-Kit](https://url)
5. Include publication dates where available
6. Prioritize official documentation and authoritative sources
7. Use web search to get the most current information
8. Keep all citations clean and simple with direct URLs only

Save output to: ${OUTPUT_FILE}"
fi

# Execute Codex research with structured prompt
codex exec -s danger-full-access \
  -c 'tools.web_search=true' \
  -c model_reasoning_effort="medium" \
  "$PROMPT"

# Capture exit code
EXIT_CODE=$?

echo "----------------------------------------"
if [ $EXIT_CODE -eq 0 ]; then
    echo -e "${GREEN}✅ Research completed successfully${NC}"
    echo -e "${BLUE}📄 Check output in: ${OUTPUT_FILE}${NC}"
    exit $EXIT_SUCCESS
else
    echo -e "${RED}❌ Research failed with exit code: $EXIT_CODE${NC}"
    exit $EXIT_TASK_FAILED
fi