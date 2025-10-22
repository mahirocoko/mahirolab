# Shortcode Reference Card

**Quick reference for mahiro-lab shortcode protocol**

---

## Core Shortcodes

### `ccc` - Create Context & Compact

**Purpose:** Create/refresh session context

**Usage:** Type `ccc` in Claude Code

**What it does:**
- Creates `.mahirolab/state/context.md`
- Summarizes conversation
- Sets goals and next steps
- Creates versioned snapshot in `context_history/`

**Example Output:**
```markdown
# Session Context
**Date:** 2025-10-22
**Session ID:** 20251022_150000

## Goals
- Implement new feature
- Fix critical bugs

## Completed
- ✅ Set up project

## Next Steps
- [ ] Create plan
- [ ] Execute tasks
```

**When to use:**
- Starting new session
- Before creating plan
- When conversation gets long

---

### `nnn` - Smart Planning

**Purpose:** Create detailed implementation plan

**Usage:** Type `nnn` in Claude Code

**What it does:**
- Auto-runs `ccc` if context missing/old
- Reads current context
- Creates structured plan in `.mahirolab/state/plans/`
- Breaks work into phases and tasks

**Example Output:**
```markdown
# Implementation Plan
**Created:** 2025-10-22 15:00
**Based on Context:** context.md

## Phase 1: Setup
- [ ] Task 1.1: Configure environment
- [ ] Task 1.2: Install dependencies

## Phase 2: Implementation
- [ ] Task 2.1: Create component
- [ ] Task 2.2: Add tests
```

**When to use:**
- Before starting major work
- Need clear roadmap
- Breaking down complex tasks

---

### `gogogo` - Execute Plan

**Purpose:** Execute the most recent plan

**Usage:** Type `gogogo` in Claude Code

**What it does:**
- Reads latest plan from `.mahirolab/state/plans/`
- Initializes `.mahirolab/state/progress.md`
- Executes tasks step-by-step
- Updates progress in real-time
- Logs to `execution_log.md`

**Example Output:**
```
🚀 Execution started!

Phase 1: Setup
🔄 Configuring environment...
✅ Complete (15 seconds)

[████████░░░░░░░░░░░░] 40% (2/5 tasks)
ETA: 8 minutes
```

**When to use:**
- Ready to execute plan
- Want autonomous task completion
- Need progress tracking

---

### `rrr` - Retrospective

**Purpose:** Create session retrospective

**Usage:** Type `rrr` in Claude Code

**What it does:**
- Gathers data from context, plans, progress
- Calculates session metrics
- Creates comprehensive retrospective
- Saves to `.mahirolab/state/retrospectives/`

**Example Output:**
```markdown
# Session Retrospective
**Date:** 2025-10-22
**Duration:** 3 hours

## What We Accomplished
- ✅ Implemented user authentication
- ✅ Added 12 unit tests
- ✅ Fixed 3 critical bugs

## Metrics
- Tasks completed: 15/17 (88%)
- Time saved: ~6 hours (estimated)

## Key Learnings
- 💡 Test-driven approach saved debugging time
- 💡 Background workers perfect for refactoring
```

**When to use:**
- End of session
- After completing milestone
- Weekly reviews

---

### `lll` - List Project Status

**Purpose:** Display comprehensive status dashboard

**Usage:** Type `lll` in Claude Code

**What it does:**
- Shows current context summary
- Displays active plan progress
- Lists recent activity
- Shows git status
- Reports codex jobs

**Example Output:**
```
╔════════════════════════════════════════╗
║      PROJECT STATUS DASHBOARD         ║
╚════════════════════════════════════════╝

📝 CURRENT CONTEXT
  Session: 20251022_150000
  Last updated: 1 hour ago
  Version: v3 (5 total)

📊 PROGRESS
  Overall: [████████░░░░░░░░░░░░] 40% (6/15 tasks)

  Phase 1: Complete ✅
  Phase 2: In Progress 🔄

📋 ACTIVE PLAN
  Plan: plan_20251022_143000.md
  Progress: 6/15 tasks (40%)

🌿 GIT STATUS
  Branch: feature/auth
  Changes: 8 modified, 2 new files
```

**When to use:**
- Starting session (check what's pending)
- During work (track progress)
- Before switching tasks

---

## Codex Integration Shortcodes

### `rrresearch` - Claude-Managed Research

**Purpose:** Run background research with web search

**Usage:** `rrresearch "topic"`

**Example:**
```
User: rrresearch "React 19 Server Components"

Claude: 🔍 Starting research job...
        Job ID: bash_12345
        Output: .mahirolab/research/20251022_*.md

        ✅ Running in background
        Use "check research status" to monitor
```

**Features:**
- Web search enabled
- Medium reasoning (fixed)
- Structured markdown report
- Claude monitors progress

**Check status:**
```
User: check research status
```

---

### `www` - Claude-Managed Worker

**Purpose:** Run background worker with monitoring

**Usage:** `www [reasoning] "task"`

**Examples:**
```bash
# Default (low reasoning)
www "Generate unit tests for utils/"

# Medium reasoning
www medium "Refactor authentication module"

# High reasoning
www high "Migrate entire codebase to TypeScript"
```

**Features:**
- Background execution
- Configurable reasoning level
- Progress monitoring
- Claude supervises job

**Check status:**
```
User: check worker status
```

---

## Workflow Examples

### Example 1: Quick Start
```
User: ccc
User: nnn
User: gogogo
```

### Example 2: Research → Plan → Execute
```
User: rrresearch "best practices for..."
[wait for completion]
User: ccc
User: nnn
User: gogogo
```

### Example 3: Parallel Work
```
User: www high "large refactoring task"
User: ccc
[work on other things]
User: check worker status
```

### Example 4: Status Check
```
User: lll
[review status]
User: gogogo
[continue execution]
```

---

## Tips & Best Practices

**✅ DO:**
- Run `ccc` at start of session
- Use `nnn` before complex work
- Check `lll` frequently
- Create `rrr` at end of sessions
- Monitor background jobs

**❌ DON'T:**
- Don't `gogogo` without plan
- Don't skip context creation
- Don't forget retrospectives
- Don't ignore progress tracking

---

## State Files Location

All state stored in `.mahirolab/state/`:

```
.mahirolab/state/
├── context.md              # Current context
├── context_history/        # Version history
├── plans/                  # Implementation plans
├── progress.md             # Real-time progress
├── execution_log.md        # Event timeline
└── retrospectives/         # Session reviews
```

---

## Cheat Sheet

| Shortcode | Purpose | Output |
|-----------|---------|--------|
| `ccc` | Create context | `context.md` |
| `nnn` | Create plan | `plans/plan_*.md` |
| `gogogo` | Execute | `progress.md` + logs |
| `rrr` | Retrospective | `retrospectives/retro_*.md` |
| `lll` | Status | Dashboard (display only) |
| `rrresearch` | Research | `.mahirolab/research/*.md` |
| `www` | Background worker | `.mahirolab/workers/*.md` |

---

**Print this card for quick reference!**
