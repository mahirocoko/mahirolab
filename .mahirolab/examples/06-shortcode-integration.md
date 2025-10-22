# Example 06: Shortcode Integration - Claude-Managed Jobs

This example demonstrates how to use the new `rrresearch` and `www` shortcodes for Claude-managed background tasks.

## Overview

Unlike standalone scripts (`.mahirolab/bin/codex-*.sh`), these shortcodes:
- ✅ Run through Claude Code's Bash tool with `run_in_background: true`
- ✅ Visible in Claude Code UI as background tasks
- ✅ Can be monitored in real-time with `BashOutput` tool
- ✅ Can be stopped/killed with `KillShell` tool
- ✅ Integrated with Claude's session management

## Shortcode: `rrresearch` - Claude-Managed Research

### Basic Usage

```
User: rrresearch "React 19 new features"
```

Claude will:
1. Load template from `.mahirolab/templates/research-report.md`
2. Inject variables ({{TOPIC}}, {{DATE}}, {{REASONING_LEVEL}})
3. Execute with `run_in_background: true`
4. Return job ID for monitoring
5. Save to `.mahirolab/research/YYYYMMDD_HHMMSS_PLACEHOLDER_codex_react_19_new_features.md`

### Example Interaction

```
User: rrresearch "PostgreSQL vs MySQL 2025 comparison"

Claude: 🔍 Starting research job...
        Job ID: bash_67890
        Topic: PostgreSQL vs MySQL 2025 comparison
        Reasoning: medium (fixed)
        Web Search: enabled
        Output: .mahirolab/research/20251022_143012_PLACEHOLDER_codex_postgresql_vs_mysql_2025_comparison.md

        ✅ Job running in background
        💡 Use "check research status" to monitor progress

User: check research status

Claude: [Uses BashOutput tool]
        📊 Research Progress:
        - Status: Running
        - Time elapsed: 45s
        - Current output: [shows latest output from codex]

User: [5 minutes later] is research done?

Claude: [Checks BashOutput]
        ✅ Research completed!
        📄 Report saved to:
        .mahirolab/research/20251022_143012_98765_codex_postgresql_vs_mysql_2025_comparison.md

        Summary:
        - Executive Summary: [brief excerpt]
        - Key Findings: 5 major differences
        - References: 12 authoritative sources
```

### Features

- **Fixed reasoning level:** Always `medium` for balanced depth
- **Web search:** Always enabled for latest information
- **Template-based:** Consistent report structure
- **Monitoring:** Real-time progress updates via Claude

---

## Shortcode: `www` - Claude-Managed Worker

### Basic Usage

```
User: www "task description"                    # default: low reasoning
User: www medium "task description"             # medium reasoning
User: www high "complex refactoring task"       # high reasoning
```

Claude will:
1. Load template from `.mahirolab/templates/worker-task.md`
2. Inject variables ({{TASK_DESCRIPTION}}, {{START_TIME}}, {{REASONING_LEVEL}})
3. Execute with `run_in_background: true`
4. Return job ID for monitoring
5. Save to `.mahirolab/workers/YYYYMMDD_HHMMSS_TEMP_codex_task.md`

### Example 1: Simple Task (Low Reasoning)

```
User: www "Add type hints to utils.py"

Claude: 🚀 Starting worker job...
        Job ID: bash_54321
        Task: Add type hints to utils.py
        Reasoning: low (default)
        Output: .mahirolab/workers/20251022_144500_TEMP_codex_task.md

        ✅ Job running in background
        💡 Use "check worker status" to monitor progress

User: check worker status

Claude: [Uses BashOutput tool]
        📊 Worker Progress:
        - Status: Running
        - Task: Add type hints to utils.py
        - Time elapsed: 1m 20s
        - Current step: Analyzing function signatures...

User: [2 minutes later] worker done?

Claude: [Checks BashOutput]
        ✅ Worker completed successfully!
        📄 Report: .mahirolab/workers/20251022_144500_54321_codex_task.md

        Summary:
        - Files modified: 1 (utils.py)
        - Type hints added: 15 functions
        - Issues: None
        - Next steps: Run mypy for validation
```

### Example 2: Complex Task (High Reasoning)

```
User: www high "Refactor authentication system to use JWT tokens"

Claude: 🚀 Starting worker job...
        Job ID: bash_11223
        Task: Refactor authentication system to use JWT tokens
        Reasoning: high
        Estimated time: 30-60+ seconds
        Output: .mahirolab/workers/20251022_150000_TEMP_codex_task.md

        ✅ Job running in background
        ⏱️ High reasoning may take longer for thorough analysis
        💡 Use "check worker status" to monitor progress

User: [10 minutes later] check worker status

Claude: [Checks BashOutput]
        📊 Worker Progress:
        - Status: Running
        - Task: Refactor authentication system
        - Time elapsed: 9m 45s
        - Current step: Implementing token refresh logic...
        - Progress: ~75% (estimated)

User: [15 minutes later] worker done?

Claude: [Checks BashOutput]
        ✅ Worker completed successfully!
        📄 Report: .mahirolab/workers/20251022_150000_11223_codex_task.md

        Summary:
        - Files created: 3 (jwt_handler.py, token_manager.py, middleware.py)
        - Files modified: 5 (auth.py, routes.py, models.py, config.py, requirements.txt)
        - Tests created: 2 (test_jwt.py, test_auth_flow.py)
        - Security improvements: Token rotation, refresh tokens, secure storage
        - Next steps: Review security audit, update documentation
```

