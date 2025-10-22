# State Management System

Complete guide to `.mahirolab` state management, versioning, and session continuity.

---

## Table of Contents

1. [Overview](#overview)
2. [Directory Structure](#directory-structure)
3. [Context Versioning](#context-versioning)
4. [Progress Tracking](#progress-tracking)
5. [Session Continuity](#session-continuity)
6. [State Analytics](#state-analytics)
7. [Cleanup Policy](#cleanup-policy)
8. [Shortcode Integration](#shortcode-integration)
9. [Best Practices](#best-practices)
10. [Examples](#examples)

---

## Overview

The state management system provides:
- **Context Versioning** - Track session history and evolution
- **Progress Tracking** - Real-time task execution monitoring
- **Session Continuity** - Seamless continuation between sessions
- **Analytics** - Productivity metrics and insights
- **Archive Policy** - Safe data preservation without auto-deletion

### Key Benefits

✅ Never lose session context  
✅ Track progress across multiple sessions  
✅ Understand productivity patterns  
✅ Smooth session transitions  
✅ Complete audit trail of all work  

---

## Directory Structure

```
.mahirolab/state/
├── context.md                    # Current session context
├── context_history/              # All context versions
│   ├── context_v1_20251022.md
│   ├── context_v2_20251022.md
│   └── context_v3_20251023.md
├── plans/                        # All implementation plans
│   ├── plan_20251022_120000.md
│   └── plan_20251023_140000.md
├── retrospectives/               # Session retrospectives
│   ├── retrospective_20251022.md
│   └── retrospective_20251023.md
├── progress.md                   # Current execution progress
├── execution_log.md              # Detailed execution history
├── archive/                      # Archived old files
│   ├── contexts/
│   ├── plans/
│   └── retrospectives/
└── analytics/                    # Analytics data (optional)
    ├── context_metrics.json
    ├── plan_metrics.json
    └── session_metrics.json
```

### File Purposes

| File/Directory | Purpose | Lifespan |
|----------------|---------|----------|
| `context.md` | Active session context | Current session |
| `context_history/` | All context versions | Permanent |
| `plans/` | Implementation plans | Permanent |
| `retrospectives/` | Session reviews | Permanent |
| `progress.md` | Real-time progress | Per plan execution |
| `execution_log.md` | Detailed event log | Permanent |
| `archive/` | Old/completed files | Manual cleanup only |

---

## Context Versioning

### Concept

Every time you run `ccc`, a new version of your context is created. This allows you to:
- Track how your goals evolve
- See what you accomplished over time
- Restore previous contexts if needed
- Understand session continuity

### Version Numbering

Format: `context_vN_YYYYMMDD.md`
- `N` = Sequential version number (1, 2, 3, ...)
- `YYYYMMDD` = Date created

Example timeline:
```
context_v1_20251022.md  # Morning session
context_v2_20251022.md  # Afternoon session (same day)
context_v3_20251023.md  # Next day
```

### Context Creation Flow

When you run `ccc`:

```
1. Check for existing context
   ↓
2. If exists: Prompt user
   "Continue or Start Fresh?"
   ↓
   [1] Continue → Show diff → Merge
   [2] Fresh → Archive old → Create new
   ↓
3. Create new version in context_history/
   ↓
4. Update context.md
   ↓
5. Display summary
```

### Continue vs. Fresh Start

**Continue (Option 1):**
- Merges old context with new information
- Preserves completed tasks
- Adds new goals
- Updates status
- Keeps decision history

**Fresh Start (Option 2):**
- Archives old context completely
- Creates brand new context
- Clean slate for new work
- Old context still accessible in history

### Context Diff Example

```
Context Changes:
  Goals:
    + New: Complete documentation
    ~ Modified: "Implement features" → "Test and deploy features"
  
  Completed:
    + Archived old state files
    + Updated scripts with templates
  
  Status:
    ~ Changed: "Planning" → "Implementation"
```

---

## Progress Tracking

### Real-Time Updates

During `gogogo` execution, `progress.md` is updated in real-time:

```markdown
## Phase 1: Template Auto-injection [IN PROGRESS]

- ✅ **Task 1.1:** Archive old state files
  - Started: 12:44:00
  - Completed: 12:44:25
  - Duration: 25s

- 🔄 **Task 1.2:** Update codex-research.sh
  - Started: 12:45:00
  - Current step: Injecting template into prompt
  - Last update: 12:46:15

- ⏳ **Task 1.3:** Update codex-worker-launcher.sh
  - Status: Pending
  - Dependencies: Task 1.2
```

### Progress Bars

```
Overall: [████████░░░░░░░░░░░░] 40% (6/15 tasks)

Phase 1: [████████████████████] 100% (4/4 tasks) ✅
Phase 2: [████░░░░░░░░░░░░░░░░] 20% (2/10 tasks) 🔄
Phase 3: [░░░░░░░░░░░░░░░░░░░░] 0% (0/3 tasks) ⏳
```

### Status Emojis

- 🔄 In Progress
- ✅ Completed
- ⏳ Pending
- ⚠️ Paused/Warning
- ❌ Failed

### Execution Log

Detailed timeline in `execution_log.md`:

```
[12:43:33] 🚀 Starting execution of plan_20251022_123918.md
[12:44:00] 🔄 Task 1.1 started
[12:44:25] ✅ Task 1.1 completed in 25s
[12:45:00] 🔄 Task 1.2 started
[12:46:15] Current step: Adding template injection logic
[12:48:00] ✅ Task 1.2 completed in 3m
```

---

## Session Continuity

### The Problem

Without state management:
- Lose context between sessions
- Forget what you were working on
- Repeat planning work
- No history of decisions

### The Solution

With state management:
- Pick up exactly where you left off
- See complete session history
- Track goals across sessions
- Maintain decision context

### Typical Session Flow

**Starting a New Session:**

```bash
# 1. Check project status
lll

# 2. Continue or start fresh
ccc
# → Choose [1] Continue or [2] Fresh

# 3. Create plan if needed
nnn
# → Automatically references latest context

# 4. Execute plan
gogogo
# → Real-time progress tracking

# 5. End session with retrospective
rrr
# → Archive session learnings
```

**Continuing from Previous Session:**

```bash
# 1. Check status
lll
# Shows:
# - Last session was 2 hours ago
# - Progress: 6/15 tasks (40%)
# - Currently in Phase 2

# 2. Continue context
ccc
# [1] Continue → Merges with previous session

# 3. Continue execution
gogogo
# Picks up from where you left off
```

---

## State Analytics

### Metrics Tracked

#### Productivity Metrics
- Tasks completed per session
- Average task duration
- Success rate
- Velocity (tasks/hour)

#### Session Metrics
- Total sessions
- Average session duration
- Most productive time of day
- Session frequency

#### Storage Metrics
- Total state size
- Growth rate
- Archive size
- Largest files

### Viewing Analytics

Use `lll` to see analytics:

```
📊 PRODUCTIVITY ANALYTICS (Last 30 days)

Velocity:
  Tasks completed: 45
  Success rate: 93%
  Avg per session: 7.5 tasks
  
Efficiency:
  Total time: 15h 30m
  Time saved: ~29h 30m
  ROI: 290% efficiency
```

---

## Cleanup Policy

### Archive-Only Policy

**Principle:** Never automatically delete data. Only archive and organize.

### What Gets Archived

- Old context versions (> 30 days)
- Completed plans
- Finished retrospectives
- Large execution logs

### Manual Cleanup

```bash
# Show cleanup recommendations
lll
# → See recommendations section

# Organize archive by date
.mahirolab/bin/codex-cleanup.sh --organize

# Compress old files (optional)
.mahirolab/bin/codex-cleanup.sh --compress

# Show statistics
.mahirolab/bin/codex-cleanup.sh --stats
```

### Safety Features

✅ No automatic deletion  
✅ Dry-run mode available  
✅ Confirmation prompts  
✅ Backup before operations  
✅ Restoration process  

---

## Shortcode Integration

### CCC (Create Context)

**Enhanced Behavior:**
- Detects existing context
- Prompts: Continue or Fresh?
- Shows diff before merge
- Creates version in context_history/
- Updates context.md

**Usage:**
```bash
User: ccc

Claude:
  Found existing context (2 hours ago)
  [1] Continue [2] Fresh
  
User: 1

Claude:
  Changes: +2 goals, +3 completed tasks
  Accept? [y/n]
  
User: y

Claude:
  ✅ Merged → context_v2_20251022.md
```

### NNN (Create Plan)

**Enhanced Behavior:**
- Auto-runs `ccc` if context stale
- Reads latest context version
- Saves to `plans/` directory
- References context version
- Checks prerequisites

**File Location:**
- Old: `.mahirolab/state/plan_*.md`
- New: `.mahirolab/state/plans/plan_*.md`

### GOGOGO (Execute Plan)

**Enhanced Behavior:**
- Reads plan from `plans/`
- Initializes `progress.md`
- Real-time updates
- Timestamp tracking
- ETA calculation
- Stops on failures

**Progress Updates:**
- Task start/complete timestamps
- Current step descriptions
- Overall progress percentage
- Phase completion tracking

### RRR (Retrospective)

**Enhanced Behavior:**
- Reads from new directory structure
- Includes analytics metrics
- References plan and context
- Saves to `retrospectives/`
- Comprehensive session summary

**File Location:**
- Old: `.mahirolab/state/retrospective_*.md`
- New: `.mahirolab/state/retrospectives/retrospective_*.md`

### LLL (List Status)

**Enhanced Behavior:**
- Progress bars
- Session timeline (last 7 days)
- State analytics
- Storage metrics
- Cleanup recommendations

---

## Best Practices

### Start of Day

```bash
1. lll                    # Check yesterday's status
2. ccc                    # Continue or fresh start
3. nnn                    # Create plan if needed
```

### During Work

```bash
# Just execute
gogogo

# Progress automatically tracked
# Check status anytime with: lll
```

### End of Day

```bash
1. rrr                    # Create retrospective
2. git commit             # Commit your changes
```

### End of Week

```bash
1. lll --stats            # Review weekly stats
2. codex-cleanup.sh       # Check if cleanup needed
```

---

## Examples

### Example 1: Starting Fresh

```bash
$ lll
# No active session

$ ccc
# Creating fresh context...
✅ Context created → context_v1_20251022.md

$ nnn
# Planning: Template injection & state management...
✅ Plan created → plans/plan_20251022_120000.md

$ gogogo
# Executing plan...
🔄 Phase 1 in progress...
```

### Example 2: Continuing Session

```bash
$ lll
📝 CURRENT CONTEXT
  Last updated: 2 hours ago
  Progress: 6/15 tasks (40%)
  
$ ccc
Found existing context (2 hours ago)
[1] Continue [2] Fresh
> 1

Changes: +1 goal, +2 completed tasks
Accept? [y/n]
> y

✅ Merged → context_v2_20251022.md

$ gogogo
Continuing from Task 2.3...
🔄 Phase 2 in progress...
```

### Example 3: Weekly Review

```bash
$ lll --stats
📊 ANALYTICS (Last 7 days)
  Sessions: 5
  Tasks completed: 23
  Success rate: 95%
  Total time: 12h 30m

$ rrr
✅ Retrospective created
  - 23 tasks completed
  - Key learnings documented
  - Next steps identified
```

---

## Troubleshooting

### Context file corrupted

```
⚠️  Context file corrupted
Creating fresh context...
(Old file backed up to: archive/context_corrupted_TIMESTAMP.md)
```

**Solution:** Context automatically backed up, fresh one created.

### Version history missing

```
⚠️  No version history found
Starting version numbering from v1
```

**Solution:** System automatically initializes versioning.

### Progress tracking interrupted

**Symptom:** `gogogo` stopped mid-execution  
**Solution:** 
1. Check `progress.md` to see last completed task
2. Review `execution_log.md` for errors
3. Resume with `gogogo` (picks up from last checkpoint)

---

## Migration Guide

### From Old Structure

If you have existing state files in the old structure:

```bash
# Old structure:
.mahirolab/state/
├── context.md
├── plan_20251009.md
└── retrospective_20251009.md

# New structure:
.mahirolab/state/
├── context.md
├── context_history/
│   └── context_v1_20251009.md
├── plans/
│   └── plan_20251009_143000.md
└── retrospectives/
    └── retrospective_20251009.md
```

**Migration already done:**
- Old files moved to `archive/`
- New structure created
- First context version initialized

---

## FAQ

**Q: Can I delete old context versions?**  
A: Yes, but manually only. No automatic deletion. They're in `context_history/`.

**Q: What if I want to start completely fresh?**  
A: Run `ccc` and choose `[2] Fresh`. Old context is archived, not deleted.

**Q: How do I see all my past sessions?**  
A: Check `.mahirolab/state/context_history/` and `retrospectives/`.

**Q: Can I restore an old context?**  
A: Yes, copy any version from `context_history/` to `context.md`.

**Q: How much disk space does this use?**  
A: Run `lll` to see storage metrics. Typically a few MB. Use compression for old files if needed.

**Q: What happens if gogogo fails mid-execution?**  
A: Progress is saved in `progress.md`. You can see what completed and resume.

---

## Related Documentation

- [SHORTCODES.md](./SHORTCODES.md) - Shortcode protocol details
- [PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md) - Complete project layout
- [CLAUDE.md](../CLAUDE.md) - Main system documentation

---

*Version: 1.0.0 | Last Updated: 2025-10-22*
