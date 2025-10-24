# Example 04: Mixed Reasoning Levels Strategy

This example demonstrates when and how to use different reasoning levels for optimal performance, balancing speed against depth of analysis.

## Overview

Understanding reasoning levels is crucial for:
- ✅ Optimizing task execution time
- ✅ Balancing speed vs. quality
- ✅ Resource-efficient workflows
- ✅ Cost-effective AI usage
- ✅ Appropriate depth for task complexity

## Reasoning Levels Explained

### Complete Spectrum

| Level | Time | Token Usage | Best For | When to Use |
|-------|------|-------------|----------|-------------|
| **minimal** | 5-10s | Lowest | Trivial tasks | File listing, simple queries |
| **low** | 10-15s | Low | Simple tasks | Quick edits, formatting |
| **medium** | 15-25s | Moderate | Moderate complexity | Refactoring, API design |
| **high** | 30-60s+ | Highest | Complex analysis | Architecture, security audits |

### Decision Matrix

```
Task Complexity
    ↑
    │
    │  ┌─────────┐
    │  │  HIGH   │  Architecture Review
    │  │  30-60s │  Security Audit
    │  └─────────┘  Design Patterns
    │
    │  ┌─────────┐
    │  │ MEDIUM  │  API Refactoring
    │  │  15-25s │  Code Organization
    │  └─────────┘  Pattern Implementation
    │
    │  ┌─────────┐
    │  │   LOW   │  Add Comments
    │  │  10-15s │  Format Code
    │  └─────────┘  Simple Fixes
    │
    │  ┌─────────┐
    │  │ MINIMAL │  List Files
    │  │  5-10s  │  Show Content
    │  └─────────┘  Basic Queries
    │
    └──────────────────────────→
                           Time/Cost
```

## Usage Examples by Level

### Minimal Reasoning (~5-10s)

**Best for:** Trivial operations that need minimal intelligence

```bash
# List files
./.mahirolab/bin/codex-exec.sh minimal "List all markdown files in the current directory"

# Show content
./.mahirolab/bin/codex-exec.sh minimal "Display the first 10 lines of README.md"

# Simple checks
./.mahirolab/bin/codex-exec.sh minimal "Count TypeScript files in src/"
```

**Characteristics:**
- Fastest execution
- Minimal token usage
- Basic reasoning only
- Perfect for batch operations
- No deep analysis

**When NOT to use:**
- ❌ Code analysis
- ❌ Complex decisions
- ❌ Nuanced understanding
- ❌ Architecture work

### Low Reasoning (~10-15s)

**Best for:** Simple edits and straightforward tasks

```bash
# Add comments
./.mahirolab/bin/codex-exec.sh low "Add JSDoc comments to all exported functions in utils.js"

# Format code
./.mahirolab/bin/codex-exec.sh low "Fix indentation in config.yaml"

# Simple refactoring
./.mahirolab/bin/codex-exec.sh low "Rename variable 'data' to 'userData' in auth.ts"

# Quick fixes
./.mahirolab/bin/codex-exec.sh low "Add missing semicolons to app.js"
```

**Characteristics:**
- Fast but thoughtful
- Good for obvious tasks
- Handles simple logic
- Default for most scripts
- Balance of speed/quality

**When NOT to use:**
- ❌ Complex refactoring
- ❌ Architecture decisions
- ❌ Security analysis
- ❌ Performance optimization

### Medium Reasoning (~15-25s)

**Best for:** Moderate complexity requiring deeper analysis

```bash
# API design
./.mahirolab/bin/codex-exec.sh medium "Design REST API endpoints for a blog system with auth"

# Code organization
./.mahirolab/bin/codex-exec.sh medium "Refactor authentication flow for better error handling"

# Pattern implementation
./.mahirolab/bin/codex-exec.sh medium "Apply repository pattern to database access layer"

# Analysis
./.mahirolab/bin/codex-exec.sh medium "Identify code duplication in services/ directory"
```

**Characteristics:**
- Balanced approach
- Good analysis depth
- Thoughtful solutions
- Default for research
- Handles nuance well

