# Claude Shortcode Protocol

Communication protocol between User and Claude for collaborative work through Codex Architecture.

---

## Core Shortcodes

### `ccc` - Create Context & Compact

**Purpose:** Summarize current conversation with session continuity support

**Claude Action:**
1. Check for existing context in `.mahirolab/state/context.md`
2. If context exists:
   - Prompt user: "Continue from previous session or Start fresh?"
   - **[1] Continue:** Show diff → Ask confirmation → Merge contexts
   - **[2] Fresh:** Archive old context → Create new one
3. Create versioned copy in `.mahirolab/state/context_history/context_vN_YYYYMMDD.md`
4. Update `.mahirolab/state/context.md` with current/merged context
5. Display summary to user

**Session Continuity:**
- Every `ccc` execution creates a new version in `context_history/`
- Version format: `context_vN_YYYYMMDD.md` (N = sequential number)
- "Continue" mode merges old goals, tasks, decisions with new information
- "Fresh" mode archives old context completely but keeps it accessible
- All changes logged to `execution_log.md`

**Output Format:**
```markdown
# Session Context

**Date:** YYYY-MM-DD HH:MM
**Session ID:** [timestamp]

## Goals
- [Main objective 1]
- [Main objective 2]

## Completed
- ✅ [Task 1]
- ✅ [Task 2]

## Decisions Made
- [Key decision 1 + rationale]
- [Key decision 2 + rationale]

## Current Status
[Brief status update]

## Next Steps
- [ ] [Next task 1]
- [ ] [Next task 2]

## Blockers/Issues
- [Any blockers or concerns]
```

**When to Use:**
- Starting a new session
- Before creating a plan
- When conversation becomes too long
- Before switching context to another topic

---

### `nnn` - Smart Planning

**Purpose:** Create a detailed implementation plan

**Claude Action:**
1. Check if recent context exists (age < 1 hour)
   - If missing or outdated → run `ccc` automatically first
2. Read `.mahirolab/state/context.md` and latest context version from `context_history/`
3. Create detailed plan: `.mahirolab/state/plans/plan_YYYYMMDD_HHMMSS.md`
4. Reference context version in plan header
5. Check prerequisites from context
6. Display plan overview

**New Behavior:**
- Plans saved to `.mahirolab/state/plans/` (not root state/)
- Plan includes reference to context version used
- Prerequisites checked against context
- Supports new directory structure

**Output Format:**
```markdown
# Implementation Plan

**Created:** YYYY-MM-DD HH:MM
**Based on Context:** [context file reference]

## Overview
[Brief description of what we're planning to do]

## Prerequisites
- [ ] [Prerequisite 1]
- [ ] [Prerequisite 2]

## Phase 1: [Phase Name]
**Goal:** [What this phase achieves]
**Estimated Time:** [X hours/days]

### Tasks
- [ ] **Task 1.1:** [Description]
  - Tool: `codex-exec.sh` / `codex-research.sh` / manual
  - Reasoning Level: low/medium/high
  - Dependencies: None
  - Success Criteria: [How to verify completion]

- [ ] **Task 1.2:** [Description]
  - Tool: [tool name]
  - Reasoning Level: [level]
  - Dependencies: Task 1.1
  - Success Criteria: [criteria]

## Phase 2: [Phase Name]
...

## Risks & Mitigations
- **Risk 1:** [Description]
  - Mitigation: [How to handle]

## Success Criteria
- [ ] [Overall success criterion 1]
- [ ] [Overall success criterion 2]

## Rollback Plan
[How to undo changes if needed]
```

**When to Use:**
- When you need a clear plan
- Before starting major work
- When you need to break down complex tasks

---

### `gogogo` - Execute Plan

**Purpose:** Start executing the most recent plan with real-time progress tracking

**Claude Action:**
1. Read the latest plan from `.mahirolab/state/plans/`
2. Initialize `.mahirolab/state/progress.md` with plan structure
3. Ask for confirmation before starting (unless user says to skip)
4. Execute tasks step by step:
   - Mark task as 🔄 In Progress with start timestamp
   - Display current task and step being worked on
   - Update "Current step" during execution
   - On completion: Mark ✅, record end timestamp, calculate duration
   - On failure: Mark ❌, log error, add to blockers, STOP execution
