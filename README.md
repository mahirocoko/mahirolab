# Mahiro Lab - Claude-Codex Orchestrator

A powerful automation framework for orchestrating Claude AI tasks using direct process execution with a modular tiered installation system.

## Installation

Choose your installation level:

### Level 1 - Minimal
Basic codex scripts for quick start (4 files)

```bash
curl -sSL https://raw.githubusercontent.com/mahirocoko/mahirolab/main/install.sh | bash -s -- --level=1
```

### Level 2 - Standard (Recommended)
Full `.mahirolab` structure with state management (15+ files)

```bash
curl -sSL https://raw.githubusercontent.com/mahirocoko/mahirolab/main/install.sh | bash -s -- --level=2
```

### Level 3 - Full
Everything in Level 2 + Git conventions, git hooks, and slash commands (21+ files)

```bash
curl -sSL https://raw.githubusercontent.com/mahirocoko/mahirolab/main/install.sh | bash -s -- --level=3
```

### Installation Options

```bash
# Install to specific directory
curl -sSL https://raw.githubusercontent.com/mahirocoko/mahirolab/main/install.sh | bash -s -- --level=2 --dir=~/my-project

# Dry run (preview without installing)
curl -sSL https://raw.githubusercontent.com/mahirocoko/mahirolab/main/install.sh | bash -s -- --level=2 --dry-run

# Show help
curl -sSL https://raw.githubusercontent.com/mahirocoko/mahirolab/main/install.sh | bash -s -- --help
```

## Git Hooks Setup

**Level 3 includes automatic git hooks installation!**

For Level 1/2 users, or to manually configure git hooks:

### Install Commit Validation Hook

```bash
# Install the commit-msg hook (automatic backup)
.mahirolab/bin/install-git-hooks.sh

# Force install without prompts
.mahirolab/bin/install-git-hooks.sh --force

# Skip backup creation
.mahirolab/bin/install-git-hooks.sh --no-backup
```

### What the Hook Does

The `commit-msg` hook automatically validates commit messages and blocks:

- AI attribution patterns (`"Generated with Claude"`, `"🤖 Generated"`)
- Bot signatures (`"Co-Authored-By: Claude"`, `"noreply@anthropic"`)
- Domain references (`"claude.com"`, `"anthropic.com"`)
- Generic AI mentions (`"AI generated"`, `"Assisted by"`)

**Test the hook:**
```bash
git commit -m "🤖 Generated with Claude: test message"
# ❌ This will be REJECTED
```

## Quick Start

### Level 1 (Minimal)
```bash
# Run a quick task
./codex-exec.sh "List all TypeScript files"

# Research with web search
./codex-research.sh "Latest React 19 features"
```

### Level 2+ (Standard/Full)
```bash
# Run a quick task
.mahirolab/bin/codex-exec.sh "List all TypeScript files"

# Research with web search
.mahirolab/bin/codex-research.sh "Latest React 19 features"

# Launch background worker
.mahirolab/bin/codex-worker-launcher.sh high "Refactor authentication system"
```

## What's Included

### Level 1 - Minimal
- `CLAUDE.md` - Simplified usage guide
- `README.md` - Installation documentation
- `codex-exec.sh` - Quick task execution
- `codex-research.sh` - Web-enabled research
- `codex_output/` - Research output directory

### Level 2 - Standard
Everything in Level 1 plus:
- **Full `.mahirolab/` structure** - Complete directory organization
- **5 Codex scripts** - exec, research, worker-launcher, status, cleanup
- **Documentation** - SHORTCODES.md, STATE_MANAGEMENT.md, PROJECT_STRUCTURE.md, COMMIT_GUIDE.md
- **Templates** - research-report.md, worker-task.md, code-review.md
- **State management** - Session continuity and progress tracking

### Level 3 - Full
Everything in Level 2 plus:
- **Git conventions** - COMMIT_GUIDE.md
- **Git hooks** - Automatic AI attribution validation in commits
- **Slash commands** - `/git:commit`, `/git:commit-push`
- **Team workflows** - Complete collaboration setup

## Shortcodes (Level 2+)

Fast workflow management using communication protocol:

### Core Workflow
- **`ccc`** - Create context & compact conversation
- **`nnn`** - Smart planning (auto-runs ccc if needed)
- **`gogogo`** - Execute most recent plan
- **`rrr`** - Create session retrospective
- **`lll`** - List project status

### Codex Integration
- **`rrresearch "topic"`** - Claude-managed research with web search
- **`www [reasoning] "task"`** - Claude-managed background worker

> 💡 **Difference:** Shortcodes are Claude-managed (visible in UI, can monitor/stop), while direct scripts run independently.

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
- **`install-git-hooks.sh`** - Git hooks installation and validation

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

## Features

✨ **Modular Installation** - Choose the right level for your needs
🚀 **One-line Install** - Get started in seconds with curl
📊 **State Management** - Session continuity and progress tracking (Level 2+)
🔄 **Background Workers** - Long-running tasks with monitoring
🔍 **Web Research** - AI-powered research with citations
📝 **Shortcode Protocol** - Fast workflow management (Level 2+)
🎯 **Git Integration** - Automated commit workflows and validation (Level 3)
🛡️ **Commit Validation** - AI attribution blocking with git hooks

## Safety Notice

⚠️ **All scripts run with `danger-full-access` permissions.**
Use only in isolated development environments. Never run on production systems or with sensitive data.

## References

This project builds upon and is inspired by:

- **Documentation Guidelines** - https://github.com/laris-co/alchemist
- **Codex Script Implementation** - https://github.com/laris-co/catlab-kit (Claude Code + Codex integration patterns)

## License

MIT
