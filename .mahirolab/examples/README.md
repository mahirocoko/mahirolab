# Codex Examples Library

Collection of example documentation demonstrating common workflows and best practices.

## Quick Start

All examples are now in markdown format for better documentation and readability. Browse them directly or reference them when building your own workflows.

## Examples Overview

### 01 - Quick Task Execution
**File:** `01-quick-task.md`
**Focus:** Basic synchronous task execution
**Use Case:** Quick fixes, file listings, simple edits
**Runtime:** < 30 seconds

Demonstrates:
- Using default reasoning levels
- Real-time output streaming
- Quick experiments and iterations

---

### 02 - Research Workflow
**File:** `02-research-workflow.md`
**Focus:** Web-enabled research with structured reports
**Use Case:** Technology research, comparisons, documentation discovery
**Runtime:** 1-3 minutes per topic

Demonstrates:
- Single and batch research tasks
- Web search integration
- Structured markdown reports
- Citation management

---

### 03 - Parallel Background Workers
**File:** `03-parallel-workers.md`
**Focus:** Running multiple tasks concurrently
**Use Case:** Independent tasks, code analysis, batch processing
**Runtime:** Depends on task complexity

Demonstrates:
- Launching parallel workers
- Process ID tracking
- Waiting for completion
- Status monitoring

---

### 04 - Mixed Reasoning Levels
**File:** `04-mixed-reasoning-levels.md`
**Focus:** Choosing appropriate reasoning levels
**Use Case:** Optimizing speed vs quality tradeoff
**Runtime:** ~2-3 minutes total

Demonstrates:
- minimal: 5-10s (trivial tasks)
- low: 10-15s (simple tasks)
- medium: 15-25s (moderate complexity)
- high: 30-60s+ (complex analysis)

---

### 05 - Sequential Pipeline
**File:** `05-sequential-pipeline.md`
**Focus:** Chaining dependent tasks
**Use Case:** Multi-step workflows, project scaffolding
**Runtime:** 3-5 minutes

Demonstrates:
- Research → Design → Plan → Execute workflow
- Task dependencies
- Appropriate reasoning per step
- Building complex workflows

---

### 06 - Shortcode Integration (NEW)
**File:** `06-shortcode-integration.md`
**Focus:** Claude-managed background jobs using shortcodes
**Use Case:** Interactive research and tasks with real-time monitoring
**Runtime:** Variable (depends on task)

Demonstrates:
- `rrresearch` shortcode for Claude-managed research
- `www` shortcode for Claude-managed workers
- Real-time monitoring via BashOutput tool
- Job control via KillShell tool
- Comparison with direct scripts
- Integration with Claude session

**Key Difference:**
- Shortcodes (`rrresearch`, `www`) = Visible in Claude UI, monitored by Claude
- Direct scripts (`.sh` files) = Independent processes, manual monitoring

---

## Using Examples

All examples are now comprehensive markdown documentation. You can:

```bash
# Browse examples
ls .mahirolab/examples/*.md

# Read a specific example
cat .mahirolab/examples/01-quick-task.md

# Open in your favorite editor/viewer
code .mahirolab/examples/01-quick-task.md
```

Each example contains:
- Overview and use cases
- Code examples you can copy and run
- Best practices and tips
- Troubleshooting guides
- Advanced patterns

## Best Practices Learned

### 1. **Choose Reasoning Wisely**
- Start with `low` for unknown tasks
- Use `minimal` for batch operations
- Reserve `high` for architecture/complex problems

### 2. **Parallel vs Sequential**
- **Parallel:** Independent tasks (code analysis, research)
- **Sequential:** Dependent tasks (research → design → implement)

### 3. **Monitoring**
- Use `codex-status.sh` to check job progress
- Background workers save logs with timestamps
- Check exit codes for error handling

### 4. **File Organization**
- Research outputs: `.mahirolab/research/`
- Worker outputs: `.mahirolab/workers/`
- Custom outputs: configurable via `output_type`

## Creating Your Own Examples

Template for new markdown examples:

```markdown
# Example NN: [Title]

Brief introduction explaining what this example demonstrates.

## Overview

Key points:
- ✅ Feature 1
- ✅ Feature 2

## Basic Usage

### Example Command

\`\`\`bash
./.mahirolab/bin/codex-exec.sh "Your task"
\`\`\`

## Features

Detailed explanations, tables, code blocks

## When to Use

✅ Use when:
❌ Don't use when:

## Tips & Tricks

Practical tips and best practices

## Summary

Brief recap

---

*Example Version: 1.0.0 | Updated: YYYY-MM-DD*
```

## Next Steps

- Review `CLAUDE.md` for architecture overview
- Browse individual examples for detailed patterns
- Use helper scripts in `.mahirolab/bin/` for automation
- Combine patterns to create custom workflows

## Troubleshooting

**Issue:** codex command not found
**Fix:** Ensure Codex CLI is installed and in PATH

**Issue:** Slow performance
**Fix:** Lower reasoning level or reduce parallel workers

**Issue:** Want executable examples
**Fix:** Code examples in markdown files are ready to copy and execute

---

💡 **Pro Tip:** Customize these examples for your specific use case!
