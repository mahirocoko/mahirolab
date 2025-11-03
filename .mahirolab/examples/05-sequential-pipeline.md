# Example 05: Sequential Pipeline

This example demonstrates chaining tasks where each step depends on the previous one, creating a cohesive workflow from research to implementation.

## Overview

Sequential pipelines are essential for:
- ✅ Dependent task execution
- ✅ Building on previous results
- ✅ Research-to-implementation workflows
- ✅ Controlled execution order
- ✅ Progressive refinement

## Basic Concept

Unlike parallel execution, sequential pipelines:
- Execute tasks one after another
- Each task can use results from previous steps
- Natural for multi-phase projects
- Prevents race conditions
- Enables iterative refinement

## Pipeline Structure

```
Step 1: Research
    ↓
Step 2: Design (based on research)
    ↓
Step 3: Plan (based on design)
    ↓
Step 4: Implement (following plan)
    ↓
Step 5: Verify (check implementation)
```

## Basic Sequential Pipeline

### Example: Blog System Development

```bash
#!/bin/bash
# Complete pipeline from research to implementation

echo "=== Blog System Development Pipeline ==="
echo ""

# Step 1: Research
echo "📋 Step 1/4: Research best practices"
./.mahirolab/bin/codex-research.sh "React Server Components best practices 2025"

echo ""
echo "---"
echo ""

# Step 2: Design
echo "🎨 Step 2/4: Design architecture"
./.mahirolab/bin/codex-exec.sh medium "Based on React Server Components research, design a simple blog architecture"

echo ""
echo "---"
echo ""

# Step 3: Plan
echo "📝 Step 3/4: Generate implementation plan"
./.mahirolab/bin/codex-exec.sh low "Create a step-by-step implementation plan for the blog architecture"

echo ""
echo "---"
echo ""

# Step 4: Implement
echo "⚙️ Step 4/4: Create boilerplate"
./.mahirolab/bin/codex-exec.sh low "Create folder structure and boilerplate files for the blog project"

echo ""
echo "✅ Pipeline completed!"
```

**Pipeline Summary:**
1. **Research** (web search, medium reasoning) → Knowledge
2. **Design** (medium reasoning) → Architecture
3. **Plan** (low reasoning) → Step-by-step guide
4. **Implement** (low reasoning) → Code files

## Advanced Pipeline Patterns

### Pattern 1: Research → Implementation

Complete workflow from investigation to code:

```bash
#!/bin/bash
# Authentication implementation pipeline

# Phase 1: Research (20s)
echo "🔍 Researching JWT best practices..."
./.mahirolab/bin/codex-research.sh "JWT authentication security best practices 2025"

# Phase 2: Security review (45s)
echo "🔒 Reviewing current auth implementation..."
./.mahirolab/bin/codex-exec.sh high "Security audit of existing authentication in auth.ts"

# Phase 3: Design improvements (20s)
echo "🎨 Designing secure JWT implementation..."
./.mahirolab/bin/codex-exec.sh medium "Design improved JWT auth system based on research findings"

# Phase 4: Implement (15s)
echo "⚙️ Implementing JWT authentication..."
./.mahirolab/bin/codex-exec.sh low "Implement JWT token generation and validation"

# Phase 5: Tests (15s)
echo "🧪 Creating test cases..."
./.mahirolab/bin/codex-exec.sh low "Create unit tests for JWT authentication"

echo "✅ Authentication pipeline complete!"
```

### Pattern 2: Analysis → Refactoring

Systematic code improvement:

```bash
#!/bin/bash
# Code quality improvement pipeline

# Step 1: Identify issues (10s)
echo "🔍 Scanning for code smells..."
./.mahirolab/bin/codex-exec.sh low "Identify code smells and anti-patterns in services/ directory"

# Step 2: Prioritize (20s)
echo "📊 Prioritizing issues..."
./.mahirolab/bin/codex-exec.sh medium "Prioritize identified issues by impact and effort"

# Step 3: Refactor high-priority (background)
echo "🔧 Refactoring high-priority issues..."
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Refactor top 3 high-impact code quality issues"

# Wait for completion
wait

# Step 4: Verify (15s)
echo "✅ Verifying refactoring..."
./.mahirolab/bin/codex-exec.sh low "Review refactored code for correctness"

echo "✅ Quality improvement pipeline complete!"
```

### Pattern 3: Progressive Enhancement

Iterative feature development:

```bash
#!/bin/bash
# Feature development pipeline

FEATURE="User profile management"

# Stage 1: Basic implementation
echo "🏗️ Stage 1: Basic implementation"
./.mahirolab/bin/codex-exec.sh low "Create basic $FEATURE with CRUD operations"

# Stage 2: Add validation
echo "🛡️ Stage 2: Add validation"
./.mahirolab/bin/codex-exec.sh low "Add input validation to $FEATURE"

# Stage 3: Error handling
echo "🚨 Stage 3: Error handling"
./.mahirolab/bin/codex-exec.sh medium "Implement comprehensive error handling for $FEATURE"

# Stage 4: Optimize
echo "⚡ Stage 4: Optimization"
./.mahirolab/bin/codex-exec.sh medium "Optimize $FEATURE for performance"

# Stage 5: Documentation
echo "📚 Stage 5: Documentation"
./.mahirolab/bin/codex-exec.sh low "Generate API documentation for $FEATURE"

echo "✅ $FEATURE development complete!"
```

