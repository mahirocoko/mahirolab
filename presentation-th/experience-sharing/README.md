# Experience Sharing Presentation

**มนุษย์กับ AI: ความหวัง ความเจ็บปวด และบทเรียนจริง**

จากประสบการณ์การใช้ Claude Code + Codex

---

## 📖 Overview

Presentation นี้เป็นการแชร์ประสบการณ์จริงในการใช้ Claude Code และการสร้าง Codex Architecture - รวมถึงความท้าทาย บทเรียน และข้อค้นพบสำคัญเกี่ยวกับ Context Management

**Duration:** 45-60 นาที
**Format:** Experience sharing + Story-telling
**Level:** ทุกระดับ (เน้นประสบการณ์มากกว่า technical)

---

## 📂 Directory Structure

```
presentation-th/experience-sharing/
├── slides/
│   └── experience-slides.md       # สไลด์หลัก (37 slides, 7 Acts)
├── demos/
│   └── demo-scripts.md            # Demo scripts (4 options)
├── notes/
│   └── speaker-notes.md           # Speaker notes พร้อม timing guide
├── assets/                        # (สำหรับรูปภาพ/วิดีโอ ถ้ามี)
└── README.md                      # ไฟล์นี้
```

---

## 🎯 Key Messages

1. **Context > Everything** - การใช้ AI ที่ดี = การบริหาร Context ที่ดี
2. **Workflows > Commands** - สร้าง repeatable workflows แทนคำสั่งแบบ ad-hoc
3. **Balance > Perfection** - "Good enough" ดีกว่า "Perfect but never done"

---

## 🎭 Presentation Structure (7 Acts)

| Act | Theme | Duration | Slides |
|-----|-------|----------|--------|
| **Act 1** | The Honeymoon Phase | 5 min | 3 |
| **Act 2** | Reality Check - ความเจ็บปวด | 15 min | 7 |
| **Act 3** | The Turning Point | 12 min | 8 |
| **Act 4** | The Solution - Codex | 8 min | 5 |
| **Act 5** | Lessons Learned | 8 min | 6 |
| **Act 6** | Honest Talk | 4 min | 2 |
| **Act 7** | Wrap-up & Q&A | 5 min | 4 |

**Total:** 37 slides, ~57 minutes (excluding demos and extended Q&A)

---

## 🎬 Demo Options

มี 4 demo scripts พร้อมใช้งาน (อยู่ใน `demos/demo-scripts.md`):

1. **Context Chaos** (2-3 min) - แสดงปัญหา Context Explosion + Illusion of Control
2. **Before/After Workflow** (3-4 min) - เปรียบเทียบก่อน/หลังใช้ Context Management
3. **Research Workflow** (2-3 min) - แสดง Research mode + Background workers
4. **State Management Magic** (3-4 min) - แสดง Session Continuity + Context Versioning

**แนะนำ:** เลือก 2-3 demos = ~6-10 นาที

---

## 🚀 How to Use This Presentation

### Prerequisites

