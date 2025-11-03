# Mahiro Lab - Codex Integration (Level 2: Standard)

> **Installation Level:** 2 (Standard) - Recommended
> **Last Updated:** 2025-01-03
> **Status:** Active

## Overview

Level 2 provides the complete Mahiro Lab experience with shortcode protocol, state management, and background workers. Ideal for serious development workflows with Claude Code.

## What's Included

- ✅ **All Level 1 features** (codex-exec, codex-research)
- ✅ **Shortcode Protocol** (ccc, nnn, gogogo, rrr, lll, rrresearch, www)
- ✅ **State Management** - Session context, plans, progress tracking
- ✅ **5 Bin Scripts** - Full suite of worker and utility scripts
- ✅ **Complete Documentation** - Detailed guides for all features
- ✅ **Template System** - Structured output for research and tasks
- ✅ **Background Jobs** - Claude-managed workers with monitoring

## Quick Start with Shortcodes

### Create Session Context
```bash
# In Claude Code chat, type:
ccc
```

### Create Implementation Plan
```bash
# In Claude Code chat, type:
nnn
```

### Execute the Plan
```bash
# In Claude Code chat, type:
gogogo
```

### Run Background Research
```bash
# In Claude Code chat, type:
rrresearch "React 19 new features"
```

### Run Background Worker
```bash
# In Claude Code chat, type:
www medium "Refactor authentication system"
```

## Shortcode Reference

| Shortcode | Purpose | Usage |
|-----------|---------|-------|
| `lll` | List project status | Check progress, git status, recent activity |
| `ccc` | Create context | Summarize session with continuity support |
| `nnn` | Create plan | Smart planning with prerequisites |
| `gogogo` | Execute plan | Run plan with real-time progress tracking |
| `rrr` | Retrospective | Create comprehensive session summary |
| `rrresearch` | Research | Claude-managed research with web search |
| `www` | Worker | Claude-managed background worker |

## Typical Workflow

```bash
lll                    # Check project status
ccc                    # Create session context
nnn                    # Create implementation plan
gogogo                 # Execute plan step-by-step
rrr                    # Create retrospective
```

## Examples

### Example 1: Typical Session Workflow
```bash
# In Claude Code chat:
lll → ccc → nnn → gogogo → rrr
```

### Example 2: Background Research
```bash
# In Claude Code chat:
rrresearch "Docker build cache best practices"
```

### Example 3: Check Project Status
Shows comprehensive dashboard with progress bars, git status, and recent activity.
```bash
# In Claude Code chat:
lll
```

## Documentation

- **CLAUDE.md** - Complete usage guide with shortcode protocol
- **.mahirolab/docs/SHORTCODES.md** - Shortcode reference guide
- **.mahirolab/docs/STATE_MANAGEMENT.md** - State system documentation
- **.mahirolab/docs/PROJECT_STRUCTURE.md** - Directory layout guide
- **.mahirolab/bin/* --help** - Command-line help for each script

## Directory Structure

```
.mahirolab/
├── bin/                      # Executable scripts
│   ├── codex-exec.sh
│   ├── codex-research.sh
│   ├── codex-worker-launcher.sh
│   ├── codex-status.sh
│   └── codex-cleanup.sh
├── docs/                     # Documentation
│   ├── SHORTCODES.md
│   ├── STATE_MANAGEMENT.md
│   ├── PROJECT_STRUCTURE.md
│   └── COMMIT_GUIDE.md
├── templates/                # Output templates
│   ├── research-report.md
│   ├── worker-task.md
│   └── code-review.md
├── research/                 # Research outputs
├── workers/                  # Worker outputs
└── state/                    # Session state
    ├── context.md
    ├── context_history/
    ├── plans/
    ├── retrospectives/
    ├── progress.md
    └── execution_log.md
```

## Key Features

### State Management
- **Session Continuity** - Continue from previous sessions or start fresh
- **Context Versioning** - Every session creates a versioned snapshot
- **Progress Tracking** - Real-time task execution with timestamps and ETA
- **Analytics** - Productivity metrics, success rates, time tracking

### Background Workers
- **Claude-Managed** - Visible in Claude UI, can monitor/stop anytime
- **Progress Monitoring** - Check status with "check worker status"
- **Configurable Reasoning** - Choose minimal/low/medium/high per task

### Shortcode Protocol
- **Efficient Communication** - Quick commands without verbose instructions
- **Consistent Workflows** - Standardized session management
- **Session Tracking** - All state files in `.mahirolab/state/`

## Upgrading

**Current Level:** 2 (Standard)

To upgrade to Level 3 (Full):
- Adds git commit conventions and automation
- Slash commands for git operations (/git:commit, /git:commit-push)
- Comprehensive commit guide with emoji standards

Visit the installation page to upgrade (requires reinstallation).

## Safety Notice

⚠️ Scripts use `danger-full-access` mode which grants unrestricted system permissions.

**Run only in isolated development environments:**
- Keep secrets and credentials out of scope
- Review generated code before committing
- Use in controlled environments only

## Support

For issues or questions:
- Check **CLAUDE.md** for detailed documentation
- Review **.mahirolab/docs/** for specific guides
- Visit the GitHub repository for updates

---

**Generated with Mahiro Lab Codex Integration**
