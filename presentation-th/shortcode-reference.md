# บัตรอ้างอิง Shortcode

**คู่มือย่อสำหรับโปรโตคอล shortcode ของ mahiro-lab**

---

## Shortcode หลัก

### `ccc` - Create Context & Compact

**วัตถุประสงค์:** สร้างหรือรีเฟรช session context

**วิธีใช้:** พิมพ์ `ccc` ใน Claude Code

**สิ่งที่ทำ:**
- สร้าง `.mahirolab/state/context.md`
- สรุปการสนทนา
- ตั้งเป้าหมายและขั้นตอนถัดไป
- สร้าง snapshot ที่มีเวอร์ชันใน `context_history/`

**ตัวอย่างผลลัพธ์:**
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

**ใช้เมื่อใด:**
- เริ่ม session ใหม่
- ก่อนสร้าง plan
- เมื่อการสนทนายาวเกินไป

---

### `nnn` - Smart Planning

**วัตถุประสงค์:** สร้าง plan การพัฒนาเชิงรายละเอียด

**วิธีใช้:** พิมพ์ `nnn` ใน Claude Code

**สิ่งที่ทำ:**
- รัน `ccc` ให้อัตโนมัติถ้า context ไม่มีหรือเก่า
- อ่าน context ปัจจุบัน
- สร้าง plan แบบมีโครงสร้างใน `.mahirolab/state/plans/`
- แบ่งงานออกเป็น phase และ task

**ตัวอย่างผลลัพธ์:**
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

**ใช้เมื่อใด:**
- ก่อนเริ่มงานใหญ่
- ต้องการ roadmap ชัดเจน
- ต้องแยกงานซับซ้อนออกเป็นส่วนย่อย

---

### `gogogo` - Execute Plan

**วัตถุประสงค์:** รัน plan ล่าสุด

**วิธีใช้:** พิมพ์ `gogogo` ใน Claude Code

**สิ่งที่ทำ:**
- อ่าน plan ล่าสุดจาก `.mahirolab/state/plans/`
- สร้าง `.mahirolab/state/progress.md`
- ดำเนิน task ตามลำดับ
- อัปเดต progress แบบเรียลไทม์
- บันทึกลง `execution_log.md`

**ตัวอย่างผลลัพธ์:**
```
🚀 Execution started!

Phase 1: Setup
🔄 Configuring environment...
✅ Complete (15 seconds)

[████████░░░░░░░░░░░░] 40% (2/5 tasks)
ETA: 8 minutes
```

**ใช้เมื่อใด:**
- พร้อมดำเนินตาม plan
- ต้องการให้งานเดินหน้าอัตโนมัติ
- ต้องการติดตามความคืบหน้า

---

### `rrr` - Retrospective

**วัตถุประสงค์:** สร้าง retrospective ของ session

**วิธีใช้:** พิมพ์ `rrr` ใน Claude Code

**สิ่งที่ทำ:**
- รวบรวมข้อมูลจาก context, plans, progress
- คำนวณเมตริกของ session
- สร้าง retrospective แบบครบถ้วน
- บันทึกใน `.mahirolab/state/retrospectives/`

**ตัวอย่างผลลัพธ์:**
```markdown
# Session Retrospective
**Date:** 2025-10-22
**Duration:** 3 hours

[... omitted 88 of 344 lines ...]

**Features:**
- Web search enabled
- Medium reasoning (fixed)
- Structured markdown report
- Claude monitors progress
```

**ใช้เมื่อใด:**
- ปิด session
- ต้องการสรุปการทำงาน
- เตรียมข้อมูลสำหรับ onboarding รอบถัดไป

---

### `lll` - Live Log & Status

**วัตถุประสงค์:** ตรวจสอบสถานะล่าสุด

**วิธีใช้:** พิมพ์ `lll` ใน Claude Code

**สิ่งที่ทำ:**
- อ่าน progress ปัจจุบัน
- สรุป context, plans, execution ล่าสุด
- แสดง dashboard สถานะ
- ไฮไลต์งานที่ยังรอทำ

**ตัวอย่างผลลัพธ์:**
```markdown
# Live Status
**Session:** 20251022_150000

## Progress
- ✅ Task 1.1 Complete
- 🔄 Task 1.2 In Progress
- ⏳ Task 2.1 Pending

## Notes
- Awaiting database credentials
```

**ใช้เมื่อใด:**
- ต้องการสำรวจสถานะระหว่าง session
- เช็กว่างานไหนเสร็จแล้วหรือยังค้างอยู่
- ใช้เตรียมการก่อนกลับเข้าสู่ `gogogo`

---

### `rrresearch` - Research Assistant

**วัตถุประสงค์:** ให้ Claude ทำ research รูปแบบโครงสร้าง

**วิธีใช้:** `rrresearch "หัวข้อที่ต้องการค้นหา"`

**สิ่งที่ทำ:**
- สร้างโครงร่าง research
- รวบรวมข้อมูลพร้อมแหล่งอ้างอิง
- สรุป insight และข้อเสนอแนะ
- บันทึกผลใน `.mahirolab/research/`
- อัปเดต context เมื่อจำเป็น

**ตัวอย่างผลลัพธ์:**
```markdown
# Research Summary
**Topic:** best practices for API versioning

## Key Findings
1. Support multiple versions simultaneously
2. Use semantic versioning
3. Document clearly

## Recommendations
- Implement versioned routes
- Add deprecation notices
```

**ใช้เมื่อใด:**
- ต้องการข้อมูลเชิงลึก
- ต้องการสรุปอ้างอิงได้ทันที
- ใช้เตรียม content ก่อนวาง plan

---

### `www` - Claude-Managed Worker

**วัตถุประสงค์:** รันงานเบื้องหลังพร้อม monitoring

**วิธีใช้:** `www [reasoning] "task"`

**ตัวอย่าง:**
```bash
# Default (low reasoning)
www "Generate unit tests for utils/"

# Medium reasoning
www medium "Refactor authentication module"

# High reasoning
www high "Migrate entire codebase to TypeScript"
```

**คุณสมบัติ:**
- รันงานแบบ background
- ปรับระดับ reasoning ได้
- มี progress monitoring
- Claude ดูแลการทำงานให้

**เช็กสถานะ:**
```
User: check worker status
```

---

## ตัวอย่าง Workflow

### ตัวอย่างที่ 1: Quick Start
```
User: ccc
User: nnn
User: gogogo
```

### ตัวอย่างที่ 2: Research → Plan → Execute
```
User: rrresearch "best practices for..."
[wait for completion]
User: ccc
User: nnn
User: gogogo
```

### ตัวอย่างที่ 3: Parallel Work
```
User: www high "large refactoring task"
User: ccc
[work on other things]
User: check worker status
```

### ตัวอย่างที่ 4: Status Check
```
User: lll
[review status]
User: gogogo
[continue execution]
```

---

## เคล็ดลับ & แนวทางที่ดี

**✅ DO:**
- รัน `ccc` เมื่อเริ่ม session
- ใช้ `nnn` ก่อนงานซับซ้อน
- เช็ก `lll` เป็นระยะ
- สร้าง `rrr` เมื่อปิด session
- ติดตามงาน background

**❌ DON'T:**
- อย่า `gogogo` โดยไม่มี plan
- อย่าข้ามการสร้าง context
- อย่าลืม retrospective
- อย่ามองข้าม progress tracking

---

## ตำแหน่งไฟล์สถานะ

ไฟล์ state ทั้งหมดอยู่ใน `.mahirolab/state/`:

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

**พิมพ์บัตรนี้ไว้ใช้อ้างอิงได้เลย!**
