# Example 03: Parallel Background Workers

This example demonstrates running multiple tasks in parallel using `codex-worker-launcher.sh` for concurrent execution and efficient resource utilization.

## Overview

The `codex-worker-launcher.sh` script enables:
- ✅ Background execution with PID tracking
- ✅ Parallel task processing
- ✅ Persistent log files with timestamps
- ✅ Template-based structured output
- ✅ No terminal blocking for long tasks

## Basic Usage

### Single Background Worker

```bash
./.mahirolab/bin/codex-worker-launcher.sh "Analyze all JavaScript files and identify potential bugs"
```

**What happens:**
1. Creates temp file: `.mahirolab/workers/YYYYMMDD_HHMMSS_TEMP_codex_task.md`
2. Spawns background process
3. Returns Bash PID for tracking
4. Task runs independently
5. File renamed to include PID when complete: `YYYYMMDD_HHMMSS_<PID>_codex_task.md`

### Worker with Custom Reasoning

```bash
# Low reasoning (default) - fast execution
./.mahirolab/bin/codex-worker-launcher.sh low workers "Add JSDoc comments to utils.js"

# Medium reasoning - balanced approach
./.mahirolab/bin/codex-worker-launcher.sh medium workers "Refactor API endpoints for consistency"

# High reasoning - deep analysis
./.mahirolab/bin/codex-worker-launcher.sh high workers "Review entire architecture and suggest improvements"
```

## Parallel Execution Patterns

### Pattern 1: Multiple Independent Tasks

```bash
#!/bin/bash
# Launch multiple workers in parallel

echo "🚀 Launching parallel workers..."

# Worker 1: Code analysis (medium reasoning)
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Analyze all JavaScript files and identify potential bugs" &
PID1=$!

# Worker 2: Documentation (low reasoning)
./.mahirolab/bin/codex-worker-launcher.sh low workers \
  "Generate API documentation from TypeScript interfaces" &
PID2=$!

# Worker 3: Test coverage (low reasoning)
./.mahirolab/bin/codex-worker-launcher.sh low workers \
  "Analyze test coverage and suggest missing test cases" &
PID3=$!

echo "✅ All workers launched"
echo "PIDs: $PID1, $PID2, $PID3"

# Wait for all to complete
echo "⏳ Waiting for completion..."
wait $PID1
wait $PID2
wait $PID3

echo "🎉 All workers completed!"
```

### Pattern 2: Mixed Output Types

```bash
# Research worker
./.mahirolab/bin/codex-worker-launcher.sh medium research \
  "Latest React best practices" &

# Code worker
./.mahirolab/bin/codex-worker-launcher.sh low workers \
  "Apply React best practices to components/" &

# Both run in parallel with different output directories
wait
```

### Pattern 3: Resource-Intensive Tasks

```bash
# Launch heavy analysis tasks in background
./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Security audit of authentication system" &

./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Performance profiling of API endpoints" &

./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Database query optimization analysis" &

# Continue working while they run
echo "Workers running in background..."
echo "Check status with: ./codex-status.sh"
```

## Features

### PID-Based File Naming

| Stage | Filename | Purpose |
|-------|----------|---------|
| **Initial** | `20251024_150000_TEMP_codex_task.md` | Temporary placeholder |
| **Running** | Same (TEMP remains) | Codex writing content |
| **Complete** | `20251024_150000_54321_codex_task.md` | PID replaces TEMP |

**Why this matters:**
- Unique identification of each job
- Easy correlation with system processes
- Prevents filename collisions
- Enables post-execution analysis

### Template Auto-Injection

Template from `.mahirolab/templates/worker-task.md` provides:

```markdown
# Worker Task Report

**Task:** {{TASK_DESCRIPTION}}
**Started:** {{START_TIME}}
**Reasoning Level:** {{REASONING_LEVEL}}

## Task Summary
[What was accomplished]

## Files Modified
- file1.js
- file2.ts

## Changes Made
[Detailed changes]

## Issues Encountered
[Any problems]

## Next Steps
[Recommendations]
```

### Reasoning Level Selection

Choose based on task complexity:

| Level | Time | Best For | Example Task |
|-------|------|----------|--------------|
| `low` | 10-15s | Simple edits | Add comments, format code |
| `medium` | 15-25s | Refactoring | API cleanup, restructuring |
| `high` | 30-60s+ | Architecture | Security audit, design review |

## Monitoring Background Workers

### Check Running Workers

```bash
# List all background jobs
jobs

# Check specific PID
ps -p 54321

# Monitor all codex processes
ps aux | grep "codex exec"
```

### Use codex-status.sh

```bash
# View all workers
./.mahirolab/bin/codex-status.sh --workers

# Show latest N workers
./.mahirolab/bin/codex-status.sh --latest 5

# Full statistics
./.mahirolab/bin/codex-status.sh --stats
```

### Tail Worker Output

```bash
# Find the temp file
ls -lt .mahirolab/workers/ | head -5

# Monitor progress
tail -f .mahirolab/workers/20251024_150000_TEMP_codex_task.md

# Or wait for PID file to appear
watch -n 2 'ls .mahirolab/workers/*_[0-9]*_codex_task.md | tail -1'
```

## When to Use Parallel Workers

✅ **Use parallel workers when:**
- Multiple independent tasks
- Long-running operations (> 2 minutes)
- Don't need immediate results
- Want to continue working meanwhile
- Tasks can run concurrently without conflicts

❌ **Don't use when:**
- Tasks depend on each other (use sequential pipeline instead)
- Need immediate results (use `codex-exec.sh`)
- Tasks modify same files (race conditions)
- System resources limited

## Advanced Patterns

### Pattern 4: Controlled Parallelism

