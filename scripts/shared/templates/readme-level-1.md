# Mahiro Lab - Codex Integration (Level 1: Minimal)

> **Installation Level:** 1 (Minimal)
> **Last Updated:** 2025-01-03
> **Status:** Active

## Overview

Level 1 provides basic Codex CLI integration with direct execution and research capabilities. Perfect for quick tasks and getting started with Claude-Codex orchestration.

## What's Included

- ✅ **codex-exec.sh** - Direct task execution with custom reasoning levels
- ✅ **codex-research.sh** - Web-enabled research with structured reports
- ✅ **CLAUDE.md** - Complete usage documentation
- ✅ **codex_output/** - Output directory for research reports

## Quick Start

### Run a Quick Task
```bash
./codex-exec.sh "List all TypeScript files"
```

### Research a Topic
```bash
./codex-research.sh "Next.js 15 new features"
```

### Use Different Reasoning Levels
```bash
./codex-exec.sh low "Quick file listing"
./codex-exec.sh high "Complex refactoring task"
```

## Reasoning Levels

- `minimal` - Fastest (~5-10s) for trivial tasks
- `low` - Balanced speed and depth (~10-15s)
- `medium` - Default choice for moderate complexity (~15-25s)
- `high` - Deepest reasoning for large refactors (~30-60s+)

## Examples

### Example 1: Quick Task Execution
```bash
./codex-exec.sh "Update package.json dependencies"
```

### Example 2: Research Latest Information
```bash
./codex-research.sh "Docker build cache best practices"
```

### Example 3: Preview Commands with Dry-Run
```bash
./codex-exec.sh --dry-run "Refactor authentication"
```

## Documentation

- **CLAUDE.md** - Complete usage guide and examples
- **codex-exec.sh --help** - Command-line help for task execution
- **codex-research.sh --help** - Command-line help for research

## Output Files

Research reports are saved to `codex_output/` with timestamps:
```
codex_output/
└── 20250103_143000_docker_build_cache_best_practices_research.md
```

## Upgrading

**Current Level:** 1 (Minimal)

To upgrade to more features:
- **Level 2 (Standard):** Adds shortcode protocol, state management, worker scripts, and advanced workflows
- **Level 3 (Full):** Adds git conventions, commit automation, and slash commands

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
- Review example commands above
- Visit the GitHub repository for updates

---

**Generated with Mahiro Lab Codex Integration**
