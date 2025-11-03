# Demo Scripts - Experience Sharing Presentation

**เวอร์ชัน:** 1.0
**สร้างเมื่อ:** 2025-11-03
**ระยะเวลา:** 2-4 นาทีต่อ demo

---

## Demo Option 1: Context Chaos (2-3 นาที)

**จุดประสงค์:** แสดงปัญหา Context Explosion + Illusion of Control

### Setup
```bash
cd ~/demo-project
# เตรียม project ง่ายๆ ที่มีหลายไฟล์
```

### Steps

**1. สาธิต Context Explosion**
```
Narrator: "ลองให้ Claude แก้ bug เล็กน้อยดู..."

Command: "Fix the login timeout bug"

Claude: *เริ่มอ่านไฟล์*
- src/auth/login.ts
- src/auth/session.ts
- src/utils/validators.ts
- ...
- (แสดงว่าอ่านไปเรื่อยๆ จนเกือบ context full)

Narrator: "เห็นไหม? แค่แก้ bug นึง แต่ context เต็มไปหมด!"
```

**2. สาธิต Illusion of Control**
```
Narrator: "แล้วพอ Claude ทำเสร็จ..."

Claude Output:
- แก้ bug ✅
- Refactor ทั้ง auth system 😱
- เพิ่ม tests
- Update documentation
→ Git diff: 500+ lines changed

Narrator: "ผมแค่อยากแก้ bug... แต่ได้ทั้ง refactor กลับมา 😅"
```

### Expected Output
- ชัดเจนว่า context management แย่ → ผลลัพธ์ไม่ตรงใจ

### Talking Points
- "นี่คือสิ่งที่เกิดขึ้นบ่อยครั้ง"
- "ไม่ใช่ AI แย่... แต่เราไม่ได้บริหาร context"
- "เดี๋ยวเราจะดูว่าแก้ไงให้ดีขึ้น"

---

## Demo Option 2: Before/After Workflow (3-4 นาที)

**จุดประสงค์:** แสดงผลของ Context Management ที่ดี

### Setup
```bash
cd ~/mahiro-lab
# ต้องมี .mahirolab/state/ พร้อมใช้
```

### Steps

**Part 1: BEFORE (Without Context Management)**
```
Narrator: "แบบเก่า: สั่งงาน Claude โดยตรง"

You: "Create a new authentication feature"
Claude: *งงๆ*
- "What kind of auth?"
- "What's the current stack?"
- "Should I update existing code?"

You: *ต้องคอยอธิบายไปเรื่อยๆ*

Result: ใช้เวลานาน, ผลลัพธ์ไม่แน่ใจ
```

**Part 2: AFTER (With Codex + Shortcodes)**
```
Narrator: "แบบใหม่: ใช้ shortcode workflow"

# Step 1: Create context
You: "ccc"
Claude: → สร้าง context.md (goals, decisions, status)
Narrator: "Context ชัดเจนตั้งแต่ต้น"

# Step 2: Plan
You: "nnn"
Claude: → สร้าง plan_YYYYMMDD.md
  - Tasks breakdown ชัดเจน
  - Dependencies ระบุไว้
  - Success criteria มี
Narrator: "Plan ครบ ก่อนเริ่มทำ"

# Step 3: Execute
You: "gogogo"
Claude: → ทำทีละ task
  - Update progress.md real-time
  - Report ทุก step
  - มีประวัติทุกอย่าง

# Step 4: Review
You: "rrr"
Claude: → สร้าง retrospective.md
Narrator: "มี retrospective ด้วย!"

Result: เร็วขึ้น, มั่นใจขึ้น, reproducible!
```

### Expected Output
- เห็นความต่างชัดเจน
- ทำให้เข้าใจว่า context management ช่วยอย่างไร

### Talking Points
- "ใช้เวลาแค่ 5 นาที setup context → ประหยัดหลายชั่วโมงภายหลัง"
- "Workflow ชัดเจน = ซ้ำได้ทุกครั้ง"
- "Documentation เกิดอัตโนมัติ"

---

## Demo Option 3: Research Workflow (2-3 นาที)

**จุดประสงค์:** แสดง Research mode + Background workers

### Setup
```bash
cd ~/mahiro-lab
# ต้องมี codex binary พร้อมใช้
```

### Steps

**1. Start Research Job**
```
Narrator: "ต้องการหาข้อมูลล่าสุดเกี่ยวกับหัวข้อหนึ่ง"

You: 'rrresearch "React 19 new features"'

Claude:
→ 🔍 Starting research job...
→ Job ID: bash_12345
→ Output: .mahirolab/research/20251103_XXXXX_react_19.md
→ ✅ Running in background
```