**When NOT to use:**
- ❌ Trivial file operations
- ❌ Ultra-complex architecture
- ❌ When speed is critical

### High Reasoning (~30-60s+)

**Best for:** Complex problems requiring deep thought

```bash
# Architecture review
./.mahirolab/bin/codex-exec.sh high "Review the entire codebase architecture and suggest improvements"

# Security audit
./.mahirolab/bin/codex-exec.sh high "Perform security audit of authentication and authorization system"

# Performance analysis
./.mahirolab/bin/codex-exec.sh high "Analyze application performance and identify bottlenecks"

# Migration planning
./.mahirolab/bin/codex-exec.sh high "Create migration plan from monolith to microservices"
```

**Characteristics:**
- Deepest analysis
- Comprehensive solutions
- Handles complexity well
- Considers trade-offs
- Most expensive

**When NOT to use:**
- ❌ Simple tasks
- ❌ Time-sensitive work
- ❌ Batch processing
- ❌ Obvious solutions

## Mixed Reasoning Workflows

### Workflow 1: Progressive Depth

Start simple, increase as needed:

```bash
# Step 1: Quick scan (minimal)
./.mahirolab/bin/codex-exec.sh minimal "List all files in src/ with 'auth' in the name"

# Step 2: Identify issues (low)
./.mahirolab/bin/codex-exec.sh low "Check auth.ts for obvious bugs"

# Step 3: Deep analysis (high)
./.mahirolab/bin/codex-exec.sh high "Comprehensive security review of authentication system"
```

### Workflow 2: Batch + Analysis

Use minimal for batch, medium for synthesis:

```bash
# Fast batch operations (minimal)
for file in src/**/*.ts; do
  ./.mahirolab/bin/codex-exec.sh minimal "Count functions in $file"
done

# Analyze aggregated results (medium)
./.mahirolab/bin/codex-exec.sh medium "Analyze function distribution and suggest refactoring"
```

### Workflow 3: Research + Implementation

Medium for research, low for execution:

```bash
# Research (medium)
./.mahirolab/bin/codex-research.sh "React Server Components best practices 2025"

# Design (medium)
./.mahirolab/bin/codex-exec.sh medium "Design blog architecture using RSC patterns"

# Implement (low)
./.mahirolab/bin/codex-exec.sh low "Create boilerplate files for blog components"
```

### Workflow 4: Quality Tiers

Different reasoning for different code importance:

```bash
# Critical code (high)
./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Security audit of payment processing" &

# Important code (medium)
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Refactor user authentication flow" &

# Utility code (low)
./.mahirolab/bin/codex-worker-launcher.sh low workers \
  "Add type hints to utility functions" &

wait
```

## Decision Guide

### Choose MINIMAL when:

✅ Task is completely trivial
- Listing files
- Counting lines
- Simple grep/find operations
- Basic file content display
- No decision-making needed

### Choose LOW when:

✅ Task is simple and straightforward
- Adding comments
- Formatting code
- Renaming variables
- Simple edits
- Obvious fixes

### Choose MEDIUM when:

✅ Task requires thoughtful analysis
- API design
- Code refactoring
- Research tasks
- Pattern application
- Identifying issues

### Choose HIGH when:

✅ Task is complex and critical
- Architecture review
- Security audits
- Performance optimization
- Migration planning
- Complex decisions

## Performance Comparison

### Example Task: "Analyze authentication system"

```bash
# Minimal (5-10s)
# Output: Basic file listing, no analysis
# ❌ Not suitable for this task

# Low (10-15s)
# Output: Surface-level checks, obvious issues
# ⚠️ Misses subtle problems

# Medium (15-25s)
# Output: Good analysis, security considerations
# ✅ Suitable for most cases

# High (30-60s)
# Output: Comprehensive review, trade-offs, recommendations
# ✅ Best for critical systems
```

### Cost-Benefit Analysis

