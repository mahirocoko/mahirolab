# วัสดุนำเสนอ mahiro-lab

**แพ็กเกจการนำเสนอครบชุดสำหรับการบรรยาย 60 นาที**

---

## 📁 โครงสร้างไดเรกทอรี

```
presentation/
├── README.md                      # This file
├── audience-analysis.md           # Audience segment analysis
├── presentation-structure.md      # 3-layer presentation design
├── quick-start.md                 # 5-minute quick start guide
├── shortcode-reference.md         # Shortcode reference card
├── best-practices.md              # Best practices & tips
│
├── slides/
│   ├── outline.md                 # Detailed slide outline with timing
│   └── slides.md                  # Complete slide deck (Markdown)
│
├── use-cases/
│   ├── use-case-catalog.md        # 7 use cases + 5 bonus
│   ├── 01-quick-fixes.md          # Detailed: Quick code fixes
│   ├── 02-research.md             # Detailed: Technical research
│   ├── 03-refactoring.md          # Detailed: Large-scale refactoring
│   └── 04-07-additional-use-cases.md  # Summary: 4 additional use cases
│
├── demos/
│   ├── demo-script.md             # Step-by-step demo scripts
│   ├── demo-checklist.md          # Pre-presentation checklist
│   └── presenter-notes.md         # Presenter notes & timing
│
└── assets/
    └── diagrams.md                # ASCII diagrams for slides
```

---

## 🎯 ภาพรวมการนำเสนอ

**ชื่อเรื่อง:** mahiro-lab: AI-Assisted Development Orchestration
**ระยะเวลา:** 60 นาที
**รูปแบบ:** Slides + Live demos
**กลุ่มเป้าหมาย:** นักพัฒนา ผู้จัดการ ผู้ฟังทั่วไป

### โครงร่าง:
1. **Part 1 (15 นาที):** พื้นฐาน - ปัญหา วิสัยทัศน์ แนวคิดหลัก
2. **Part 2 (20 นาที):** เวิร์กโฟลว์เชิงปฏิบัติ - Use cases demo รูปแบบการใช้งาน
3. **Part 3 (15 นาที):** เจาะลึกเทคนิค - สถาปัตยกรรม การปรับแต่ง
4. **Part 4 (10 นาที):** สรุปและถามตอบ

---

## 🚀 เริ่มต้นเร็วสำหรับผู้นำเสนอ

### 1. ทบทวนวัสดุ (1 ชั่วโมง)
```bash
# Read these files first:
1. presentation-structure.md       # Understand the flow
2. slides/outline.md               # Review all slides
3. demos/demo-script.md            # Practice demos
4. presenter-notes.md              # Timing and tips
```

### 2. เตรียม demo (30 นาที)
```bash
# Follow demo checklist:
cd demos/
cat demo-checklist.md

# Test each demo:
- Quick fix demo
- Research demo
- Shortcode workflow demo
```

### 3. แปลงสไลด์ (10 นาที)

**ตัวเลือก A: Marp (แนะนำ)**
```bash
# Install Marp CLI
npm install -g @marp-team/marp-cli

# Convert to PDF
marp slides/slides.md --pdf -o mahiro-lab-presentation.pdf

# Convert to HTML
marp slides/slides.md -o mahiro-lab-presentation.html
```

**ตัวเลือก B: reveal.js**
```bash
# Install pandoc
brew install pandoc  # macOS
# or apt-get install pandoc  # Linux

# Convert
pandoc slides/slides.md -t revealjs -s -o slides.html
```

**ตัวเลือก C: ใช้ตามต้นฉบับ**
- นำเสนอจาก markdown โดยตรง
- ใช้ VSCode พร้อม Markdown Preview
- หรือใช้ markdown viewer ใดก็ได้

---

## 📊 ตัวชี้วัดสำคัญที่ควรเน้น

- **ค่าเฉลี่ยการประหยัดเวลา:** 83% ทุก use case
- **Quick fixes:** เร็วขึ้น 95% (10 นาที → 30 วินาที)
- **Research:** เร็วขึ้น 92% (60 นาที → 5 นาที)
- **Refactoring:** เร็วขึ้น 87% (4 ชั่วโมง → 30 นาที)

---

## 🎬 ภาพรวม Live demo

