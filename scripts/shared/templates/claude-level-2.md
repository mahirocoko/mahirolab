# Claude-Codex Orchestrator/Worker Architecture

**Installation Level:** Standard (Level 2)

## 📖 Document Map

| What You Need | Go To |
| --- | --- |
| **Quick start with shortcodes** (ccc, nnn, gogogo, rrr, lll, rrresearch, www) | [`.mahirolab/docs/SHORTCODES.md`](.mahirolab/docs/SHORTCODES.md) |
| **State management & session continuity** (versioning, progress tracking, analytics) | [`.mahirolab/docs/STATE_MANAGEMENT.md`](.mahirolab/docs/STATE_MANAGEMENT.md) |
| **Core script usage** (codex-exec, codex-research, codex-worker-launcher) | [Helper Scripts](#helper-scripts) below |
| **Utility tools** (status dashboard, cleanup, maintenance) | [Utility Scripts](#utility-scripts) below |

## 🔴 Critical Safety Notice

**All helper scripts invoke `codex exec` with `danger-full-access`, granting unrestricted system permissions.**
- Run only inside isolated development environments that you control.
- Keep secrets, credentials, and private data out of scope for any Codex job.
- Consider adding allowlists or permission guards before sharing these scripts with others.
- Inspect everything Codex writes under `.mahirolab/**` in case unexpected files or code appear.

## Core Idea: Direct Process Execution

Replacing `tmux send-keys` with direct `codex exec` calls makes automation faster, more reliable, and easier to integrate with tooling.
- No terminal emulation latency or timing hacks.
- Clean access to stdout/stderr plus exit codes for precise scripting.
- Natural fit for CI/CD pipelines or higher-level orchestrators.

### Baseline `codex exec` Usage
```bash
# Run directly with an explicit reasoning level
codex exec -s danger-full-access -c model_reasoning_effort="low" "Describe the task here"

# Examples
codex exec -s danger-full-access -c model_reasoning_effort="high" "Refactor the API to use TypeScript interfaces"
codex exec -s danger-full-access -c model_reasoning_effort="low" "List all files in src/"
```

### Reasoning Level Cheat Sheet (approximate runtimes)
- `minimal` – fastest (~5-10s) for trivial tasks.
- `low` – balanced speed and depth (~10-15s).
- `medium` – default choice for moderate complexity (~15-25s).
- `high` – deepest reasoning for large refactors or analyses (~30-60s+).

## Architecture Overview
Five bash scripts tailor `codex exec` to complementary workflows:
1. **Direct execution** for immediate, synchronous tasks.
2. **Research mode** that enables web search and enforces a structured report.
3. **Background workers** that keep long jobs running while persisting logs with process identifiers.
4. **Status dashboard** for monitoring all Codex jobs.
5. **Cleanup utility** for managing old logs and disk space.

## Helper Scripts

All scripts located in `.mahirolab/bin/`

### `codex-exec.sh`
- **Role:** Thin wrapper for on-demand, synchronous commands.
- **Usage:** `.mahirolab/bin/codex-exec.sh [reasoning_level] "task"` (single argument defaults to `low`).
- **Features:**
  - `--dry-run` / `-d` - Preview command without executing
  - `--help` / `-h` - Comprehensive help with examples
  - `--version` / `-v` - Show version information
- **Behavior:** Prints colorized status, forwards the prompt to `codex exec`, and always enables `danger-full-access`.
- **Output:** Streams stdout/stderr to the console without saving files—ideal for quick experiments.

### `codex-research.sh`
- **Role:** Research assistant that turns on the `web_search` tool and captures results.
- **Usage:** `.mahirolab/bin/codex-research.sh "research topic"` (required argument).
- **Behavior:**
  - Sanitizes the topic into a slug, prepends a timestamp, and ensures `.mahirolab/research/` exists.
  - **Auto-loads template** from `.mahirolab/templates/research-report.md` if available.
  - Injects template structure into prompt with variable substitution ({{TOPIC}}, {{DATE}}, {{REASONING_LEVEL}}).
  - Forces `model_reasoning_effort="medium"` and runs with `danger-full-access`.
- **Output:** Markdown report saved to `.mahirolab/research/TIMESTAMP_PLACEHOLDER_codex_topic.md`.

### `codex-worker-launcher.sh`
- **Role:** Background orchestrator that embeds the originating Bash PID in the final filename.
- **Usage:**
  - Full form: `.mahirolab/bin/codex-worker-launcher.sh [reasoning_level] [output_type] "task"`.
  - Shorthand: `.mahirolab/bin/codex-worker-launcher.sh "task"` (defaults to `low` reasoning and `workers` output type).
- **Behavior:**
  - Creates a timestamped temp file under `.mahirolab/<output_type>/`.
  - **Auto-loads template** from `.mahirolab/templates/worker-task.md` if available.
  - Spawns `codex exec` in a subshell, captures the Bash PID, and waits for completion.
  - Renames to `<timestamp>_<bashpid>_codex_task.md` for traceability.
- **Best fit:** Medium/high reasoning jobs, long analyses, parallel orchestrations.

### `codex-status.sh`
- **Role:** Job monitoring dashboard for all Codex tasks.
- **Usage:** `.mahirolab/bin/codex-status.sh [options]`
- **Features:**
  - View all running and completed jobs
  - Filter by type (workers, research)
  - Show statistics (file count, disk usage)
  - Display job age and size information
- **Options:** `--all`, `--workers`, `--research`, `--latest N`, `--stats`

### `codex-cleanup.sh`
- **Role:** Automated cleanup and maintenance utility.
- **Usage:** `.mahirolab/bin/codex-cleanup.sh [options]`
- **Features:**
  - Delete old files (default: 7+ days)
  - Compress aging files (3+ days)
  - Storage statistics and analysis
  - Dry-run mode for safety
- **Options:** `--dry-run`, `--age DAYS`, `--compress-only`, `--stats`, `--force`

## Workflow Patterns
- **Quick fixes / short edits:** Run `codex-exec.sh` synchronously.
- **Research with citations:** Use `codex-research.sh` and review the generated Markdown report.
- **Long-running or parallel jobs:** Prefer `codex-worker-launcher.sh` so each worker produces a timestamped log.
- **Monitor jobs:** Use `codex-status.sh` to see all active and completed tasks.
- **Clean up old files:** Run `codex-cleanup.sh` periodically to manage disk space.

## Communication Protocol

For efficient collaboration between User and Claude, use **Shortcodes** defined in [`.mahirolab/docs/SHORTCODES.md`](.mahirolab/docs/SHORTCODES.md):

### Core Workflow Shortcodes
- **`ccc`** - Create context & compact conversation
- **`nnn`** - Smart planning (auto-runs ccc if needed)
- **`gogogo`** - Execute most recent plan
- **`rrr`** - Create session retrospective
- **`lll`** - List project status

### Codex Integration Shortcodes
- **`rrresearch "topic"`** - Claude-managed research with web search
- **`www [reasoning] "task"`** - Claude-managed background worker

These shortcodes enable quick, consistent workflow management without verbose instructions. All state files are stored in `.mahirolab/state/` for persistence across sessions.

## State Management & Session Continuity

The `.mahirolab/state/` directory provides comprehensive session tracking:

**Key Features:**
- **Context Versioning** - Every session creates a versioned context snapshot
- **Progress Tracking** - Real-time task execution monitoring with timestamps
- **Session Continuity** - Seamlessly continue from previous sessions or start fresh
- **Analytics** - Productivity metrics, success rates, and time tracking
- **Archive Policy** - Safe data preservation without automatic deletion

See [`.mahirolab/docs/STATE_MANAGEMENT.md`](.mahirolab/docs/STATE_MANAGEMENT.md) for complete details.

## Best Practices & Safety Checklist
- Match reasoning effort to task size: keep `minimal/low` tasks in the foreground, background `medium/high`.
- Pause monitoring until someone explicitly asks for status to reduce noise.
- Inspect exit codes for every completed job (0 = success, non-zero = failure).
- Review diffs before committing file changes.
- Scope Codex's accessible directories wherever possible.
- Treat all generated artifacts as untrusted until you audit them.

## Verified Capabilities
- ✅ Non-interactive `codex exec` flows
- ✅ Automated code modifications (including git patches)
- ✅ Unit tests, API endpoints, and large-scale refactors
- ✅ Structured research reports with plain-URL citations
- ✅ Parallel or long-running workers with PID-tagged logs
- ✅ Template auto-injection for consistent output formatting
- ✅ State management with context versioning
- ✅ Session continuity and progress tracking

## Upgrading

To upgrade to Level 3 (Full):
- Adds git commit conventions and standards
- Adds `.claude/commands/git/` slash commands
- Adds `COMMIT_GUIDE.md` documentation

Visit the installation page to upgrade (requires reinstallation).

---

**Installed:** {{DATE}}
**Version:** {{VERSION}}
**Level:** 2 (Standard)
