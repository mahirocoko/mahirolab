# สไลด์นำเสนอ mahiro-lab

**Format:** Markdown (แปลงเป็น Marp, reveal.js หรือ PDF ได้)
**Duration:** 60 นาที
**Slides:** 34 หน้า (แบ่งสไลด์เพิ่มเติมเพื่อให้พอดี 1 หน้า)

---

<!-- Marp CSS Styling -->
<style>
section {
  font-size: 1.3em;
  line-height: 1.5;
}
h1 {
  font-size: 2em;
  margin-bottom: 0.5em;
}
h2 {
  font-size: 1.5em;
  margin-bottom: 0.4em;
}
h3 {
  font-size: 1.2em;
  margin-bottom: 0.3em;
}
ul, ol {
  margin: 0.5em 0;
  padding-left: 1.5em;
}
li {
  margin: 0.3em 0;
}
pre {
  font-size: 0.75em;
  margin: 0.5em 0;
}
code {
  font-size: 0.85em;
}
table {
  font-size: 0.85em;
  margin: 0.5em auto;
}
blockquote {
  font-size: 0.9em;
  margin: 0.5em 0;
  padding: 0.5em 1em;
}
</style>

---

<!-- Slide 1 -->
# mahiro-lab
## ปล่อยให้ AI ทำงานหนักแทนคุณ

**เวลานักพัฒนาควรใช้กับงานที่สำคัญ ไม่ใช่งานซ้ำซาก**

[ชื่อของคุณ]
[วันที่]

---

<!-- Slide 2 -->
# ปัญหาที่เจอทุกวัน (และทำให้เราปวดหัว)

❌ **สลับ context** กระโดดไปกระโดดมา → สมาธิหาย ผลงานช้า
❌ **งานซ้ำๆ** ทุกโปรเจกต์ → เสียเวลาที่มีค่า
❌ **Refactoring ใหญ่** ใช้เวลาชั่วโมง → ติดกับดักเดิมๆ
❌ **Research** เปิดแท็บเพียบ → ช้ากว่าเขียนโค้ดเสียอีก

> **ข้อเท็จจริง:** Dev ใช้เวลา 35% กับงานที่ไม่ใช่การเขียนโค้ด
>
> *(คิดดูสิ... เดือนนึง 20 วัน = 7 วันหายไปกับงานอื่น!)*

---

<!-- Slide 3 -->
# วิธีแก้ปัญหาที่มี... แต่ยังไม่เวิร์ค

**🤖 AI Chatbots (ChatGPT/Claude):**
- คุยเก่งมาก แต่**ทำให้ไม่ได้** → ต้อง copy-paste เอง
- **ลืม context** → ถามใหม่ต้องเล่าตั้งแต่ต้น
- เหมือนที่ปรึกษาที่ดี แต่**ไม่ได้ช่วยงาน**

**🔧 Automation แบบเก่า (Scripts & CI/CD):**
- ต้อง**เขียน script เองทุกอย่าง** → เสียเวลาตั้งค่า
- **ไม่ยืดหยุ่น** → แก้ไขยากถ้าต้องการเปลี่ยน
- เหมือนหุ่นยนต์ที่ทำได้**แค่สิ่งที่โปรแกรมไว้**

---

<!-- Slide 4 -->
# จินตนาการว่า... ถ้า AI ทำงานให้ได้จริงล่ะ?

✨ **ลงมือทำได้เลย** ไม่ต้องคัดลอกวางอีกต่อไป
✨ **จำบริบทได้** ไม่ต้องเล่าใหม่ทุกครั้ง
✨ **จัดการหลายงาน** พร้อมกันได้อย่างชาญฉลาด
✨ **เรียนรู้วิธีทำงานคุณ** และปรับตัวให้เข้ากัน

---

**mahiro-lab = ทำให้ฝันนี้เป็นจริง** 🎯

*(คิดซะว่าเป็น "ผู้ช่วยมหัศจรรย์" ที่ทำงานได้จริงๆ)*

---

<!-- Slide 5 -->
# mahiro-lab: เบื้องหลังการทำงาน