### Demo #1: Quick Fix (Slide 7)
**ระยะเวลา:** 2 นาที
**คำสั่ง:** `./codex-exec.sh low "List all TODO comments"`
**วัตถุประสงค์:** แสดงความง่ายและความรวดเร็ว

### Demo #2: Research (Slide 11)
**ระยะเวลา:** 3-4 นาที
**คำสั่ง:** `./codex-research.sh "React 19 Server Components"`
**วัตถุประสงค์:** แสดงการใช้งานเว็บและผลลัพธ์ที่มีโครงสร้าง

### Demo #3: Shortcode Workflow (Slide 14)
**ระยะเวลา:** 5 นาที
**คำสั่ง:** `ccc` → `nnn` → `gogogo`
**วัตถุประสงค์:** แสดงการจัดการสถานะและเวิร์กโฟลว์ครบวงจร

**เวลารวมของ demo:** ประมาณ 15 นาทีจากการบรรยาย 60 นาที

---

## 📚 เอกสารแจก

มอบสิ่งเหล่านี้ให้ผู้เข้าฟัง:
1. `quick-start.md` - เริ่มใช้งานใน 5 นาที
2. `shortcode-reference.md` - การ์ดอ้างอิงรวดเร็ว
3. `best-practices.md` - เคล็ดลับและแนวทางที่ดี
4. `use-cases/` - เอกสาร use case ทั้ง 7 รายการ

**เคล็ดลับ:** พิมพ์ `shortcode-reference.md` เป็นแผ่นเดียวสำหรับแจก

---

## 🎨 ปรับแต่งการนำเสนอ

### แบรนดิ้ง
แก้ไข `slides/slides.md`:
- บรรทัด 8: ใส่ชื่อของคุณ
- บรรทัด 9: ใส่วันที่
- Slide 27: เพิ่มข้อมูลติดต่อ
- Slide 29: เพิ่มลิงก์โซเชียลมีเดีย

### ปรับเวลา
- **เวอร์ชัน 30 นาที:** ใช้เฉพาะ slides 1-12, 24, 26
- **เวอร์ชัน 45 นาที:** ข้าม slides 19-23 (เจาะลึกเทคนิค)
- **เวิร์กช็อป 90 นาที:** เพิ่มกิจกรรมปฏิบัติหลังแต่ละ demo

### ปรับเนื้อหา
- **เฉพาะผู้ฟังสายเทคนิค:** ขยาย Part 3 (slides 19-25)
- **เฉพาะผู้บริหาร:** เน้นตัวเลขและ ROI ใน Part 2
- **ผู้ฟังทั่วไป:** โฟกัส Part 1-2 ข้าม Part 3

---

## ✅ เช็กลิสต์ก่อนการนำเสนอ

**1 สัปดาห์ก่อน:**
- [ ] ทบทวนวัสดุทั้งหมด
- [ ] ฝึก demo อย่างน้อย 3 ครั้ง
- [ ] ปรับสไลด์ด้วยข้อมูลของคุณ
- [ ] ส่งออกเป็นรูปแบบที่ต้องการ
- [ ] ทดสอบโหมดนำเสนอ

**1 วันก่อน:**
- [ ] ทดสอบ demo อีกครั้ง
- [ ] เตรียมวัสดุสำรอง (สกรีนช็อต)
- [ ] ตรวจสอบการเชื่อมต่ออินเทอร์เน็ต
- [ ] พิมพ์เอกสารแจก (ถ้าจำเป็น)

**1 ชั่วโมงก่อน:**
- [ ] ตั้งค่าเทอร์มินัล (ขนาดฟอนต์ ธีม)
- [ ] ล้างประวัติเทอร์มินัล
- [ ] ทดสอบการแชร์หน้าจอ
- [ ] เตรียมน้ำดื่ม
- [ ] หายใจลึกๆ - คุณทำได้!

---

## 🎯 เกณฑ์ความสำเร็จ

**ระหว่างการนำเสนอ:**
- ✅ ผู้ฟังมีส่วนร่วม (ถามคำถาม พยักหน้า)
- ✅ demo ทำงานสำเร็จ
- ✅ คุมเวลาให้อยู่ใน 60 นาที

**หลังการนำเสนอ:**
- ✅ ผู้เข้าฟังถามวิธีเริ่มใช้งาน
- ✅ ได้รับคำชมเรื่องความชัดเจน
- ✅ นักพัฒนาอยากทดลองใช้งานทันที

---

