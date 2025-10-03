#!/bin/bash
# Example 5: Sequential Pipeline
# Demonstrates chaining tasks where each depends on the previous one

echo "=== Example 5: Sequential Task Pipeline ==="
echo ""
echo "This example shows how to chain dependent tasks in sequence."
echo ""

# Step 1: Research
echo "📋 Step 1/4: Research best practices"
../bin/codex-research.sh "React Server Components best practices 2024"

echo ""
echo "---"
echo ""

# Step 2: Design based on research
echo "🎨 Step 2/4: Design architecture"
../bin/codex-exec.sh medium "Based on React Server Components research, design a simple blog architecture"

echo ""
echo "---"
echo ""

# Step 3: Generate implementation plan
echo "📝 Step 3/4: Generate implementation plan"
../bin/codex-exec.sh low "Create a step-by-step implementation plan for the blog architecture"

echo ""
echo "---"
echo ""

# Step 4: Create initial files
echo "⚙️ Step 4/4: Create boilerplate"
../bin/codex-exec.sh low "Create folder structure and boilerplate files for the blog project"

echo ""
echo "✅ Pipeline completed!"
echo ""
echo "📊 Pipeline Summary:"
echo "  1. Research (web search enabled)"
echo "  2. Design (medium reasoning)"
echo "  3. Plan (low reasoning)"
echo "  4. Execute (low reasoning)"
echo ""
echo "💡 Tips:"
echo "  - Each step builds on the previous one"
echo "  - Use appropriate reasoning levels per step"
echo "  - Research first, implement later"
echo "  - Can be combined with background workers for parallel sub-tasks"
echo "  - Consider creating a YAML pipeline config for complex workflows"