```
┌─────────────────────────────────────┐
│  คุณ (เป็นคนสั่งงาน)                │
│  พิมพ์คำสั่งง่ายๆ                   │
└──────────┬──────────────────────────┘
           │
           ├─→ งานด่วน (ทำเลย ได้ผลทันที)
           ├─→ งานค้นคว้า (หาข้อมูลจากเว็บ)
           └─→ งานใหญ่ (ทำเบื้องหลัง ไม่ต้องรอ)
                    │
                    ├─→ ผู้ช่วย 1 (ปรับโค้ด)
                    ├─→ ผู้ช่วย 2 (ทำเทสต์)
                    └─→ ผู้ช่วย 3 (เขียนเอกสาร)
```

**เปรียบเทียบ:** เหมือนมีทีมผู้ช่วยที่พร้อมทำงานตลอด 24/7

---

<!-- Slide 6 -->
# จุดเด่นของ mahiro-lab (1/2)

**1. ทำงานได้โดยตรง ไม่ต้องผ่านคนกลาง**
- AI รันคำสั่งได้เลย ไม่ต้องมีขั้นตอนซับซ้อน
- เห็นผลลัพธ์ชัดเจน ว่าสำเร็จหรือล้มเหลว
- เชื่อถือได้ เหมือนคุณรันเอง

**2. จำงานที่ทำได้ไม่ลืม**
- เก็บประวัติทุกครั้งที่ทำงาน
- เริ่มต่อจากจุดเดิมได้ทุกเมื่อ
- ติดตามความคืบหน้าแบบเรียลไทม์

---

<!-- Slide 6b -->
# จุดเด่นของ mahiro-lab (2/2)

**3. สั่งงานง่ายด้วยคำสั้นๆ**
- `ccc`: รวบรวมข้อมูลงาน
- `nnn`: วางแผนว่าจะทำอะไร
- `gogogo`: เริ่มทำเลย!
- `rrr`: ทบทวนว่าทำอะไรไปบ้าง

**4. ความปลอดภัยเป็นอันดับแรก**
- ทดสอบในพื้นที่ปลอดภัยก่อน
- ขออนุญาตชัดเจน ไม่ทำเองหมด
- ตรวจสอบก่อนยืนยันทุกครั้ง

---

<!-- Slide 7 -->
# ดูตัวอย่างกันเลย! (30 วินาที = เสร็จ)

**[สาธิตสด]**

```bash
$ ค้นหา TODO ทั้งหมดในโฟลเดอร์ src/
```

🔍 กำลังสแกนโค้ด...
✅ พบ TODO 12 รายการใน 8 ไฟล์

---

**มนต์ขลัง:** พิมพ์ครั้งเดียว → AI ทำให้หมด → ได้ผลทันที

*(เปรียบเทียบ: ปกติต้องเปิดแฟ้มทีละไฟล์... เมื่อยแค่ไหน!)*

---

<!-- Slide 8: Section Divider -->
# PART 2
## ตัวอย่างจริงจากการใช้งาน

---

<!-- Slide 9 -->
# 7 วิธีที่ mahiro-lab ช่วยคุณประหยัดเวลา (1/2)

| งาน | ก่อน | หลัง | ประหยัด |
|-----|------|------|---------|
| ⚡ Quick Fixes | 5-10 min | 30 sec | **95%** |
| 🔍 Research | 30-60 min | 5 min | **92%** |
| 🔄 Large Refactoring | 4 hours | 30 min | **87%** |
| ✅ Code Reviews | 20 min | 5 min | **75%** |

**งานด่วนและวิเคราะห์ → ประหยัด 85-95%** ⚡

---

<!-- Slide 9b -->
# 7 วิธีที่ mahiro-lab ช่วยคุณประหยัดเวลา (2/2)

| งาน | ก่อน | หลัง | ประหยัด |
|-----|------|------|---------|
| 📝 Documentation | 1 hour | 15 min | **75%** |
| 🧪 Test Generation | 45 min | 10 min | **78%** |
| 🐛 Bug Analysis | 30 min | 5 min | **83%** |

**เฉลี่ย: ประหยัดได้ 60-70% ต่องาน** 🎯

*(คิดเป็นเงิน: ถ้าบริษัทมี dev 10 คน = ประหยัด 3-4 คน-เดือน ต่อปี!)*

---

<!-- Slide 10 -->
# กรณีใช้งาน: การแก้โค้ดด่วน

**ก่อนหน้านี้ (Manual):** 5-10 นาที
1. ค้นหาปัญหา
2. เปิดไฟล์แล้วปรับแก้
3. ทดสอบการเปลี่ยนแปลง
4. commit