### Pattern 4: Multi-Phase Project

Large project with distinct phases:

```bash
#!/bin/bash
# E-commerce platform development

# PHASE 1: Foundation
echo "=== PHASE 1: Foundation ==="

./.mahirolab/bin/codex-research.sh "E-commerce platform architecture patterns 2025"
./.mahirolab/bin/codex-exec.sh high "Design scalable e-commerce architecture"
./.mahirolab/bin/codex-exec.sh medium "Create database schema for e-commerce platform"
./.mahirolab/bin/codex-exec.sh low "Set up project structure and dependencies"

# PHASE 2: Core Features
echo "=== PHASE 2: Core Features ==="

./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Implement product catalog with search" &
PID1=$!

./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Implement shopping cart functionality" &
PID2=$!

wait $PID1 $PID2

# PHASE 3: Payment Integration
echo "=== PHASE 3: Payment Integration ==="

./.mahirolab/bin/codex-research.sh "Stripe payment integration best practices"
./.mahirolab/bin/codex-exec.sh high "Design secure payment processing flow"
./.mahirolab/bin/codex-exec.sh medium "Implement Stripe payment integration"

# PHASE 4: Testing
echo "=== PHASE 4: Testing ==="

./.mahirolab/bin/codex-exec.sh medium "Create comprehensive test suite for all features"

echo "✅ E-commerce platform development complete!"
```

## Error Handling in Pipelines

### Pattern 5: Graceful Failure Handling

```bash
#!/bin/bash
# Pipeline with error handling

set -e  # Exit on error
trap 'echo "❌ Pipeline failed at step $CURRENT_STEP"' ERR

CURRENT_STEP="Research"
./.mahirolab/bin/codex-research.sh "API design patterns" || {
  echo "Research failed, using cached knowledge"
}

CURRENT_STEP="Design"
./.mahirolab/bin/codex-exec.sh medium "Design RESTful API" || {
  echo "Design failed, cannot continue"
  exit 1
}

CURRENT_STEP="Implementation"
./.mahirolab/bin/codex-exec.sh low "Implement API endpoints"

echo "✅ Pipeline completed successfully!"
```

### Pattern 6: Retry Logic

```bash
#!/bin/bash
# Pipeline with automatic retry

function run_with_retry() {
  local max_attempts=3
  local attempt=1
  local cmd="$@"

  while [ $attempt -le $max_attempts ]; do
    echo "Attempt $attempt of $max_attempts"

    if eval "$cmd"; then
      return 0
    else
      echo "Failed, retrying..."
      attempt=$((attempt + 1))
      sleep 2
    fi
  done

  echo "❌ Failed after $max_attempts attempts"
  return 1
}

# Use in pipeline
run_with_retry ./.mahirolab/bin/codex-research.sh "Complex topic"
run_with_retry ./.mahirolab/bin/codex-exec.sh medium "Complex task"
```

## Conditional Pipelines

### Pattern 7: Branching Logic

```bash
#!/bin/bash
# Pipeline with conditional branches

# Step 1: Analyze codebase
RESULT=$(./.mahirolab/bin/codex-exec.sh medium "Analyze codebase complexity")

if echo "$RESULT" | grep -q "high complexity"; then
  # High complexity path
  echo "🔴 High complexity detected, running deep refactoring..."
  ./.mahirolab/bin/codex-exec.sh high "Comprehensive refactoring plan"
  ./.mahirolab/bin/codex-worker-launcher.sh high workers \
    "Execute major refactoring"

elif echo "$RESULT" | grep -q "medium complexity"; then
  # Medium complexity path
  echo "🟡 Medium complexity, targeted improvements..."
  ./.mahirolab/bin/codex-exec.sh medium "Identify specific areas to improve"

else
  # Low complexity path
  echo "🟢 Low complexity, minor cleanups..."
  ./.mahirolab/bin/codex-exec.sh low "Apply code formatting and linting"
fi

echo "✅ Conditional pipeline complete!"
```

## Data Flow Between Steps

### Pattern 8: Passing Context

```bash
#!/bin/bash
# Pipeline with data flow

# Step 1: Generate context
CONTEXT_FILE=".mahirolab/state/pipeline_context.md"

./.mahirolab/bin/codex-exec.sh medium \
  "Analyze project requirements and save to $CONTEXT_FILE"

# Step 2: Use context
./.mahirolab/bin/codex-exec.sh medium \
  "Read requirements from $CONTEXT_FILE and design architecture"

# Step 3: Reference both
./.mahirolab/bin/codex-exec.sh low \
  "Implement features based on architecture in $CONTEXT_FILE"

echo "✅ Context-aware pipeline complete!"
```

