# Mahiro Lab - Claude-Codex Orchestrator

A powerful automation framework for orchestrating Claude AI tasks using direct process execution.

## Quick Start

```bash
# Run a quick task
.mahirolab/bin/codex-exec.sh "List all TypeScript files"

# Research with web search
.mahirolab/bin/codex-research.sh "Latest React 19 features"

# Launch background worker
.mahirolab/bin/codex-worker-launcher.sh high "Refactor authentication system"
```

## Shortcodes

Fast workflow management using communication protocol:

- **`ccc`** - Create context & compact conversation
- **`nnn`** - Smart planning (auto-runs ccc if needed)
- **`gogogo`** - Execute most recent plan
- **`rrr`** - Create session retrospective
- **`lll`** - List project status

## Documentation

📖 **[Complete Documentation](CLAUDE.md)** - Full architecture and usage guide

| Topic | Location |
|-------|----------|
| Shortcodes Reference | [`.mahirolab/docs/SHORTCODES.md`](.mahirolab/docs/SHORTCODES.md) |
| Project Structure | [`.mahirolab/docs/PROJECT_STRUCTURE.md`](.mahirolab/docs/PROJECT_STRUCTURE.md) |
| Git Commit Guide | [`.mahirolab/docs/COMMIT_GUIDE.md`](.mahirolab/docs/COMMIT_GUIDE.md) |

## Core Scripts

Located in `.mahirolab/bin/`:

- **`codex-exec.sh`** - Direct synchronous execution
- **`codex-research.sh`** - Web-enabled research with structured reports
- **`codex-worker-launcher.sh`** - Background workers with PID tracking
- **`codex-status.sh`** - Job monitoring dashboard
- **`codex-cleanup.sh`** - Automated cleanup utility

## Examples

Pre-built workflow examples in [`.mahirolab/examples/`](.mahirolab/examples/):

```bash
# Quick task
.mahirolab/examples/01-quick-task.sh

# Research workflow
.mahirolab/examples/02-research-workflow.sh

# Parallel workers
.mahirolab/examples/03-parallel-workers.sh

# Sequential pipeline
.mahirolab/examples/05-sequential-pipeline.sh
```

## Safety Notice

⚠️ All scripts run with `danger-full-access` permissions. Use only in isolated development environments.

## License

MIT