**เมื่อใช้ mahiro-lab:** 30 วินาที
```bash
$ ./codex-exec.sh low "Fix ESLint warnings in components/"
```

✅ ตรวจจับปัญหาอัตโนมัติ
✅ ลงมือแก้ไขให้เสร็จ
✅ แสดง diff ให้ตรวจสอบ

🌍 **เหมาะกับทุกคน**

---

<!-- Slide 11 -->
# กรณีใช้งาน: งานวิจัยเทคนิค

**ก่อนหน้านี้ (Manual):** 30-60 นาที
- เปิดแท็บเบราว์เซอร์เกิน 15 แท็บ
- อ่านเอกสารประกอบ
- สังเคราะห์ข้อมูล
- เขียนสรุป

**เมื่อใช้ mahiro-lab:** 5 นาที
```bash
$ ./codex-research.sh "React 19 Server Components"
```

✅ เปิดใช้งานการค้นเว็บ
✅ รายงานแบบมีโครงสร้างพร้อม citation
✅ บันทึกไว้ใน `.mahirolab/research/`

**[DEMO]**

💼 **ผลเชิงธุรกิจ:** เพิ่มประสิทธิภาพ 15 เท่า

---

<!-- Slide 12 -->
# กรณีใช้งาน: refactoring ขนาดใหญ่

**ก่อนหน้านี้ (Manual):** 4 ชั่วโมง
- วางแผนวิธีทำงาน
- อัปเดตไฟล์มากกว่า 20 ไฟล์ด้วยตัวเอง
- รักษาความสอดคล้อง
- ทดสอบอย่างรอบคอบ

**เมื่อใช้ mahiro-lab:** 30 นาที
```bash
$ ./codex-worker-launcher.sh high \
  "Refactor Button components to new design system"
```

✅ ทำงานเบื้องหลัง
✅ มีการติดตามความคืบหน้า
✅ ให้ผลลัพธ์ที่สอดคล้องกัน

🔧 **เหมาะกับนักพัฒนา**

---

<!-- Slide 13 -->
# เลือกลักษณะงานให้ถูกต้อง

**SYNCHRONOUS** (`codex-exec.sh`)
- ✓ งานสั้น (< 2 นาที)
- ✓ ต้องการผลทันที
- ✓ workflow แบบโต้ตอบ

**BACKGROUND** (`codex-worker-launcher.sh`)
- ✓ งานยาว (> 5 นาที)
- ✓ ไม่ต้องเฝ้าหน้าจอ
- ✓ execute หลายงานขนานกัน

**RESEARCH** (`codex-research.sh`)
- ✓ ต้องการข้อมูลล่าสุด
- ✓ จำเป็นต้องค้นเว็บ
- ✓ ต้องการผลลัพธ์แบบมีโครงสร้าง

---

<!-- Slide 14 -->
# เดโม Shortcode Protocol

**[LIVE TERMINAL DEMO]**

```bash
$ ccc          # Create context
$ nnn          # Create plan
$ gogogo       # Execute plan
$ lll          # Check status
```

**สาธิต:** state management, ความต่อเนื่องของ session, การติดตามความคืบหน้า

🔧 **เหมาะกับนักพัฒนา**

---

<!-- Slide 15 -->
# การเลือกระดับการ reasoning

| ระดับ | ระยะเวลา | ใช้สำหรับ |
|-------|-----------|-----------|
| `minimal` | ~5-10s | list ไฟล์, คำถามง่าย |
| `low` | ~10-15s | การแก้ไขด่วน, งานพื้นฐาน |
| `medium` | ~15-25s | งานวิจัย, ความซับซ้อนปานกลาง |
| `high` | ~30-60s+ | refactoring ขนาดใหญ่, การวิเคราะห์ลึก |

💡 **เทคนิค:** เริ่มต่ำก่อน แล้วค่อยเพิ่มถ้าผลลัพธ์ยังไม่พอ

---

<!-- Slide 16 -->
# แนวทางความปลอดภัยเป็นอันดับแรก (1/2)

### ⚠️ สำคัญ: แฟล็ก `danger-full-access`
- **สิทธิ์ระบบแบบไร้ข้อจำกัด**
- ใช้เฉพาะ dev environment
- หลีกเลี่ยงข้อมูลลับ

### ✅ แนวปฏิบัติที่ดี
- ตรวจสอบ diff ก่อน commit
- ดู exit code (0 = สำเร็จ)
- ใช้ version control
- ทดสอบใน sandbox