**2. Work on other things**
```
Narrator: "ระหว่างรอ research เสร็จ... ทำงานอื่นได้เลย"

You: *ทำงานอื่นต่อ*

Narrator: "ไม่ต้องนั่งรอ! Background worker จัดการให้"
```

**3. Check Status**
```
Narrator: "สักพักมาเช็คสถานะ"

You: "Check research status"

Claude: → Shows progress/output from bash_id
```

**4. Review Results**
```
Narrator: "พอเสร็จแล้ว มี report ครบถ้วน"

→ แสดง research report structure:
  - Executive Summary
  - Key Findings
  - Technical Specs
  - References (plain URLs)
  - Recommendations
```

### Expected Output
- Research report ครบถ้วน พร้อม citations
- เห็นว่า background mode ทำงานจริง

### Talking Points
- "Web search included → ข้อมูลล่าสุด"
- "Background execution → ไม่เสียเวลารอ"
- "Template injection → output consistent"

---

## Demo Option 4: State Management Magic (3-4 นาที)

**จุดประสงค์:** แสดง Session Continuity + Context Versioning

### Setup
```bash
cd ~/mahiro-lab
# มี context.md, context_history/ พร้อม
```

### Steps

**1. Show Current State**
```
Narrator: "ดู state ปัจจุบันก่อน"

Command: "lll"  # List status

Output:
→ Dashboard แสดง:
  - Current context
  - Active plan
  - Progress (X/Y tasks)
  - Git status
  - Recent jobs
```

**2. Context Versioning**
```
Narrator: "ทุก session มี version"

Show: .mahirolab/state/context_history/
  - context_v1_20251101.md
  - context_v2_20251101.md
  - context_v3_20251103.md

Narrator: "ย้อนดูประวัติได้ทุกเมื่อ"
```

**3. Session Continuity**
```
Narrator: "เริ่ม session ใหม่"

You: "ccc"

Claude:
→ "Found existing context. Continue or Start fresh?"
→ User selects: [1] Continue

→ Shows diff between old and new
→ Merges contexts
→ Creates new version (v4)

Narrator: "Session ต่อเนื่อง! ไม่ต้องเริ่มศูนย์"
```

**4. Progress Tracking**
```
Narrator: "ระหว่างทำงาน มี real-time progress"

Show: progress.md updates
→ Progress bars
→ Task timestamps
→ ETA calculation
→ Execution log

Narrator: "รู้ว่าทำไปถึงไหนทุกเมื่อ"
```

### Expected Output
- เห็นว่า state management ทำงานจริง
- Context versioning + session continuity มีประโยชน์

### Talking Points
- "State management = ประวัติทุกอย่าง"
- "Context versioning = time travel"
- "Progress tracking = visibility ตลอดเวลา"
- "Session continuity = ไม่เสียบริบท"

---

## General Tips สำหรับทุก Demo

### Preparation
- ✅ Test demo script ก่อนนำเสนอ 2-3 รอบ
- ✅ Prepare backup screenshots/videos กรณี live demo fail
- ✅ Set terminal font size ใหญ่พอ (16-18pt)
- ✅ เตรียม cheat sheet ไว้ข้างๆ

### During Demo
- 🗣️ Narrate ทุก step - อธิบายว่ากำลังทำอะไร
- ⏸️ Pause ให้ผู้ฟังเห็นผลลัพธ์ก่อนไป step ต่อไป
- 🎯 Focus ที่ key message ของแต่ละ demo
- 😊 ถ้าเจอ error → Stay calm, ใช้ backup screenshots

### Timing
- Demo 1: 2-3 นาที (แสดงปัญหา)
- Demo 2: 3-4 นาที (แสดง solution)
- Demo 3: 2-3 นาที (research workflow)
- Demo 4: 3-4 นาที (state management)

**รวมทั้งหมด:** เลือก 2-3 demos = 6-10 นาที

---

## Recommended Demo Combination

**สำหรับ 45-minute presentation:**

1. **Demo 1 (Context Chaos)** - 3 นาที
   - แสดงปัญหาให้เห็นชัดเจน

2. **Demo 2 (Before/After)** - 4 นาที
   - แสดงว่า solution แก้ปัญหาได้จริง

3. **Demo 4 (State Management)** - 3 นาที
   - Highlight features เด่น

**Total:** ~10 นาที (เหมาะสม!)

**Skip Demo 3 (Research)** ถ้าเวลาไม่พอ - เพราะ mention ไว้ใน slides แล้ว

---

**Last Updated:** 2025-11-03
**Version:** 1.0
