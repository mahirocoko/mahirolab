# Claude-Codex Direct Execution

Simple wrapper scripts for running Codex CLI with custom reasoning levels and web search capabilities.

**Installation Level:** Minimal (Level 1)

## 🔴 Critical Safety Notice

**These scripts invoke `codex exec` with `danger-full-access`, granting unrestricted system permissions.**
- Run only inside isolated development environments that you control.
- Keep secrets, credentials, and private data out of scope for any Codex job.
- Review all generated code and files before using them in production.

## Core Idea: Direct Process Execution

Instead of using tmux send-keys to interact with Codex CLI, use direct process execution with `codex exec` for cleaner, faster, and more reliable automation.

**Benefits:**
- No terminal emulation latency or timing hacks
- Clean access to stdout/stderr plus exit codes for precise scripting
- Natural fit for CI/CD pipelines or higher-level orchestrators

### Baseline `codex exec` Usage

```bash
# Run directly with an explicit reasoning level
codex exec -s danger-full-access -c model_reasoning_effort="low" "Describe the task here"

# Examples
codex exec -s danger-full-access -c model_reasoning_effort="high" "Refactor the API"
codex exec -s danger-full-access -c model_reasoning_effort="low" "List all files in src/"
```

### Reasoning Level Cheat Sheet

| Level | Runtime | Best For |
|-------|---------|----------|
| `minimal` | ~5-10s | Trivial tasks, file listings |
| `low` | ~10-15s | Simple code changes, quick fixes |
| `medium` | ~15-25s | Moderate complexity, small features |
| `high` | ~30-60s+ | Large refactors, complex analyses |

## Helper Scripts

### `codex-exec.sh`

Thin wrapper for on-demand, synchronous commands.

**Usage:**
```bash
./codex-exec.sh [reasoning_level] "task description"
./codex-exec.sh "task description"  # defaults to low
```

**Examples:**
```bash
./codex-exec.sh "List all TypeScript files"
./codex-exec.sh low "Fix syntax errors in src/"
./codex-exec.sh high "Refactor authentication system"
```

**Options:**
- `--dry-run` / `-d` - Preview command without executing
- `--help` / `-h` - Show comprehensive help
- `--version` / `-v` - Show version information

**Output:** Streams directly to console, no files saved.

### `codex-research.sh`

Research assistant that enables web search and saves structured reports.

**Usage:**
```bash
./codex-research.sh "research topic"
```

**Examples:**
```bash
./codex-research.sh "Next.js 15 performance improvements"
./codex-research.sh "PostgreSQL vs MySQL comparison"
./codex-research.sh "Docker build cache best practices"
```

**Behavior:**
- Enables web search for latest information
- Forces `medium` reasoning level
- Saves markdown report to `codex_output/TIMESTAMP_topic_research.md`
- Includes direct URL citations (no markdown link titles)

**Output Location:** `codex_output/` directory (created automatically)

## Workflow Patterns

### Quick Tasks
Use `codex-exec.sh` synchronously for immediate results:
```bash
./codex-exec.sh "Update package.json dependencies"
./codex-exec.sh low "Format all Python files"
```

### Research & Analysis
Use `codex-research.sh` when you need latest information:
```bash
./codex-research.sh "React 19 new features"
./codex-research.sh "Kubernetes security best practices"
```

### Background Execution
Launch long-running tasks in background:
```bash
./codex-exec.sh high "Analyze entire codebase for security issues" &
```

Monitor with `jobs`, `wait`, or check output files.

## Best Practices

✅ **Do:**
- Match reasoning level to task complexity
- Review generated code before committing
- Use dry-run mode to preview commands
- Start with `low` reasoning and increase if needed

❌ **Don't:**
- Don't run with `danger-full-access` on production systems
- Don't expose secrets or credentials to Codex
- Don't skip reviewing generated code
- Don't use `high` reasoning for trivial tasks (wastes time)

## Upgrading

To upgrade to more features:
- **Level 2 (Standard):** Adds shortcode protocol, state management, and advanced workflows
- **Level 3 (Full):** Adds git conventions and commit automation

Visit the installation page to upgrade (requires reinstallation).

## Getting Help

- Run `./codex-exec.sh --help` for detailed usage
- Run `./codex-research.sh --help` for research options
- Check output logs in `codex_output/` directory

## Requirements

- [Codex CLI](https://github.com/anthropics/codex) installed and configured
- Bash shell (macOS/Linux)
- `curl` or `wget` for research script

---

**Installed:** {{DATE}}
**Version:** {{VERSION}}
**Level:** 1 (Minimal)