---

<!-- Slide 16b -->
# แนวทางความปลอดภัยเป็นอันดับแรก (2/2)

### 🔒 Production Safety
- **ห้ามรันบนระบบ production**
- จำกัดขอบเขตโฟลเดอร์
- เพิ่ม permission guards
- เฝ้าติดตามงานเบื้องหลัง

### 💡 เคล็ดลับ
- เริ่มจาก dev environment ก่อนเสมอ
- ตรวจสอบผลลัพธ์ทุกครั้ง
- เก็บ backup ไว้สม่ำเสมอ

---

<!-- Slide 17 -->
# การติดตามงาน

```bash
$ ./codex-status.sh --all

Running Jobs: 3
├─ research_20251022_141234 (5 min ago)
├─ worker_20251022_142000 (2 min ago)
└─ worker_20251022_143000 (30 sec ago)

Completed: 7 jobs (last 24h)
Storage: 45 MB (.mahirolab/)
```

---

<!-- Slide 18: Section Divider -->
# PART 3
## เจาะลึกด้านเทคนิค
**(เหล่านักพัฒนา เตรียมพร้อม! 🚀)**

---

<!-- Slide 19 -->
# เจาะลึกสถาปัตยกรรม (1/2)

<style scoped>
pre { font-size: 0.75em; }
code { font-size: 0.85em; }
</style>

**ชั้น Helper Script:**
- `codex-exec.sh` → wrapper สำหรับงาน sync
- `codex-research.sh` → ค้นเว็บ + เทมเพลต
- `codex-worker-launcher.sh` → งานเบื้องหลัง + PID

**Core Command:**
```bash
codex exec -s danger-full-access -c model_reasoning_effort="X" "prompt"
```

---

<!-- Slide 19b -->
# เจาะลึกสถาปัตยกรรม (2/2)

**State Management:**
```
.mahirolab/state/
├── context.md           # current session
├── context_history/     # versioned snapshots
├── plans/               # implementation plans
└── progress.md          # real-time tracking
```

**เก็บประวัติทุกอย่าง:**
- บริบทการทำงาน
- แผนที่วางไว้
- ความคืบหน้าแบบ real-time

---

<!-- Slide 20 -->
# ฟีเจอร์ขั้นสูง

**Parallel Execution:**
```bash
$ ./codex-worker-launcher.sh "Task 1" &
$ ./codex-worker-launcher.sh "Task 2" &
$ wait
```

**Context Versioning:**
- ทุก session มี version ใหม่
- จะต่อจากของเดิมหรือเริ่มใหม่ก็ได้

**Progress Tracking:**
```
[████████░░░░] 40% (6/15 tasks) ETA: 12 min
```

---

<!-- Slide 21 -->
# การปรับแต่ง & ขยายระบบ

**Custom Templates:**
- เทมเพลตรายงานวิจัย
- เทมเพลตงาน worker
- สร้างเทมเพลตเองได้

**Slash Commands:**
- สร้าง workflow แบบกำหนดเอง
- ใช้คำสั่งสั้นๆ ในการทำงาน

**MCP Integration:**
- Playwright, IDE diagnostics
- เชื่อมต่อ custom servers

---

<!-- Slide 22 -->
# Debugging & Troubleshooting (1/2)

**ปัญหาที่พบได้บ่อย:**

**งานล้มเหลวแบบไม่มีเสียงเตือน:**
- ✓ ตรวจ `.mahirolab/workers/*.md` เพื่อดู error
- ✓ ตรวจสอบ exit code
- ✓ ดู `execution_log.md`

**ไม่พบไฟล์ผลลัพธ์:**
- ✓ agent อาจยังเขียนไฟล์อยู่
- ✓ ตรวจไฟล์ชั่วคราว (`TEMP_codex_task.md`)
- ✓ รอไฟล์ที่ผูกกับ PID

---

<!-- Slide 22b -->
# Debugging & Troubleshooting (2/2)

**การเก็บกวาด & บำรุงรักษา:**
```bash
$ ./codex-cleanup.sh --age 7 --dry-run
$ ./codex-status.sh --stats
```

**เคล็ดลับ:**
- ตรวจสอบ log เป็นประจำ
- ลบไฟล์เก่าทุก 7-14 วัน
- ใช้ `--dry-run` ก่อนลบจริง

---

<!-- Slide 23 -->
# การผนวกรวมในโลกจริง (1/2)

