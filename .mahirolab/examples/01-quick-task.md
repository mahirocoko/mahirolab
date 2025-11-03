# Example 01: Quick Task Execution

This example demonstrates basic usage of `codex-exec.sh` for quick, synchronous tasks that you want to monitor in real-time.

## Overview

The `codex-exec.sh` script is perfect for:
- ✅ Quick experiments and one-off commands
- ✅ Tasks you want to supervise in real-time
- ✅ Simple operations that complete quickly
- ✅ Interactive debugging and exploration

## Basic Usage

### Simple Task (Default Low Reasoning)

```bash
./.mahirolab/bin/codex-exec.sh "List all TypeScript files in the current directory"
```

**What happens:**
- Uses `low` reasoning by default (10-15s)
- Output streams directly to console
- No file created (ephemeral output)
- Perfect for quick checks

### Task with Explicit Reasoning Level

```bash
./.mahirolab/bin/codex-exec.sh high "Analyze package.json and suggest improvements"
```

**What happens:**
- Uses `high` reasoning (30-60s+)
- Deeper analysis and recommendations
- Still outputs to console only
- Good for complex one-time analysis

## Example Workflow

### Step 1: List Files (Minimal Reasoning)

```bash
./.mahirolab/bin/codex-exec.sh minimal "List all markdown files"
```

**Expected output:**
- Fast execution (~5-10s)
- Simple file listing
- No complex analysis

### Step 2: Analyze Code (High Reasoning)

```bash
./.mahirolab/bin/codex-exec.sh high "Analyze package.json and suggest improvements"
```

**Expected output:**
- Detailed analysis
- Dependency recommendations
- Security suggestions
- Performance tips

## Features

### Reasoning Levels

| Level | Time | Use Case | Example |
|-------|------|----------|---------|
| `minimal` | 5-10s | Trivial tasks | List files, show contents |
| `low` | 10-15s | Simple edits | Add comments, format code |
| `medium` | 15-25s | Moderate tasks | Refactoring, API design |
| `high` | 30-60s+ | Complex analysis | Architecture review |

### Dry Run Mode

```bash
./.mahirolab/bin/codex-exec.sh --dry-run "task description"
./.mahirolab/bin/codex-exec.sh -d "task description"
```

**What it does:**
- Shows the command that would be executed
- Does NOT actually run it
- Useful for verification

### Help and Version

```bash
./.mahirolab/bin/codex-exec.sh --help
./.mahirolab/bin/codex-exec.sh --version
```

## When to Use codex-exec.sh

✅ **Use when:**
- You need immediate results
- Task completes quickly (< 2 minutes)
- You want to see output in real-time
- No need to save results to file
- Interactive exploration/debugging

❌ **Don't use when:**
- Task will take > 5 minutes
- You need to track multiple tasks
- Results should be saved for later
- Want to run in background

**For long tasks:** Use `codex-worker-launcher.sh` instead (see Example 03)

## Tips & Tricks

### 1. Combine with grep/jq for filtering

```bash
./.mahirolab/bin/codex-exec.sh "List all dependencies" | grep react
```

### 2. Use for quick validation

```bash
# Before committing
./.mahirolab/bin/codex-exec.sh "Check for TypeScript errors in src/"
```

### 3. Ad-hoc backgrounding

```bash
# Run in background manually
./.mahirolab/bin/codex-exec.sh high "Analyze large dataset" &

# Check status
jobs

# Wait for completion
wait
```

### 4. Chain with other commands

```bash
# Sequential execution
./.mahirolab/bin/codex-exec.sh "Generate config" && npm install
```

## Common Use Cases

### File Operations

```bash
./.mahirolab/bin/codex-exec.sh "Find all TODO comments in src/"
./.mahirolab/bin/codex-exec.sh "List recently modified files"
```

### Code Analysis

```bash
./.mahirolab/bin/codex-exec.sh medium "Identify unused imports"
./.mahirolab/bin/codex-exec.sh high "Review security vulnerabilities"
```

### Quick Fixes

```bash
./.mahirolab/bin/codex-exec.sh "Add missing semicolons to app.js"
./.mahirolab/bin/codex-exec.sh "Fix indentation in config.yaml"
```

## Troubleshooting

### Command Not Found

```bash
Error: codex: command not found
Solution: Ensure codex is installed and in PATH
```

### Permission Denied

```bash
Error: Permission denied
Solution: chmod +x .mahirolab/bin/codex-exec.sh
```

### Task Takes Too Long

```bash
Issue: Task is running for > 5 minutes
Solution: Stop with Ctrl+C, use codex-worker-launcher.sh instead
```

## Summary

`codex-exec.sh` is your go-to tool for:
- Quick, synchronous task execution
- Real-time output monitoring
- Interactive exploration
- Simple one-off commands

**Remember:**
- Default reasoning: `low`
- Output: Console only (no files)
- Perfect for: Quick tasks < 2 minutes
- Not ideal for: Long-running background jobs

---

**Next Steps:**
- Example 02: Research with web search
- Example 03: Background workers
- Example 04: Reasoning level strategies

---

*Example Version: 1.0.0 | Updated: 2025-10-24*
