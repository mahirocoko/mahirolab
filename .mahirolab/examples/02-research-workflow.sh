#!/bin/bash
# Example 2: Research Workflow
# Demonstrates using codex-research.sh for web-enabled research

echo "=== Example 2: Research Workflow ==="
echo ""
echo "This example shows how to conduct research with web search enabled."
echo ""

# Single research task
echo "🔍 Researching: Next.js 15 new features"
../bin/codex-research.sh "Next.js 15 new features and breaking changes"

echo ""
echo "---"
echo ""

# Multiple research topics (sequential)
TOPICS=(
    "Docker BuildKit cache optimization"
    "PostgreSQL 16 performance improvements"
    "Rust async runtime comparison"
)

echo "📚 Running multiple research tasks..."
for topic in "${TOPICS[@]}"; do
    echo ""
    echo "Researching: $topic"
    ../bin/codex-research.sh "$topic"
done

echo ""
echo "✅ All research completed!"
echo ""
echo "📄 Check results in: .mahirolab/research/"
echo ""
echo "💡 Tips:"
echo "  - Research uses 'medium' reasoning by default"
echo "  - Web search is automatically enabled"
echo "  - Results include structured reports with citations"
echo "  - Reports saved with timestamps for easy tracking"