```bash
#!/bin/bash
# Run max 3 workers at a time

MAX_PARALLEL=3
TASKS=(
  "Analyze component A"
  "Analyze component B"
  "Analyze component C"
  "Analyze component D"
  "Analyze component E"
)

for task in "${TASKS[@]}"; do
  # Wait if too many jobs running
  while [ $(jobs -r | wc -l) -ge $MAX_PARALLEL ]; do
    sleep 1
  done

  # Launch worker
  ./.mahirolab/bin/codex-worker-launcher.sh low workers "$task" &
  echo "Launched: $task"
done

# Wait for all to complete
wait
echo "All tasks completed!"
```

### Pattern 5: Priority Queue

```bash
#!/bin/bash
# High priority tasks first, then parallel low priority

echo "🔴 High priority tasks (sequential)"
./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Fix critical security vulnerability"
wait

./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Resolve production bug in auth"
wait

echo "🟡 Medium priority tasks (parallel)"
./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Refactor payment flow" &

./.mahirolab/bin/codex-worker-launcher.sh medium workers \
  "Update error handling" &

wait
echo "✅ All priorities completed"
```

### Pattern 6: Error Handling and Retry

```bash
#!/bin/bash
# Launch worker with error handling

MAX_RETRIES=3
ATTEMPT=1

while [ $ATTEMPT -le $MAX_RETRIES ]; do
  echo "Attempt $ATTEMPT of $MAX_RETRIES"

  ./.mahirolab/bin/codex-worker-launcher.sh medium workers \
    "Complex refactoring task" &

  WORKER_PID=$!
  wait $WORKER_PID
  EXIT_CODE=$?

  if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ Worker completed successfully"
    break
  else
    echo "❌ Worker failed with exit code $EXIT_CODE"
    ATTEMPT=$((ATTEMPT + 1))

    if [ $ATTEMPT -le $MAX_RETRIES ]; then
      echo "Retrying in 5 seconds..."
      sleep 5
    fi
  fi
done

if [ $ATTEMPT -gt $MAX_RETRIES ]; then
  echo "⚠️ Worker failed after $MAX_RETRIES attempts"
  exit 1
fi
```

## Cleanup and Maintenance

### Regular Cleanup

```bash
# Use codex-cleanup.sh for automated maintenance
./.mahirolab/bin/codex-cleanup.sh --dry-run

# Delete workers older than 7 days
./.mahirolab/bin/codex-cleanup.sh --age 7

# Compress old workers
./.mahirolab/bin/codex-cleanup.sh --compress-only
```

### Manual Cleanup

```bash
# Archive completed workers
mkdir -p .mahirolab/workers/archive/2025-10/
mv .mahirolab/workers/202510*.md .mahirolab/workers/archive/2025-10/

# Delete very old workers
find .mahirolab/workers/ -name "*.md" -mtime +30 -delete
```

## Troubleshooting

### Worker Not Starting

```
Error: Failed to spawn background process
Solution: Check that codex is installed and PATH is correct
```

### TEMP File Never Renamed

```
Issue: File stays as TEMP even after completion
Solution: Check if worker crashed. Review temp file for errors.
```

### Too Many Workers Running

```
Issue: System becomes slow with many parallel workers
Solution: Limit parallelism (see Pattern 4), or use wait between batches
```

### Lost Track of PID

```
Issue: Can't find which PID corresponds to which task
Solution: Use codex-status.sh --workers to list all with timestamps
```

### File Collision

```
Issue: Multiple workers created at same second
Solution: Workers include PID in final filename, collision impossible
```

## Best Practices

### 1. Descriptive Task Names

```bash
# ❌ Vague
./.mahirolab/bin/codex-worker-launcher.sh "fix stuff" &

# ✅ Specific
./.mahirolab/bin/codex-worker-launcher.sh \
  "Fix TypeScript type errors in auth/ directory" &
```

### 2. Track PIDs Systematically

```bash
# Store PIDs for later reference
declare -A WORKER_PIDS

./.mahirolab/bin/codex-worker-launcher.sh "Task A" &
WORKER_PIDS["task_a"]=$!

./.mahirolab/bin/codex-worker-launcher.sh "Task B" &
WORKER_PIDS["task_b"]=$!

# Check specific worker
wait ${WORKER_PIDS["task_a"]}
echo "Task A completed"
```

### 3. Match Reasoning to Task

```bash
# Simple batch operations → low
./.mahirolab/bin/codex-worker-launcher.sh low workers \
  "Add copyright headers to all files" &

# Complex analysis → high
./.mahirolab/bin/codex-worker-launcher.sh high workers \
  "Architectural review of microservices" &
```

### 4. Monitor Don't Poll

```bash
# ❌ Busy polling
while [ ! -f .mahirolab/workers/*_12345_*.md ]; do
  sleep 1
done

# ✅ Use wait
./.mahirolab/bin/codex-worker-launcher.sh "task" &
PID=$!
wait $PID
echo "Task completed"
```

### 5. Clean Up Regularly

```bash
# Add to daily/weekly cron
0 2 * * 0 ./.mahirolab/bin/codex-cleanup.sh --age 14
```

## Summary

`codex-worker-launcher.sh` enables efficient parallel execution:
- Background workers with PID tracking
- Template-based structured output
- Configurable reasoning levels
- Persistent logs for later review
- No blocking of terminal

**Remember:**
- Default reasoning: `low`
- Output: `.mahirolab/workers/` or custom type
- Files renamed from TEMP to PID when complete
- Use `wait` for synchronization
- Monitor with `codex-status.sh`

---

**Next Steps:**
- Example 01: Quick task execution
- Example 04: Reasoning level strategies
- Example 06: Shortcode integration (www)

---

*Example Version: 1.0.0 | Updated: 2025-10-24*