5. Update progress bars after each task
6. Calculate ETA based on completed tasks
7. Report after each phase completes
8. Update `execution_log.md` with detailed timeline

**Real-Time Progress Tracking:**
- Updates `progress.md` continuously with timestamps
- Shows progress bars: `[████████░░░░░░░░░░░░] 40% (6/15 tasks)`
- Displays ETA based on average task duration
- Logs every significant action to `execution_log.md`
- Status emojis: 🔄 In Progress, ✅ Completed, ⏳ Pending, ❌ Failed

**Execution Behavior:**
- **Sequential by default:** Execute tasks one at a time in order
- **Stop on error:** Halt if error encountered, wait for user to fix
- **Progress tracking:** Real-time updates to progress.md
- **Logging:** Detailed timeline in execution_log.md

**When to Use:**
- When ready to execute the plan
- When you want Claude to work autonomously
- When you have a clear plan ready

---

### `rrr` - Retrospective

**Purpose:** Create comprehensive session retrospective with metrics

**Claude Action:**
1. Gather data from:
   - `.mahirolab/state/context.md` and `context_history/` (latest version)
   - `.mahirolab/state/plans/` (latest plan)
   - `.mahirolab/state/progress.md` (task completion data)
   - `.mahirolab/state/execution_log.md` (timeline and events)
   - Conversation history
2. Calculate session metrics:
   - Tasks completed vs. total
   - Time spent (from timestamps)
   - Success rate
   - Issues encountered
3. Create comprehensive retrospective
4. Save to `.mahirolab/state/retrospectives/retrospective_YYYYMMDD.md`
5. Update `execution_log.md` with retrospective creation

**New Behavior:**
- Retrospectives saved to `.mahirolab/state/retrospectives/` (not root state/)
- Includes analytics metrics if available
- References both context version and plan used
- Comprehensive session summary with learnings
- Supports new directory structure

**Output Format:**
```markdown
# Session Retrospective

**Date:** YYYY-MM-DD
**Duration:** [X hours]

## Summary
[Brief overview of session]

## What We Accomplished
- ✅ [Achievement 1]
- ✅ [Achievement 2]
- ✅ [Achievement 3]

## What Went Well
- 👍 [Thing that worked well 1]
- 👍 [Thing that worked well 2]

## What Could Be Improved
- 📈 [Improvement area 1]
  - Suggestion: [How to improve]
- 📈 [Improvement area 2]
  - Suggestion: [How to improve]

## Key Learnings
- 💡 [Learning 1]
- 💡 [Learning 2]

## Metrics
- Files created/modified: X
- Commands executed: Y
- Issues resolved: Z
- Time saved: ~X hours (estimated)

## Recommendations for Next Session
- [ ] [Recommendation 1]
- [ ] [Recommendation 2]

## Open Questions
- ❓ [Question 1]
- ❓ [Question 2]
```

**When to Use:**
- End of session
- After completing major milestones
- Weekly retrospectives

---

### `lll` - List Project Status

**Purpose:** Display comprehensive project status with progress bars and timeline

**Claude Action:**
1. Gather information from multiple sources:
   - Current context from `.mahirolab/state/context.md`
   - Context versions from `.mahirolab/state/context_history/`
   - Active plan from `.mahirolab/state/plans/`
   - Progress from `.mahirolab/state/progress.md`
   - Git status
   - Recent codex jobs from `.mahirolab/workers/` and `.mahirolab/research/`
   - State storage metrics
2. Calculate progress bars for phases and overall progress
3. Build session timeline from `execution_log.md` (last 7 days)
4. Generate analytics and recommendations
5. Display enhanced dashboard

**Enhanced Features:**
- **Progress Bars:** Visual representation of task completion
- **Session Timeline:** Last 7 days of sessions with completion percentages
- **State Analytics:** Productivity metrics, success rates, storage usage
- **Cleanup Recommendations:** Suggestions for maintenance

