# Mahiro Lab - Codex Integration (Level 3: Full)

> **Installation Level:** 3 (Full) - Complete Experience
> **Last Updated:** 2025-01-03
> **Status:** Active

## Overview

Level 3 provides the complete Mahiro Lab experience with all Level 2 features PLUS git automation and conventional commit standards. Perfect for professional development with automated git workflows.

## What's Included

- ✅ **All Level 2 features** (shortcodes, state management, workers)
- ✅ **Git Commit Automation** - Slash commands for commits
- ✅ **Conventional Commits** - Standardized commit message format
- ✅ **Emoji Guide** - Visual commit type indicators
- ✅ **Commit Guide** - Comprehensive standards and examples
- ✅ **Pre-commit Hooks** - Optional automated validation
- ✅ **Co-authoring** - Claude credits in commits

## Quick Start with Git Automation

### Complete Workflow with Git Automation
```bash
# In Claude Code chat:
lll                           # Check status
ccc                           # Create context
nnn                           # Create plan
gogogo                        # Execute plan

# When ready to commit:
/git:commit                   # Stage and commit with proper format
/git:commit-push              # Commit and push to remote
```

### Git Commit Standards
All commits follow conventional commit format with emojis:
- `feat: ✨ Add new feature`
- `fix: 🐛 Fix bug`
- `docs: 📝 Update documentation`
- `style: 💄 Format code`
- `refactor: ♻️ Refactor code`
- `test: ✅ Add tests`
- `chore: 🔧 Update configuration`

See `.mahirolab/docs/COMMIT_GUIDE.md` for complete guide.

## Git Slash Commands

| Command | Purpose | What it Does |
|---------|---------|--------------|
| `/git:commit` | Create commit | Analyzes changes, drafts message, stages and commits |
| `/git:commit-push` | Commit and push | Same as commit + pushes to remote |

## Typical Workflow

```bash
# Full session with git automation
ccc → nnn → gogogo → /git:commit → /git:commit-push
```

## Examples

### Example 1: Full Session with Git Automation
```bash
# In Claude Code chat:
ccc → nnn → gogogo → /git:commit → /git:commit-push
```

### Example 2: Conventional Commit Examples
```bash
feat: ✨ Add user authentication
fix: 🐛 Fix login bug
docs: 📝 Update API documentation
refactor: ♻️ Simplify error handling
```

### Example 3: Automated Commit Flow
```bash
# Make changes, then in Claude Code chat:
/git:commit

# Claude will:
# 1. Run git status and git diff
# 2. Analyze changes
# 3. Draft conventional commit message
# 4. Stage and commit with proper format
# 5. Add Claude co-author tag
```

## Documentation

- **CLAUDE.md** - Complete usage guide with all features
- **.mahirolab/docs/COMMIT_GUIDE.md** - Git commit standards
- **.mahirolab/docs/SHORTCODES.md** - Shortcode reference
- **.mahirolab/docs/STATE_MANAGEMENT.md** - State system
- **.claude/commands/git/** - Git slash command definitions

## Directory Structure

```
.mahirolab/
├── bin/                      # Executable scripts (5 scripts)
├── docs/                     # Documentation
│   ├── SHORTCODES.md
│   ├── STATE_MANAGEMENT.md
│   ├── PROJECT_STRUCTURE.md
│   └── COMMIT_GUIDE.md      # ← Git commit standards
├── templates/                # Output templates
├── research/                 # Research outputs
├── workers/                  # Worker outputs
└── state/                    # Session state

.claude/
└── commands/
    └── git/
        ├── commit.md         # ← /git:commit command
        └── commit-push.md    # ← /git:commit-push command
```

## Git Commit Types

| Type | Emoji | Description | Example |
|------|-------|-------------|---------|
| `feat` | ✨ | New feature | `feat: ✨ Add user dashboard` |
| `fix` | 🐛 | Bug fix | `fix: 🐛 Fix memory leak` |
| `docs` | 📝 | Documentation | `docs: 📝 Update README` |
| `style` | 💄 | Code formatting | `style: 💄 Format with prettier` |
| `refactor` | ♻️ | Code refactoring | `refactor: ♻️ Simplify auth logic` |
| `perf` | ⚡ | Performance improvement | `perf: ⚡ Optimize database queries` |
| `test` | ✅ | Add/update tests | `test: ✅ Add auth tests` |
| `build` | 👷 | Build system | `build: 👷 Update webpack config` |
| `ci` | 💚 | CI/CD changes | `ci: 💚 Add GitHub Actions` |
| `chore` | 🔧 | Maintenance | `chore: 🔧 Update dependencies` |

## Key Features

### Automated Git Workflow
- **Smart Commit Messages** - Claude analyzes changes and drafts messages
- **Conventional Format** - Follows industry-standard commit conventions
- **Emoji Indicators** - Visual commit type identification
- **Co-author Attribution** - Claude gets credit for assisted commits
- **Pre-commit Validation** - Optional hooks for quality checks

### All Level 2 Features
- Shortcode protocol (ccc, nnn, gogogo, rrr, lll)
- State management with session continuity
- Background workers with monitoring
- Progress tracking and analytics
- Complete documentation

## Commit Examples

### Feature Addition
```
feat: ✨ Add user authentication system

Implement JWT-based authentication with:
- Login/logout endpoints
- Token refresh mechanism
- Password hashing with bcrypt
- Session management

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Bug Fix
```
fix: 🐛 Fix memory leak in WebSocket connections

Properly close connections and clear event listeners
on component unmount to prevent memory accumulation.

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Current Level

**Current Level:** 3 (Full) 🎉

You have the complete Mahiro Lab Codex Integration with all features:
- ✅ Direct codex execution
- ✅ Web-enabled research
- ✅ Shortcode protocol
- ✅ State management
- ✅ Background workers
- ✅ Git automation

This is the highest installation level. Enjoy! 🚀

## Safety Notice

⚠️ Scripts use `danger-full-access` mode which grants unrestricted system permissions.

**Run only in isolated development environments:**
- Keep secrets and credentials out of scope
- Review generated code before committing
- Use in controlled environments only
- **NEVER** run force push to main/master without explicit intent
- **NEVER** skip git hooks unless explicitly needed

## Support

For issues or questions:
- Check **CLAUDE.md** for detailed documentation
- Review **.mahirolab/docs/COMMIT_GUIDE.md** for git standards
- Check **.mahirolab/docs/** for specific guides
- Visit the GitHub repository for updates

---

**Generated with Mahiro Lab Codex Integration**
