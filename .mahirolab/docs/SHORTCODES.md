# Claude Shortcode Protocol

Protocol สำหรับการสื่อสารระหว่าง User และ Claude ในการทำงานร่วมกันผ่าน Codex Architecture

---

## Core Shortcodes

### `ccc` - Create Context & Compact

**Purpose:** สรุปและบีบอัด conversation ปัจจุบัน

**Claude Action:**
1. วิเคราะห์ conversation ที่ผ่านมา
2. สรุปประเด็นสำคัญ:
   - เป้าหมายหลักของ session
   - สิ่งที่ทำไปแล้ว
   - การตัดสินใจที่สำคัญ
   - ปัญหาที่พบและแก้ไข
3. สร้าง context file: `.mahirolab/state/context.md`
4. แสดง summary กลับมาให้ user ดู

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
- เริ่มต้น session ใหม่
- ก่อนจะวาง plan
- เมื่อ conversation ยาวเกินไป
- ก่อนจะสลับ context ไปเรื่องอื่น

---

### `nnn` - Smart Planning

**Purpose:** สร้าง implementation plan แบบละเอียด

**Claude Action:**
1. ตรวจสอบว่ามี context ล่าสุดหรือไม่ (อายุ < 1 ชั่วโมง)
   - ถ้าไม่มีหรือเก่า → รัน `ccc` ก่อนอัตโนมัติ
2. อ่าน `.mahirolab/state/context.md`
3. สร้าง detailed plan: `.mahirolab/state/plan_YYYYMMDD_HHMMSS.md`
4. แสดง plan overview

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
- เมื่อต้องการแผนงานที่ชัดเจน
- ก่อนเริ่มงานใหญ่ๆ
- เมื่อต้องการ break down complex task

---

### `gogogo` - Execute Plan

**Purpose:** เริ่มดำเนินการตาม plan ล่าสุด

**Claude Action:**
1. อ่าน plan ล่าสุดจาก `.mahirolab/state/`
2. ถามยืนยันก่อนเริ่ม (ถ้า user ไม่ได้บอกให้ skip)
3. Execute tasks ทีละ step:
   - แสดง task ที่กำลังทำ
   - ทำงานตาม specification
   - Update progress ใน `.mahirolab/state/progress.md`
   - ถามก่อนไป step ถัดไปถ้าเป็น critical task
4. Report หลังจบแต่ละ phase

**Execution Behavior:**
- **Sequential by default:** ทำทีละ task ตามลำดับ
- **Stop on error:** หยุดถ้าเจอ error, รอ user แก้
- **Progress tracking:** Update checkbox ใน plan file
- **Logging:** บันทึกทุก action ลง `.mahirolab/state/execution_log.md`

**When to Use:**
- เมื่อพร้อมจะเริ่มทำตาม plan
- เมื่ออยากให้ Claude ทำแบบ autonomous
- เมื่อมี plan ที่ชัดเจนแล้ว

---

### `rrr` - Retrospective

**Purpose:** สร้าง session retrospective

**Claude Action:**
1. อ่าน:
   - `.mahirolab/state/context.md`
   - `.mahirolab/state/plan_*.md`
   - `.mahirolab/state/progress.md`
   - Conversation history
2. วิเคราะห์และสร้าง retrospective
3. บันทึกลง `.mahirolab/state/retrospective_YYYYMMDD.md`

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
- จบ session
- จบ milestone ใหญ่
- ทุกสัปดาห์ (weekly retro)

---

### `lll` - List Project Status

**Purpose:** แสดงภาพรวมสถานะโปรเจกต์

**Claude Action:**
1. แสดงข้อมูลจากหลายแหล่ง:
   - Current context (ถ้ามี)
   - Active plan (ถ้ามี)
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
- เริ่มต้น session เพื่อดูว่าค้างอะไรไว้
- Check progress ระหว่างทำงาน
- ก่อนจะสลับไป task อื่น

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
1. **context.md** - Refreshed when run `ccc`
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
- Run `ccc` เมื่อเริ่ม session ใหม่
- Run `lll` บ่อยๆ เพื่อ check progress
- Run `rrr` เมื่อจบงานสำคัญ
- Review plan ก่อน `gogogo`

❌ **Don't:**
- อย่า `gogogo` โดยไม่มี plan
- อย่าลืม `ccc` ทำให้ context หาย
- อย่า skip retrospective (เสีย learning)

---

## Integration with Codex Architecture

Shortcodes ทำงานร่วมกับ Codex scripts:

- `ccc`, `nnn`, `rrr`, `lll` → **Pure Claude actions** (ไม่เรียก codex)
- `gogogo` → **May invoke Codex scripts** ตาม plan
  - เช่น task บอกใช้ `codex-exec.sh` Claude ก็จะเรียกผ่าน Bash tool

---

## Future Shortcodes (Reserved)

คำที่เตรียมไว้สำหรับอนาคต:

- `qqq` - Quick questions/clarifications
- `sss` - Show architecture/system summary
- `ddd` - Deep dive analysis
- `xxx` - Exit/wrap up session cleanly
- `ttt` - Run tests and validate
- `fff` - Fix/troubleshoot issues

---

## Notes for Claude

เมื่อเจอ shortcode ใน conversation:

1. **ไม่ต้องถาม confirm** - ทำทันที
2. **ใช้ format ตามที่กำหนด** - เพื่อความ consistent
3. **เก็บไฟล์ใน .mahirolab/state/** - ตาม specification
4. **แสดง summary สั้นๆ** - ไม่ต้อง verbose
5. **ถ้าเจอปัญหา** - รายงานและรอ instruction

---

*Protocol Version: 1.0.0 | Last Updated: 2025-01-03*
