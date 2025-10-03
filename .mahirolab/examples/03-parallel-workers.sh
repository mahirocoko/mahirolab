#!/bin/bash
# Example 3: Parallel Background Workers
# Demonstrates running multiple tasks in parallel using codex-worker-launcher.sh

echo "=== Example 3: Parallel Background Workers ==="
echo ""
echo "This example launches multiple background workers in parallel."
echo ""

# Launch multiple workers in parallel
echo "🚀 Launching parallel workers..."
echo ""

# Worker 1: Code analysis
../bin/codex-worker-launcher.sh medium workers "Analyze all JavaScript files and identify potential bugs" &
PID1=$!

# Worker 2: Documentation generation
../bin/codex-worker-launcher.sh low workers "Generate API documentation from TypeScript interfaces" &
PID2=$!

# Worker 3: Test coverage analysis
../bin/codex-worker-launcher.sh low workers "Analyze test coverage and suggest missing test cases" &
PID3=$!

echo ""
echo "⏳ Waiting for all workers to complete..."
echo ""

# Wait for all background jobs
wait $PID1
wait $PID2
wait $PID3

echo ""
echo "✅ All workers completed!"
echo ""
echo "📊 View status with:"
echo "  ../bin/codex-status.sh --workers"
echo ""
echo "💡 Tips:"
echo "  - Workers run in background with PID tracking"
echo "  - Use 'wait' to synchronize parallel tasks"
echo "  - Check status anytime with codex-status.sh"
echo "  - Output files tagged with timestamps and PIDs"
echo "  - Useful for long-running or independent tasks"