## Mixed Execution Models

### Pattern 9: Sequential + Parallel Hybrid

```bash
#!/bin/bash
# Hybrid pipeline

# Sequential Phase 1: Setup
echo "Phase 1: Setup (sequential)"
./.mahirolab/bin/codex-research.sh "Microservices patterns"
./.mahirolab/bin/codex-exec.sh high "Design microservices architecture"

# Parallel Phase 2: Implement services
echo "Phase 2: Services (parallel)"
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Implement user service" &

./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Implement product service" &

./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Implement order service" &

wait

# Sequential Phase 3: Integration
echo "Phase 3: Integration (sequential)"
./.mahirolab/bin/codex-exec.sh medium "Create API gateway"
./.mahirolab/bin/codex-exec.sh low "Set up inter-service communication"

echo "✅ Hybrid pipeline complete!"
```

## Best Practices

### ✅ Do:

1. **Start with research**
   ```bash
   # Good: Research first
   ./.mahirolab/bin/codex-research.sh "topic"
   ./.mahirolab/bin/codex-exec.sh "implement based on research"
   ```

2. **Match reasoning to phase**
   ```bash
   # Research: medium
   # Design: medium/high
   # Implementation: low/medium
   # Testing: low
   ```

3. **Check exit codes**
   ```bash
   ./.mahirolab/bin/codex-exec.sh "task" || exit 1
   ```

4. **Log progress**
   ```bash
   echo "$(date): Starting step 1" >> pipeline.log
   ```

5. **Save intermediate results**
   ```bash
   ./.mahirolab/bin/codex-exec.sh "task" > results/step1.md
   ```

### ❌ Don't:

1. **Skip error handling**
   ```bash
   # Bad: No error checking
   ./.mahirolab/bin/codex-exec.sh "task1"
   ./.mahirolab/bin/codex-exec.sh "task2"  # Runs even if task1 fails
   ```

2. **Make all steps sequential unnecessarily**
   ```bash
   # Bad: Could be parallel
   ./.mahirolab/bin/codex-exec.sh "independent task 1"
   ./.mahirolab/bin/codex-exec.sh "independent task 2"
   ```

3. **Use wrong reasoning levels**
   ```bash
   # Bad: Overkill
   ./.mahirolab/bin/codex-exec.sh high "List files"
   ```

## Pipeline Templates

### Template 1: Standard Feature Pipeline

```bash
#!/bin/bash
FEATURE_NAME="$1"

./.mahirolab/bin/codex-research.sh "$FEATURE_NAME best practices"
./.mahirolab/bin/codex-exec.sh medium "Design $FEATURE_NAME"
./.mahirolab/bin/codex-exec.sh low "Implement $FEATURE_NAME"
./.mahirolab/bin/codex-exec.sh low "Create tests for $FEATURE_NAME"
```

### Template 2: Refactoring Pipeline

```bash
#!/bin/bash
TARGET_DIR="$1"

./.mahirolab/bin/codex-exec.sh low "Identify issues in $TARGET_DIR"
./.mahirolab/bin/codex-exec.sh medium "Prioritize and plan refactoring"
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Refactor $TARGET_DIR"
./.mahirolab/bin/codex-exec.sh low "Verify refactoring"
```

### Template 3: Security Pipeline

```bash
#!/bin/bash
COMPONENT="$1"

./.mahirolab/bin/codex-research.sh "$COMPONENT security best practices"
./.mahirolab/bin/codex-exec.sh high "Security audit of $COMPONENT"
./.mahirolab/bin/codex-exec.sh medium "Design security improvements"
./.mahirolab/bin/codex-exec.sh medium "Implement security fixes"
./.mahirolab/bin/codex-exec.sh high "Verify security improvements"
```

## Troubleshooting

### Pipeline Hangs

```
Issue: Pipeline stuck on one step
Solution: Check if task is running (ps aux | grep codex)
         Consider timeout or background execution
```

### Steps Out of Order

```
Issue: Results don't build on each other properly
Solution: Ensure sequential execution, check dependencies
         Use set -e to stop on errors
```

### Lost Context Between Steps

```
Issue: Later steps don't reference earlier work
Solution: Save intermediate results to files
         Pass context explicitly in prompts
```

## Summary

Sequential pipelines enable:
- **Dependent workflows** - Each step builds on previous
- **Research to implementation** - Smooth knowledge transfer
- **Progressive refinement** - Iterative improvement
- **Controlled execution** - Prevent race conditions
- **Error handling** - Graceful failure management

**Key Patterns:**
1. Research → Design → Plan → Implement
2. Analysis → Refactoring → Verification
3. Progressive enhancement stages
4. Hybrid sequential + parallel
5. Conditional branching

**Remember:**
- Check exit codes
- Handle errors gracefully
- Use appropriate reasoning levels
- Log progress
- Save intermediate results

---

**Next Steps:**
- Example 01: Quick task execution
- Example 03: Parallel workers
- Example 04: Reasoning level strategies

---

*Example Version: 1.0.0 | Updated: 2025-10-24*
