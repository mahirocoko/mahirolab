#!/bin/bash
# Example 4: Mixed Reasoning Levels
# Demonstrates when to use different reasoning levels for optimal performance

echo "=== Example 4: Mixed Reasoning Levels Strategy ==="
echo ""
echo "This example shows how to choose reasoning levels based on task complexity."
echo ""

# Minimal reasoning - trivial tasks (5-10s)
echo "🏃 MINIMAL reasoning - List files (fastest)"
../bin/codex-exec.sh minimal "List all markdown files in the current directory"

echo ""
echo "---"
echo ""

# Low reasoning - simple tasks (10-15s)
echo "🚶 LOW reasoning - Simple refactoring (balanced)"
../bin/codex-exec.sh low "Add JSDoc comments to all exported functions in utils.js"

echo ""
echo "---"
echo ""

# Medium reasoning - moderate complexity (15-25s)
echo "🧘 MEDIUM reasoning - API design (deeper analysis)"
../bin/codex-exec.sh medium "Design REST API endpoints for a blog system with auth"

echo ""
echo "---"
echo ""

# High reasoning - complex tasks (30-60s+)
echo "🧠 HIGH reasoning - Architecture review (deepest)"
../bin/codex-exec.sh high "Review the entire codebase architecture and suggest improvements"

echo ""
echo "✅ Example completed!"
echo ""
echo "📊 Reasoning Level Guide:"
echo "  ┌─────────┬──────────────┬─────────────────────────────────┐"
echo "  │ Level   │ Time         │ Best For                        │"
echo "  ├─────────┼──────────────┼─────────────────────────────────┤"
echo "  │ minimal │  5-10s       │ Trivial tasks, file listing     │"
echo "  │ low     │ 10-15s       │ Simple edits, quick fixes       │"
echo "  │ medium  │ 15-25s       │ Moderate refactors, API design  │"
echo "  │ high    │ 30-60s+      │ Complex analysis, architecture  │"
echo "  └─────────┴──────────────┴─────────────────────────────────┘"
echo ""
echo "💡 Tips:"
echo "  - Start with low for unknown tasks"
echo "  - Use minimal for batch processing many simple tasks"
echo "  - Reserve high for truly complex problems"
echo "  - Time/quality tradeoff: higher = slower but deeper"