## 📖 แหล่งข้อมูลเพิ่มเติม

### สำหรับผู้นำเสนอ:
- `presenter-notes.md` - โน้ตสำหรับแต่ละสไลด์
- `demos/demo-script.md` - สคริปต์ demo รายละเอียด
- `audience-analysis.md` - เข้าใจผู้ฟังของคุณ

### สำหรับผู้เข้าฟัง:
- `quick-start.md` - คู่มือเริ่มต้น
- `shortcode-reference.md` - ตารางคำสั่ง
- `best-practices.md` - เคล็ดลับและเทคนิค
- เอกสาร use case ทั้งหมด

---

## 💡 เคล็ดลับแห่งความสำเร็จ

**ก่อนนำเสนอ:**
- ฝึก demo จนทำได้โดยไม่ต้องมองสคริปต์
- เตรียมแผนสำรองหาก demo ล้มเหลว
- ไปถึงสถานที่ก่อนเวลาเพื่อตรวจอุปกรณ์

**ระหว่างนำเสนอ:**
- พูดให้ถึงผู้ฟังแถวหลัง
- เว้นจังหวะหลังประเด็นสำคัญ
- ใช้เวลาระหว่าง demo อย่างมีประโยชน์
- แสดงความกระตือรือร้นจริงใจ

**หลังนำเสนอ:**
- แชร์สไลด์และวัสดุทั้งหมด
- ตอบคำถามค้างคา
- เก็บฟีดแบ็กเพื่อปรับปรุง

---

## 🐛 แก้ปัญหาเฉพาะหน้า

**Slides แปลงไม่สำเร็จ:**
- ใช้ markdown viewer โดยตรง
- ส่งออกเป็น PDF จาก IDE
- ใช้เครื่องมือออนไลน์สำหรับ markdown-to-slides

**demo ล้มเหลว:**
- สลับไปใช้สกรีนช็อตสำรองทันที
- รักษาความสงบและความมั่นใจ
- ใช้ประโยค "นี่คือสิ่งที่คุณจะเห็น..."

**เวลาใกล้หมด:**
- ข้าม slides 21-22 (การปรับแต่ง)
- ลดช่วงถามตอบเหลือ 5 นาที
- ข้าม demo ที่เป็นตัวเลือก

**เวลายังเหลือมาก:**
- ขยาย demo
- เปิดโอกาสให้ถามคำถามเพิ่ม
- แสดงตัวอย่างเพิ่มเติม

---

## 📞 การสนับสนุน

**มีคำถามเกี่ยวกับวัสดุนำเสนอ:**
- ตรวจไฟล์ `.md` ที่เกี่ยวข้องก่อน
- ทบทวน `presenter-notes.md` เพื่อดูคำแนะนำ
- ฝึก demo เพื่อเพิ่มความมั่นใจ

**คำถามเชิงเทคนิคเกี่ยวกับ mahiro-lab:**
- ดูเอกสารหลักของโครงการ
- โฟลเดอร์ `.mahirolab/docs/`
- GitHub repository

---

## 📄 ใบอนุญาตและการให้เครดิต

**การให้เครดิต:**
เมื่อนำเสนอ โปรดกล่าวถึง:
- โครงการ mahiro-lab
- สร้างขึ้นบน Claude Code
- ลิงก์ไปยัง GitHub repository

**การปรับแต่ง:**
คุณสามารถ:
- ปรับสไลด์ให้ตรงกับผู้ฟังของคุณ
- ใส่แบรนดิ้งของบริษัท
- แก้ไขตัวอย่าง
- แปลเป็นภาษาอื่น

---

## 🎉 พร้อมนำเสนอ!

คุณมีทุกอย่างครบ:
- ✅ ชุดสไลด์เต็ม (28 สไลด์)
- ✅ สคริปต์ demo รายละเอียด
- ✅ เอกสาร use case
- ✅ โน้ตผู้นำเสนอพร้อมเวลา
- ✅ เอกสารแจก
- ✅ แผนสำรอง

**ถึงเวลาสร้างแรงบันดาลใจให้ผู้ฟังเห็นคุณค่าของ AI-assisted development!** 🚀

---

**มีคำถามไหม?** ทบทวน `presenter-notes.md` สำหรับคำแนะนำเพิ่มเติม

**ขอให้โชคดี!** คุณจะทำได้ยอดเยี่ยมแน่นอน! 💪