---

## Monitoring Commands

### Check Status

```
User: check research status
User: check worker status
User: show job status
User: what's running?
```

Claude uses `BashOutput` tool to display:
- Current execution state
- Time elapsed
- Latest output from codex
- Progress indicators (if available)

### Stop Job

```
User: stop research
User: stop worker
User: cancel job
User: kill background task
```

Claude uses `KillShell` tool to:
- Terminate the background process
- Confirm termination
- Report final status

---

## Comparison: Shortcodes vs Direct Scripts

| Feature | `rrresearch` / `www` | `.mahirolab/bin/codex-*.sh` |
|---------|---------------------|---------------------------|
| **Execution** | Through Claude (Bash tool) | Standalone shell script |
| **Visibility** | Visible in Claude UI | Not visible in Claude |
| **Monitoring** | Real-time via BashOutput | Manual (ps, tail) |
| **Control** | Can stop via KillShell | Manual (kill command) |
| **Session binding** | Tied to Claude session | Independent process |
| **Use case** | Interactive workflows | Automated/scripted workflows |
| **Template injection** | Yes | Yes |
| **Output format** | Same | Same |

---

## Best Practices

### When to Use Shortcodes

✅ **Use `rrresearch` / `www` when:**
- You want real-time monitoring during execution
- You're working interactively in Claude session
- You need ability to stop/control jobs
- You want visibility in Claude UI
- Task is part of active conversation

❌ **Use direct scripts when:**
- Running from CI/CD pipelines
- Scripting multiple jobs in bash
- Jobs should persist after Claude closes
- You don't need Claude monitoring
- Automation outside Claude context

### Monitoring Strategy

1. **Launch job:** Use shortcode with clear task description
2. **Get job ID:** Note the bash ID returned by Claude
3. **Periodic checks:** Ask Claude for status updates when needed
4. **Completion:** Claude confirms when job is done
5. **Review output:** Check generated file for results

### Error Handling

If job fails or gets stuck:

```
User: check worker status

Claude: ⚠️ Worker appears stuck
        Last output: [error message]
        Time since last update: 5 minutes

User: stop worker

Claude: ✅ Worker stopped
        Partial output saved to: [filename]
        Error: [description of what went wrong]
```

---

## Advanced Patterns

### Sequential Jobs

```
User: rrresearch "Best practices for React hooks 2025"
[wait for completion]
User: www medium "Update our codebase to follow best practices from research"
```

### Parallel Jobs (Multiple Shortcodes)

```
User: rrresearch "API security best practices"
User: www high "Security audit of current API implementation"
[both run in parallel]
```

### Integration with Workflow Shortcodes

```
User: ccc                   # Create context
User: nnn                   # Create plan
User: rrresearch "topic"    # Research for plan phase
[wait for research]
User: gogogo               # Execute plan with research insights
```

---

## Tips & Tricks

1. **Descriptive task names:** More detail = better Codex output
   - ❌ `www "fix bug"`
   - ✅ `www "fix authentication timeout bug in login flow"`

2. **Choose right reasoning level:**
   - Simple edits → `low`
   - Refactoring → `medium`
   - Architecture changes → `high`

3. **Monitor long tasks:** Don't forget about background jobs
   - Set reminders for long-running tasks
   - Check status periodically

4. **Review outputs:** Always review generated code/reports
   - Don't blindly trust Codex output
   - Validate changes before committing

5. **Clean up:** Regularly clean old files
   - Use `./codex-status.sh --stats`
   - Use `./codex-cleanup.sh` for maintenance

---

## Troubleshooting

### Job Not Starting

```
Error: Command failed to execute
Solution: Check that codex is installed and in PATH
```

### Can't Monitor Job

```
Error: bash_id not found
Solution: Job may have completed or crashed. Check .mahirolab/{type}/ directory
```

### Output File Not Created

```
Issue: TEMP file exists but not renamed
Solution: Codex may still be writing. Wait longer or check process with ps
```

---

## Summary

The `rrresearch` and `www` shortcodes provide Claude-managed execution of Codex jobs:

- **`rrresearch`**: Research with web search, medium reasoning, monitored by Claude
- **`www`**: Background worker with configurable reasoning, monitored by Claude

Both offer:
- Real-time monitoring
- Interactive control
- Integration with Claude session
- Template-based structured output

Choose shortcodes for interactive work, direct scripts for automation.

---

*Example Version: 1.0.0 | Updated: 2025-10-22*