| Level | Time | Tokens | Quality | Use Case | ROI |
|-------|------|--------|---------|----------|-----|
| minimal | 5s | 100 | Basic | File ops | High (fast) |
| low | 12s | 500 | Good | Simple edits | High (balanced) |
| medium | 20s | 2000 | Better | Refactoring | Medium (thorough) |
| high | 45s | 5000 | Best | Architecture | Low (expensive) |

**Rule of thumb:** Use the lowest level that gets the job done right.

## Common Mistakes

### ❌ Mistake 1: Over-engineering Simple Tasks

```bash
# DON'T: Use high reasoning for trivial tasks
./.mahirolab/bin/codex-exec.sh high "List files in src/"
# Time: 45s, Cost: High, Value: Zero

# DO: Use minimal
./.mahirolab/bin/codex-exec.sh minimal "List files in src/"
# Time: 5s, Cost: Low, Value: Same
```

### ❌ Mistake 2: Under-powering Complex Tasks

```bash
# DON'T: Use low reasoning for architecture
./.mahirolab/bin/codex-exec.sh low "Design microservices architecture"
# Result: Shallow, missing critical considerations

# DO: Use high
./.mahirolab/bin/codex-exec.sh high "Design microservices architecture"
# Result: Comprehensive, considers trade-offs
```

### ❌ Mistake 3: Not Adapting Based on Results

```bash
# BAD: Stuck on one level
./.mahirolab/bin/codex-exec.sh low "Complex security analysis"
# Gets poor results, doesn't adjust

# GOOD: Escalate if needed
./.mahirolab/bin/codex-exec.sh low "Quick security check"
# If issues found →
./.mahirolab/bin/codex-exec.sh high "Deep security audit"
```

## Advanced Strategies

### Strategy 1: Adaptive Reasoning

```bash
#!/bin/bash
# Start low, escalate if issues found

RESULT=$(./.mahirolab/bin/codex-exec.sh low "Quick lint check")

if echo "$RESULT" | grep -q "ERROR"; then
  echo "Issues found, running deeper analysis..."
  ./.mahirolab/bin/codex-exec.sh medium "Analyze and fix linting errors"
fi
```

### Strategy 2: Parallel Mixed Levels

```bash
# Run different complexity tasks in parallel with appropriate levels

# Quick tasks (low)
./.mahirolab/bin/codex-worker-launcher.sh low workers \
  "Add copyright headers" &

# Medium tasks (medium)
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Refactor error handling" &

# Complex tasks (high)
./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Architecture review" &

wait
```

### Strategy 3: Pipeline Escalation

```bash
# Progressive complexity pipeline

# Phase 1: Discovery (minimal)
./.mahirolab/bin/codex-exec.sh minimal "Find all test files"

# Phase 2: Analysis (medium)
./.mahirolab/bin/codex-exec.sh medium "Analyze test coverage gaps"

# Phase 3: Planning (high)
./.mahirolab/bin/codex-exec.sh high "Create comprehensive testing strategy"
```

## Troubleshooting

### Task Too Slow

```
Issue: High reasoning takes 60+ seconds
Solution: Consider splitting into multiple medium tasks
```

### Poor Quality Results

```
Issue: Low reasoning gives shallow output
Solution: Increase to medium or high for this task type
```

### Budget Concerns

```
Issue: Too expensive to always use high
Solution: Use minimal/low for batch, high for critical paths only
```

## Summary

Reasoning levels are a powerful optimization tool:
- **minimal**: Trivial operations (~5-10s)
- **low**: Simple tasks (~10-15s) [DEFAULT]
- **medium**: Moderate complexity (~15-25s)
- **high**: Complex analysis (~30-60s+)

**Best Practices:**
1. Start with lowest level that might work
2. Escalate if results insufficient
3. Use high only for truly complex tasks
4. Batch simple tasks with minimal/low
5. Mix levels in parallel workflows

**Remember:**
- Default: `low` (good balance)
- Research: `medium` (thorough)
- Critical: `high` (comprehensive)
- Trivial: `minimal` (fast)

---

**Next Steps:**
- Example 01: Quick task execution
- Example 03: Parallel workers
- Example 05: Sequential pipelines

---

*Example Version: 1.0.0 | Updated: 2025-10-24*
