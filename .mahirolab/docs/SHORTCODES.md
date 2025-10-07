# Claude Shortcode Protocol

Communication protocol between User and Claude for collaborative work through Codex Architecture.

---

## Core Shortcodes

### `ccc` - Create Context & Compact

**Purpose:** Summarize and compact current conversation

**Claude Action:**
1. Analyze conversation history
2. Summarize key points:
   - Main session goals
   - Completed tasks
   - Important decisions made
   - Issues encountered and resolved
3. Create context file: `.mahirolab/state/context.md`
4. Display summary to user

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
2. Read `.mahirolab/state/context.md`
3. Create detailed plan: `.mahirolab/state/plan_YYYYMMDD_HHMMSS.md`
4. Display plan overview

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

**Purpose:** Start executing the most recent plan

**Claude Action:**
1. Read the latest plan from `.mahirolab/state/`
2. Ask for confirmation before starting (unless user says to skip)
3. Execute tasks step by step:
   - Display current task being worked on
   - Perform work according to specification
   - Update progress in `.mahirolab/state/progress.md`
   - Ask before proceeding if it's a critical task
4. Report after each phase completes

**Execution Behavior:**
- **Sequential by default:** Execute tasks one at a time in order
- **Stop on error:** Halt if error encountered, wait for user to fix
- **Progress tracking:** Update checkboxes in plan file
- **Logging:** Record all actions to `.mahirolab/state/execution_log.md`

**When to Use:**
- When ready to execute the plan
- When you want Claude to work autonomously
- When you have a clear plan ready

---

### `rrr` - Retrospective

**Purpose:** Create session retrospective

**Claude Action:**
1. Read:
   - `.mahirolab/state/context.md`
   - `.mahirolab/state/plan_*.md`
   - `.mahirolab/state/progress.md`
   - Conversation history
2. Analyze and create retrospective
3. Save to `.mahirolab/state/retrospective_YYYYMMDD.md`

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

**Purpose:** Display project status overview

**Claude Action:**
1. Display information from multiple sources:
   - Current context (if exists)
   - Active plan (if exists)
   - Recent progress
   - Git status
   - Recent codex jobs
   - File structure changes

**Output Format:**
```
╔════════════════════════════════════════╗
║      PROJECT STATUS DASHBOARD         ║
╚════════════════════════════════════════╝

📝 CURRENT CONTEXT
  Last updated: 2 hours ago
  Main goal: [from context.md]
  Status: In progress

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
  - codex.yaml (1 hour ago)
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
    ├── context.md              # Current session context
    ├── plan_YYYYMMDD_HHMMSS.md # Implementation plans
    ├── progress.md             # Execution progress tracking
    ├── execution_log.md        # Detailed execution log
    └── retrospective_YYYYMMDD.md # Session retrospectives
```

### File Lifecycle
1. **context.md** - Refreshed when running `ccc`
2. **plan_*.md** - Created by `nnn`, executed by `gogogo`
3. **progress.md** - Updated during `gogogo` execution
4. **execution_log.md** - Appended during execution
5. **retrospective_*.md** - Created by `rrr`

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