**Output Format:**
```
╔════════════════════════════════════════╗
║      PROJECT STATUS DASHBOARD         ║
╚════════════════════════════════════════╝

📝 CURRENT CONTEXT
  Session: 20251022_123918
  Last updated: 2 hours ago
  Main goal: [from context.md]
  Version: v2 (2 total)

📊 PROGRESS
  Overall: [████████░░░░░░░░░░░░] 40% (6/15 tasks)

  Phase 1: Template Auto-injection
  [████████████████████] 100% (4/4 tasks) ✅

  Phase 2: State Management
  [████░░░░░░░░░░░░░░░░] 20% (2/10 tasks) 🔄

📋 ACTIVE PLAN
  Plan: plan_20250103_143000.md
  Progress: 5/12 tasks completed (42%)
  Current phase: Phase 2 - Implementation

⚙️  RECENT ACTIVITY
  - ✅ Task completed: Add config system
  - 🔄 In progress: Create examples
  - ⏳ Pending: Documentation update

🌿 GIT STATUS
  Branch: feature/shortcodes
  Changes: 5 modified, 3 new files
  Commits ahead: 2

📊 CODEX JOBS (Last 24h)
  - Workers: 3 completed
  - Research: 1 completed
  - Total files: 8

📁 KEY FILES MODIFIED
  - SHORTCODES.md (2 min ago)
  - CLAUDE.md (15 min ago)
  - context.md (1 hour ago)
```

**When to Use:**
- Starting session to see what's pending
- Check progress during work
- Before switching to another task

---

## State Management

### Directory Structure
```
.mahirolab/
└── state/
    ├── context.md                    # Current session context
    ├── context_history/              # Versioned context snapshots
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
    ├── execution_log.md              # Detailed event timeline
    ├── archive/                      # Archived old files
    │   ├── contexts/
    │   ├── plans/
    │   └── retrospectives/
    └── analytics/                    # Analytics data (optional)
        ├── context_metrics.json
        └── session_metrics.json
```

### File Lifecycle
1. **context.md** - Refreshed when running `ccc`, creates version in `context_history/`
2. **context_history/** - Permanent versioned snapshots, never deleted
3. **plans/*.md** - Created by `nnn`, executed by `gogogo`
4. **progress.md** - Initialized and updated during `gogogo` execution with real-time status
5. **execution_log.md** - Appended during execution with detailed timeline
6. **retrospectives/*.md** - Created by `rrr` with comprehensive session summary
7. **archive/** - Old files moved here, manual cleanup only (no auto-delete)

### Session Continuity Features
- **Context Versioning:** Every `ccc` creates a new version
- **Continue vs. Fresh:** Choose to merge with previous session or start clean
- **Progress Bars:** Visual task completion tracking
- **Timeline View:** See sessions from last 7 days in `lll`
- **Archive Policy:** All data preserved, no automatic deletion

For complete details, see [STATE_MANAGEMENT.md](./STATE_MANAGEMENT.md)

---

## Usage Guidelines

### Typical Workflow

```
Session Start:
  User: lll                    # Check status
  Claude: [shows dashboard]

  User: ccc                    # Create context
  Claude: [creates context.md, shows summary]

  User: nnn                    # Create plan
  Claude: [creates plan, shows overview]

  User: gogogo                 # Execute
  Claude: [executes step-by-step]

Session End:
  User: rrr                    # Retrospective
  Claude: [creates retrospective]
```

### Best Practices

✅ **Do:**
- Run `ccc` when starting new session
- Run `lll` frequently to check progress
- Run `rrr` when completing major work
- Review plan before `gogogo`

❌ **Don't:**
- Don't `gogogo` without a plan
- Don't forget `ccc` and lose context
- Don't skip retrospective (lose learning opportunities)

---

## Integration with Codex Architecture

Shortcodes work together with Codex scripts:

- `ccc`, `nnn`, `rrr`, `lll` → **Pure Claude actions** (no codex invocation)
- `gogogo` → **May invoke Codex scripts** based on plan
  - Example: if task specifies `codex-exec.sh`, Claude will invoke it via Bash tool

---

## Future Shortcodes (Reserved)

Reserved for future use:

- `qqq` - Quick questions/clarifications
- `sss` - Show architecture/system summary
- `ddd` - Deep dive analysis
- `xxx` - Exit/wrap up session cleanly
- `ttt` - Run tests and validate
- `fff` - Fix/troubleshoot issues

---

## Notes for Claude

When encountering shortcode in conversation:

1. **No confirmation needed** - Execute immediately
2. **Follow specified format** - For consistency
3. **Save files in .mahirolab/state/** - Per specification
4. **Show brief summary** - No verbose output
5. **If issues arise** - Report and wait for instructions

---

*Protocol Version: 1.0.0 | Last Updated: 2025-01-03*