**การพัฒนาในแต่ละวัน:**
- ตอนเช้า: `ccc` (ทบทวน context)
- วางแผน: `nnn` (สร้างแผน)
- ลงมือ: `gogogo` (รันงาน)
- เย็น: `rrr` (ทำ retrospective)

**CI/CD Integration:**
- รัน `codex exec` ใน pipeline
- วิเคราะห์โค้ดอัตโนมัติ
- สร้างเอกสาร
- รายงาน test coverage

---

<!-- Slide 23b -->
# การผนวกรวมในโลกจริง (2/2)

**การนำไปใช้ในทีม:**
1. เริ่มจากนักพัฒนาหนึ่งคน (พิสูจน์คุณค่า)
2. แชร์เทมเพลตและ pattern
3. สร้าง shortcode ที่เหมาะกับทีม
4. จัด retrospective เรื่องการใช้ AI เป็นประจำ

**ประสบการณ์จากการใช้จริง:**
- เริ่มเล็ก → พิสูจน์ → ขยายผล
- ให้ทีมเลือกงานที่เหมาะสม
- แชร์ความสำเร็จและเรียนรู้

---

<!-- Slide 24 -->
# เริ่มต้นใช้งาน

**Prerequisites:**
- ✓ ติดตั้ง Claude Code แล้ว
- ✓ มี Git repository
- ✓ เข้าถึงเทอร์มินัลได้

**Quick Start:**
```bash
1. Clone mahiro-lab
   $ git clone [repo-url]

2. Make scripts executable
   $ chmod +x .mahirolab/bin/*.sh

3. Run your first task
   $ ./codex-exec.sh low "Describe this project"

4. Explore examples
   $ ls .mahirolab/examples/
```

**เอกสารฉบับเต็ม:** [GitHub link]

---

<!-- Slide 25: Section Divider -->
# WRAP-UP
## ประเด็นสำคัญ & ขั้นตอนถัดไป

---

<!-- Slide 26 -->
# ประเด็นสำคัญ

### 🔧 นักพัฒนา
- Orchestrator/worker pattern
- exec, research, worker-launcher
- shortcode workflow

### 💼 ผู้จัดการ
- ประหยัด 60-70% เวลา
- เริ่มเล็ก → พิสูจน์ → ขยาย

### 🌍 ทุกคน
- AI ทำงานได้จริง
- AI workflow มาแล้ว

---

<!-- Slide 27 -->
# แหล่งข้อมูล

**📚 เอกสาร:**
- GitHub: [repo-url]
- Quick Start: README.md
- Examples: `.mahirolab/examples/`

**💡 เทมเพลต:**
- รายงานงานวิจัย
- งาน worker
- workflow แบบกำหนดเอง

**🎯 ขั้นตอนถัดไป:**
- Clone แล้วทดลอง
- เข้าร่วมการสนทนา (Issues/Discussions)
- แชร์ use case ของคุณ

**📧 ติดต่อ:** [your-contact]

---

<!-- Slide 28 -->
# มีคำถามไหม?

❓ **คำถามของคุณ**

---

**คำถามที่มักถูกถามไว้ล่วงหน้า:**
- ต่างจาก GitHub Copilot อย่างไร?
- ใช้กับโมเดล AI อื่นได้ไหม?
- ค่าใช้จ่าย (API usage) เป็นอย่างไร?
- ความปลอดภัย?
- ฟีเจอร์การทำงานร่วมกันสำหรับทีม?

---

# ขอบคุณ!

**มาร่วมกันสร้างอนาคตของการพัฒนาที่มี AI เป็นผู้ช่วย**

[GitHub Repository]
[Contact Information]
[Social Media]

---

<!-- END OF SLIDES -->

## บันทึกสำหรับสไลด์

**Total Slides:** 28
**Format:** Markdown (พร้อมแปลงเป็น Marp/reveal.js)
**Theme Suggestion:** ธีมสีเข้ม คอนทราสต์สูง
**Font:** Monospace สำหรับโค้ด, Sans-serif สำหรับเนื้อหา

**Marp Conversion:**
Add frontmatter:
```yaml
---
marp: true
theme: default
class: invert
paginate: true
style: |
  .columns-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
  }
  .columns-3 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 1.5rem;
  }
---
```

**reveal.js Conversion:**
Use pandoc:
```bash
pandoc slides.md -t revealjs -s -o slides.html
```
