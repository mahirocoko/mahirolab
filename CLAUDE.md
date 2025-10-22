# Claude-Codex Orchestrator/Worker Architecture

## 📖 Document Map

| What You Need | Go To |
| --- | --- |
| **Quick start with shortcodes** (ccc, nnn, gogogo, rrr, lll, rrresearch, www) | [`.mahirolab/docs/SHORTCODES.md`](.mahirolab/docs/SHORTCODES.md) |
| **State management & session continuity** (versioning, progress tracking, analytics) | [`.mahirolab/docs/STATE_MANAGEMENT.md`](.mahirolab/docs/STATE_MANAGEMENT.md) |
| **Complete project overview** (directory layout, all scripts, workflows) | [`.mahirolab/docs/PROJECT_STRUCTURE.md`](.mahirolab/docs/PROJECT_STRUCTURE.md) |
| **Git commit standards** (conventional commits, emoji guide) | [`.mahirolab/docs/COMMIT_GUIDE.md`](.mahirolab/docs/COMMIT_GUIDE.md) |
| **Core script usage** (codex-exec, codex-research, codex-worker-launcher) | [Helper Scripts](#helper-scripts) below |
| **Example workflows** (quick tasks, research, parallel workers, pipelines) | [`.mahirolab/examples/README.md`](.mahirolab/examples/README.md) |
| **Report templates** (research, worker tasks, code reviews) | [`.mahirolab/templates/README.md`](.mahirolab/templates/README.md) |
| **Utility tools** (status dashboard, cleanup, maintenance) | [New Utility Scripts](#new-utility-scripts) below |

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
Three bash wrappers tailor `codex exec` to complementary workflows:
1. **Direct execution** for immediate, synchronous tasks.
2. **Research mode** that enables web search and enforces a structured report.
3. **Background workers** that keep long jobs running while persisting logs with process identifiers.

## Helper Scripts

All scripts located in `.mahirolab/bin/`

### `codex-exec.sh`
- **Role:** Thin wrapper for on-demand, synchronous commands.
- **Usage:** `.mahirolab/bin/codex-exec.sh [reasoning_level] "task"` (single argument defaults to `low`).
- **New Features:**
  - `--dry-run` / `-d` - Preview command without executing
  - `--help` / `-h` - Comprehensive help with examples
  - `--version` / `-v` - Show version information
- **Behavior:** Prints colorized status, forwards the prompt to `codex exec`, and always enables `danger-full-access`.
- **Output:** Streams stdout/stderr to the console without saving files—ideal for quick experiments you want to supervise manually.
- **Ad-hoc backgrounding:** Append `&` to launch in the background (for example, `./codex-exec.sh high "Analyze large dataset" &`) and manage the job yourself with `jobs`, `wait`, or `tail`.

### `codex-research.sh`
- **Role:** Research assistant that turns on the `web_search` tool and captures results.
- **Usage:** `./codex-research.sh "research topic"` (required argument).
- **Behavior:**
  - Sanitizes the topic into a slug, prepends a timestamp, and ensures `.mahirolab/research/` exists.
  - **Auto-loads template** from `.mahirolab/templates/research-report.md` if available.
  - Injects template structure into prompt with variable substitution ({{TOPIC}}, {{DATE}}, {{REASONING_LEVEL}}).
  - Supplies a fixed prompt template enforcing sections such as Executive Summary and Key Findings, plus plain-URL citations.
  - Forces `model_reasoning_effort="medium"` and runs with `danger-full-access`.
- **Output:** Markdown report saved once Codex honors the `Save output to:` instruction (the agent replaces `PLACEHOLDER` with its own PID).
- **Follow-up:** Review the generated file in `.mahirolab/research/` to validate citations, section order, and completeness before sharing.

### `codex-worker-launcher.sh`
- **Role:** Background orchestrator that embeds the originating Bash PID in the final filename.
- **Usage:**
  - Full form: `./codex-worker-launcher.sh [reasoning_level] [output_type] "task"`.
  - Shorthand: `./codex-worker-launcher.sh "task"` (defaults to `low` reasoning and `workers` output type).
- **Behavior:**
  - Creates a timestamped temp file under `.mahirolab/<output_type>/`.
  - **Auto-loads template** from `.mahirolab/templates/worker-task.md` if available.
  - Injects template with pre-filled metadata ({{TASK_DESCRIPTION}}, {{START_TIME}}, {{REASONING_LEVEL}}).
  - Spawns `codex exec` in a subshell, captures the Bash PID, and waits for the agent to write the temp file.
  - Renames the file to `<timestamp>_<bashpid>_codex_task.md` for traceability once writing finishes.
- **Suggested monitoring pattern:**
  1. Launch the worker and note the printed Bash PID.
  2. Avoid polling until a user or downstream system requests results.
  3. When prompted, open or tail the persisted file to inspect progress or the final log.
  4. Optionally verify the exit code to confirm success vs. failure.
- **Best fit:** Medium/high reasoning jobs, long analyses, and orchestrations that require stable filenames for later automation.

## Workflow Patterns
- **Quick fixes / short edits:** Run `codex-exec.sh` synchronously.
- **Research with citations:** Use `codex-research.sh` and review the generated Markdown report.
- **Long-running or parallel jobs:** Prefer `codex-worker-launcher.sh` so each worker produces a timestamped log tagged with a PID.
- **Parallel execution:** Launch multiple Codex runs (`codex exec ... &` or several worker launchers) and `wait` for completion when you need synchronization.
- **Manual background management:** If you background `codex exec` or `codex-exec.sh` directly, record the job ID and only check in when required to avoid unnecessary polling.

## Best Practices & Safety Checklist
- Match reasoning effort to task size: keep `minimal/low` tasks in the foreground, consider backgrounding for `medium`, and default to backgrounding for `high`.
- After starting any background job, pause monitoring until someone explicitly asks for status to reduce noise and resource churn.
- Inspect exit codes for every completed job (0 = success, non-zero = failure) and review diffs before committing file changes.
- Scope Codex's accessible directories wherever possible, especially for sensitive repositories.
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

## State Management & Session Continuity

### Overview
The `.mahirolab` architecture includes comprehensive state management for tracking session history, progress, and analytics.

**Key Features:**
- **Context Versioning** - Every session creates a versioned context snapshot
- **Progress Tracking** - Real-time task execution monitoring with timestamps and ETA
- **Session Continuity** - Seamlessly continue from previous sessions or start fresh
- **State Analytics** - Productivity metrics, success rates, and time tracking
- **Archive Policy** - Safe data preservation without automatic deletion

### Directory Structure

```
.mahirolab/state/
├── context.md                    # Current session context
├── context_history/              # Versioned context snapshots
├── plans/                        # Implementation plans
├── retrospectives/               # Session retrospectives
├── progress.md                   # Real-time execution progress
├── execution_log.md              # Detailed event timeline
└── archive/                      # Archived old files
```

### Template Auto-Injection

Scripts automatically inject templates for consistent output:
- **`codex-research.sh`** - Uses `.mahirolab/templates/research-report.md`
- **`codex-worker-launcher.sh`** - Uses `.mahirolab/templates/worker-task.md`
- Templates support variable substitution: `{{TOPIC}}`, `{{DATE}}`, `{{REASONING_LEVEL}}`
- Graceful fallback if templates are missing

### Session Workflow

**Typical Session:**
```bash
lll                    # Check project status and history
ccc                    # Continue from previous session or start fresh
nnn                    # Create implementation plan (auto-references context)
gogogo                 # Execute plan with real-time progress tracking
rrr                    # Create retrospective at session end
```

**Session Continuity:**
- `ccc` detects existing context and prompts: "Continue or Start Fresh?"
- If continuing: Shows diff, merges with previous session
- If fresh: Archives old context, creates new one
- All contexts versioned in `context_history/`

### Progress Tracking

During `gogogo` execution:
- Real-time updates to `progress.md`
- Timestamp tracking for every task
- Progress bars for overall and per-phase status
- ETA calculation based on completed tasks
- Detailed logging to `execution_log.md`

### State Analytics

View productivity metrics with `lll`:
- Tasks completed vs. total
- Success rate percentage
- Average task duration
- Session velocity (tasks/hour)
- Storage usage and growth trends

**For complete details**, see [`.mahirolab/docs/STATE_MANAGEMENT.md`](.mahirolab/docs/STATE_MANAGEMENT.md)

## New Utility Scripts

### `codex-status.sh`
- **Role:** Job monitoring dashboard for all Codex tasks.
- **Usage:** `./codex-status.sh [options]`
- **Features:**
  - View all running and completed jobs
  - Filter by type (workers, research)
  - Show statistics (file count, disk usage)
  - Display job age and size information
- **Options:** `--all`, `--workers`, `--research`, `--latest N`, `--stats`

### `codex-cleanup.sh`
- **Role:** Automated cleanup and maintenance utility.
- **Usage:** `./codex-cleanup.sh [options]`
- **Features:**
  - Delete old files (default: 7+ days)
  - Compress aging files (3+ days)
  - Storage statistics and analysis
  - Dry-run mode for safety
- **Options:** `--dry-run`, `--age DAYS`, `--compress-only`, `--stats`, `--force`

## Examples Library

Pre-built example scripts in `.mahirolab/examples/`:
- `01-quick-task.sh` - Basic synchronous execution
- `02-research-workflow.sh` - Web-enabled research
- `03-parallel-workers.sh` - Concurrent background tasks
- `04-mixed-reasoning-levels.sh` - Reasoning strategy guide
- `05-sequential-pipeline.sh` - Chained dependent tasks

Each example includes:
- Clear documentation and usage
- Best practice demonstrations
- Tips and recommendations
- Executable bash scripts

## Templates Library

Markdown templates in `.mahirolab/templates/` (for manual reference):
- `research-report.md` - Structured research output
- `worker-task.md` - Background task reports
- `code-review.md` - Comprehensive code reviews

Templates are **reference-only** and not automatically integrated with scripts. Use them manually by:
- Copying template structure into prompts
- Referencing format in task descriptions
- Using as documentation guidelines

## Maintenance & Hardening

### ✅ Completed
- ✅ Job monitoring dashboard (`codex-status.sh`)
- ✅ Log rotation and cleanup utility (`codex-cleanup.sh`)
- ✅ Dry-run mode for codex-exec.sh
- ✅ Comprehensive help and examples
- ✅ Communication protocol with shortcodes
- ✅ State management system (`.mahirolab/state/`)

### 💡 Future Ideas
- Template integration with research/worker scripts
- Pipeline orchestration (YAML-based workflows)
- Retry logic with exponential backoff
- Web UI for job monitoring
- Metrics and analytics dashboard

---

## Communication Protocol

For efficient collaboration between User and Claude, use **Shortcodes** defined in [`.mahirolab/docs/SHORTCODES.md`](.mahirolab/docs/SHORTCODES.md):

### Core Workflow Shortcodes
- **`ccc`** - Create context & compact conversation
- **`nnn`** - Smart planning (auto-runs ccc if needed)
- **`gogogo`** - Execute most recent plan
- **`rrr`** - Create session retrospective
- **`lll`** - List project status

### Codex Integration Shortcodes (NEW)
- **`rrresearch "topic"`** - Claude-managed research with web search
  - Runs codex research in background with monitoring
  - Always uses `medium` reasoning + web search enabled
  - Output: `.mahirolab/research/YYYYMMDD_HHMMSS_PLACEHOLDER_codex_{topic}.md`
  - Check status anytime with "check research status"

- **`www [reasoning] "task"`** - Claude-managed background worker
  - Runs codex worker in background with monitoring
  - Reasoning levels: minimal | low (default) | medium | high
  - Output: `.mahirolab/workers/YYYYMMDD_HHMMSS_TEMP_codex_task.md`
  - Check status anytime with "check worker status"

**Key Difference from Direct Scripts:**
- `rrresearch` / `www` = Claude-managed (visible in Claude UI, can monitor/stop via BashOutput/KillShell)
- `.mahirolab/bin/codex-*.sh` = Standalone (runs independent of Claude session)

### 🔴 CRITICAL SHORTCODE REQUIREMENT

**MANDATORY PRE-EXECUTION STEP:**

Before processing ANY shortcode invocation, Claude **MUST**:

1. **Check if [`.mahirolab/docs/SHORTCODES.md`](.mahirolab/docs/SHORTCODES.md) has been read in the current session**
2. **If NOT read yet → Read it IMMEDIATELY before executing the shortcode**
3. **Follow the exact specification** defined in that file for the invoked shortcode

**This requirement is non-negotiable and overrides all default behaviors.**

**Why this matters:**
- Shortcodes have precise output formats and file save locations
- Each shortcode has specific mandatory steps that must not be skipped
- Consistency across sessions depends on following exact specifications
- State management requires files to be created in correct locations

**Execution flow:**
```
User invokes shortcode (e.g., "ccc")
  ↓
Claude checks: "Have I read SHORTCODES.md this session?"
  ↓
NO → Read .mahirolab/docs/SHORTCODES.md NOW
  ↓
Execute shortcode per specification
  ↓
Create required files in .mahirolab/state/
  ↓
Show brief summary to user
```

These shortcodes enable quick, consistent workflow management without verbose instructions. All state files are stored in `.mahirolab/state/` for persistence across sessions.
