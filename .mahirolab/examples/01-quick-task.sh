#!/bin/bash
# Example 1: Quick Task Execution
# Demonstrates basic usage of codex-exec.sh for quick, synchronous tasks

echo "=== Example 1: Quick Task Execution ==="
echo ""
echo "This example shows how to use codex-exec.sh for quick tasks"
echo "that you want to monitor in real-time."
echo ""

# Simple task with default (low) reasoning
echo "Running: List all TypeScript files in src/"
../bin/codex-exec.sh "List all TypeScript files in the current directory"

echo ""
echo "---"
echo ""

# Task with explicit reasoning level
echo "Running: Analyze package.json with high reasoning"
../bin/codex-exec.sh high "Analyze package.json and suggest improvements"

echo ""
echo "✅ Example completed!"
echo ""
echo "💡 Tips:"
echo "  - Use default (low) reasoning for simple tasks"
echo "  - Use high reasoning for complex analysis"
echo "  - Output streams directly to console"
echo "  - Perfect for quick experiments"