- ติดตั้ง [Marp CLI](https://github.com/marp-team/marp-cli) หรือใช้ [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode)
- ถ้าจะ demo: ต้องมี Codex binary พร้อมใช้ (ดู [installation guide](../../CLAUDE.md))

### Generate Slides

#### Option 1: Marp CLI
```bash
# PDF
marp slides/experience-slides.md --pdf -o output/experience-slides.pdf

# HTML
marp slides/experience-slides.md --html -o output/experience-slides.html

# PowerPoint (PPTX)
marp slides/experience-slides.md --pptx -o output/experience-slides.pptx
```

#### Option 2: VS Code Extension
1. เปิด `slides/experience-slides.md` ใน VS Code
2. กด `Ctrl/Cmd + Shift + P` → "Marp: Export Slide Deck"
3. เลือก format (PDF/HTML/PPTX)

#### Option 3: Preview Mode
```bash
# Live preview with auto-reload
marp -s slides/
```

Then open: http://localhost:8080/experience-slides.md

---

## 📋 Pre-Presentation Checklist

### 1-2 Days Before
- [ ] ทดสอบ demos 2-3 รอบ
- [ ] เตรียม backup screenshots/videos กรณี live demo fail
- [ ] อ่าน speaker notes 1 รอบ
- [ ] ตั้งเวลาทดสอบ presentation ครั้งเดียว (dry run)

### Day Of
- [ ] Generate slides เป็น PDF/HTML
- [ ] Test projector/screen resolution
- [ ] เปิด slides ใน presentation mode
- [ ] Terminal font size 16-18pt (ถ้า demo live)
- [ ] เปิด speaker notes ใน device ที่สอง
- [ ] น้ำดื่มพร้อม
- [ ] Timer/clock มองเห็นได้

### During Setup
- [ ] Test slides display correctly
- [ ] Test demos (ถ้าจะ demo live)
- [ ] GitHub link พร้อมแชร์
- [ ] Q&A prompts พร้อม

---

## 🎯 Recommended Flow

### For 45-minute slot:
1. Acts 1-7: ~35 min
2. Demo 1 + Demo 2: ~6 min
3. Q&A: ~4 min

### For 60-minute slot:
1. Acts 1-7: ~50 min (เล่าละเอียดขึ้น)
2. Demos 1 + 2 + 4: ~10 min
3. Q&A: ~10 min

---

## 💡 Tips for Presenters

### Energy Management
- **Act 1:** Enthusiastic, hopeful
- **Act 2:** Realistic, honest (นี่คือ climax ของเรื่อง!)
- **Act 3:** Insightful, enlightening (natural breather - drink water)
- **Acts 4-5:** Solutions-focused, helpful
- **Act 6:** Vulnerable, humorous
- **Act 7:** Inspiring, wrapping up

### Pacing
- ไม่ต้องรีบ - especially Act 2 (pain points)
- Pause หลัง key insights
- ดูอารมณ์ผู้ฟัง - adjust accordingly
- เก็บ technical details ไว้ตอบคำถามภายหลัง

### Interaction
- "ใครเคยเจอแบบนี้บ้าง?" (check for relatability)
- Encourage nodding/reactions
- Q&A ระหว่างทาง OK แต่ไม่ให้ตกขบวน

---

## 🔧 Customization Guide

### ถ้าต้องการปรับแต่ง:

1. **ลดเวลา (30 min):**
   - ตัด Act 6 (Honest Talk)
   - Compress Act 5 → 3 lessons แทน 6
   - Skip demos

2. **เพิ่มเวลา (90 min):**
   - เพิ่ม anecdotes ใน Act 2
   - Demo ครบทั้ง 4 options
   - Q&A session ยาวขึ้น
   - Workshop-style: ให้ผู้ฟันลอง hands-on

3. **เปลี่ยน tone:**
   - Technical audience: เพิ่ม technical depth ใน Act 4
   - Non-technical: เน้น stories/metaphors ใน Act 2-3

4. **ภาษาอังกฤษ:**
   - แปล slides (keep structure เดิม)
   - Humor อาจต้องปรับให้เหมาะสมกับบริบท

---

## 📚 Related Resources

- **Main Documentation:** [`CLAUDE.md`](../../CLAUDE.md)
- **Shortcodes Guide:** [`.mahirolab/docs/SHORTCODES.md`](../../.mahirolab/docs/SHORTCODES.md)
- **State Management:** [`.mahirolab/docs/STATE_MANAGEMENT.md`](../../.mahirolab/docs/STATE_MANAGEMENT.md)
- **Project Structure:** [`.mahirolab/docs/PROJECT_STRUCTURE.md`](../../.mahirolab/docs/PROJECT_STRUCTURE.md)

---

## 🤝 Feedback & Contributions

ถ้ามีข้อเสนอแนะหรือพบปัญหา:
- เปิด Issue ที่ [GitHub](https://github.com/mahirocoko/mahirolab/issues)
- หรือ PR เพื่อปรับปรุง presentation

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2025-11-03 | Initial release - 37 slides, 7 Acts |

---

## 🙏 Credits

**Created by:** Mahiro
**Based on:** Real experience with Claude Code & Codex
**Generated with:** Claude Code (via `gogogo` workflow! 🎯)

---

**"Context is King. Manage it well."** 👑
