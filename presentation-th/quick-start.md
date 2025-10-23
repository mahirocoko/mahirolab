# คู่มือเริ่มต้นใช้งานด่วน

**เริ่มต้นใช้ mahiro-lab ภายใน 5 นาที**

---

## ข้อกำหนดเบื้องต้น

✅ ติดตั้ง **Claude Code** แล้ว  
✅ มี **Git** repository  
✅ เข้าถึง **Terminal** ได้  
✅ ใช้งาน **Bash** shell ได้

---

## การติดตั้ง (2 นาที)

### ขั้นตอนที่ 1: Clone Repository
```bash
git clone https://github.com/your-username/mahiro-lab.git
cd mahiro-lab
```

### ขั้นตอนที่ 2: ทำให้สคริปต์รันได้
```bash
chmod +x .mahirolab/bin/*.sh
```

### ขั้นตอนที่ 3: ตรวจสอบการติดตั้ง
```bash
ls -la .mahirolab/bin/
```

ควรเห็นไฟล์เหล่านี้:
- `codex-exec.sh`
- `codex-research.sh`
- `codex-worker-launcher.sh`
- `codex-status.sh`
- `codex-cleanup.sh`

---

## คำสั่งแรกของคุณ (1 นาที)

### ลองงานง่าย ๆ:
```bash
./mahirolab/bin/codex-exec.sh low "List all files in src/ directory"
```

**ผลลัพธ์ที่คาดหวัง:**
```
🔍 Analyzing directory structure...
✅ Found 23 files in src/

src/
├── components/
│   ├── Header.tsx
│   ├── Footer.tsx
│   └── ...
├── utils/
│   └── api.ts
└── index.ts
```

**ยินดีด้วย!** คุณเพิ่งรันคำสั่งแรกของ mahiro-lab 🎉

---

## คำสั่งหลัก (2 นาที)

### 1. งานแบบ Synchronous ที่ทำเสร็จเร็ว
**รูปแบบ:** `./codex-exec.sh [reasoning] "task"`

```bash
# ค้นหา TODO ทั้งหมด
./codex-exec.sh low "Find all TODO comments in codebase"

# แก้ปัญหา linting warnings
./codex-exec.sh low "Fix ESLint warnings in src/components/"

# นับจำนวนบรรทัดโค้ด
./codex-exec.sh minimal "Count total lines of code"
```

**ใช้เมื่อ:** งานไม่เกิน 2 นาที ต้องการผลลัพธ์ทันที

---

### 2. งานวิจัย
**รูปแบบ:** `./codex-research.sh "topic"`

```bash
# ศึกษาเทคโนโลยี
./codex-research.sh "React Server Components best practices"

# เปรียบเทียบตัวเลือก
./codex-research.sh "Zustand vs Redux Toolkit comparison"

# ตรวจสอบประเด็นความปลอดภัย
./codex-research.sh "CVE-2024-XXXXX mitigation strategies"
```

**ที่เก็บผลลัพธ์:** `.mahirolab/research/YYYYMMDD_HHMMSS_*.md`

**ใช้เมื่อ:** ต้องการค้นเว็บ รายงานที่มีโครงสร้าง พร้อมแหล่งอ้างอิง

---

### 3. Background Workers
**รูปแบบ:** `./codex-worker-launcher.sh [reasoning] "task"`

```bash
# รีแฟกเตอร์ขนาดใหญ่
./codex-worker-launcher.sh high "Refactor all components to use new API"

# สร้างเทส
./codex-worker-launcher.sh medium "Create unit tests for utils/"

# สร้างเอกสาร
./codex-worker-launcher.sh medium "Generate API documentation"
```

**ที่เก็บผลลัพธ์:** `.mahirolab/workers/YYYYMMDD_HHMMSS_*.md`

**ใช้เมื่อ:** งานเกิน 5 นาที และสามารถทำงานอื่นต่อไปได้ระหว่างรอ

---

## ระดับ Reasoning

| ระดับ | ระยะเวลา | ใช้สำหรับ |
|-------|----------|-----------|
| `minimal` | 5-10 วินาที | รายการไฟล์ คำถามง่าย ๆ |
| `low` | 10-15 วินาที | **การแก้ไขรวดเร็ว** (ค่าเริ่มต้น) |
| `medium` | 15-25 วินาที | งานวิจัย งานระดับกลาง |
| `high` | 30-60+ วินาที | รีแฟกเตอร์ขนาดใหญ่ การวิเคราะห์เชิงลึก |

**💡 เคล็ดลับ:** เริ่มที่ `low` หากผลลัพธ์ไม่พอค่อยเพิ่มระดับ

---

## โปรโตคอล Shortcode

### ใช้กับ Claude Code UI:

**สร้างบริบท:**
```
User: ccc
```
สร้างบริบทของเซสชันพร้อมเป้าหมายและสถานะ

**สร้างแผน:**
```
User: nnn
```
สร้างแผนการดำเนินงานจากบริบท

**เริ่มทำตามแผน:**
```
User: gogogo
```
รันแผนพร้อมติดตามความคืบหน้าแบบเรียลไทม์

**ตรวจสอบสถานะ:**
```
User: lll
```
แสดงแดชบอร์ดสถานะของโปรเจ็กต์

**สร้างบทสรุป:**
```
User: rrr
```
สร้าง retrospective ของเซสชัน

---

## การติดตามงาน

### ตรวจสอบสถานะ:
```bash
./codex-status.sh --all
```

**ผลลัพธ์:**
```
Running Jobs: 2
├─ research_20251022_141234 (5 min ago)
└─ worker_20251022_143000 (2 min ago)

Completed: 7 jobs (last 24h)
Storage: 45 MB
```

### ดูงานที่ต้องการ:
```bash
cat .mahirolab/workers/20251022_143000_*.md
```

---

## ตัวอย่าง Workflow

### Workflow 1: แก้โค้ดด่วน
```bash
# 1. หาต้นตอปัญหา
./codex-exec.sh low "Find all console.log statements"

# 2. ลงมือแก้
./codex-exec.sh low "Remove all console.log statements from src/"

# 3. ตรวจสอบ
git diff
```

**ใช้เวลา:** 1-2 นาที

---

### Workflow 2: วิจัยและนำไปใช้
```bash
# 1. ค้นคว้า (ถ้าใช้ Claude UI จะรันเบื้องหลัง)
./codex-research.sh "Best practices for React error boundaries"

# 2. อ่านรายงาน
cat .mahirolab/research/*error_boundaries*.md

# 3. นำไปปรับใช้จากสิ่งที่ได้
./codex-exec.sh medium "Add error boundary to App component"
```

**ใช้เวลา:** 10-15 นาที

---

### Workflow 3: รีแฟกเตอร์ขนาดใหญ่
```bash
# 1. เรียก background worker
./codex-worker-launcher.sh high "Migrate from class components to hooks"

# 2. ทำงานอื่นต่อ...

# 3. ตรวจความคืบหน้าเป็นระยะ
./codex-status.sh

# 4. ตรวจงานเมื่อเสร็จ
cat .mahirolab/workers/*migrate*.md
git diff
```

**ใช้เวลา:** 30-45 นาที (อัตโนมัติเป็นหลัก)

---

## เช็กลิสต์ความปลอดภัย

ก่อนรันคำสั่งทุกครั้ง:

✅ **ทำงานในสภาพแวดล้อมสำหรับพัฒนา** (ไม่ใช่ production)  
✅ **สำรองงานที่ยังไม่ commit** (git stash/commit)  
✅ **ตั้งใจตรวจสอบ diff ก่อน commit** (ตรวจผลลัพธ์เสมอ)  
✅ **เข้าใจงานที่จะทำ** (อย่ารันสุ่ม)

⚠️ **จำไว้ว่า:** สคริปต์ใช้ `danger-full-access` ควรใช้งานเฉพาะในสภาพแวดล้อมที่แยกออกมา

---

## ปัญหาที่พบบ่อยและวิธีแก้

### ปัญหา: Permission Denied
```bash
# วิธีแก้: ทำให้สคริปต์รันได้
chmod +x .mahirolab/bin/*.sh
```

### ปัญหา: Command Not Found
```bash
# วิธีแก้: ใช้ path เต็มหรือเพิ่มลง PATH
./mahirolab/bin/codex-exec.sh low "task"

# หรือเพิ่มลง PATH:
export PATH="$PATH:$(pwd)/.mahirolab/bin"
```

### ปัญหา: หาไฟล์ผลลัพธ์งานไม่เจอ
```bash
# วิธีแก้: ตรวจไฟล์ TEMP (กำลังเขียนอยู่)
ls .mahirolab/workers/*TEMP*

# รอสักครู่แล้วลองอีกครั้ง
ls .mahirolab/workers/
```

### ปัญหา: Web Search ใช้งานไม่ได้
```bash
# วิธีแก้: ตรวจการเชื่อมต่ออินเทอร์เน็ต
# สคริปต์วิจัยต้องใช้ network access
ping anthropic.com
```

---

## ขั้นตอนถัดไป

**เมื่อพร้อมใช้งานแล้ว:**

1. **📖 อ่านเอกสารเต็ม:** [`.mahirolab/docs/`]
2. **🎯 ลองตัวอย่าง:** [`.mahirolab/examples/`]
3. **🔧 ปรับแต่ง:** สร้างเทมเพลตของคุณเอง
4. **📊 ติดตามความคืบหน้า:** ใช้ shortcode workflow (ccc/nnn/gogogo)
5. **🤝 แชร์:** แบ่งปัน use case และ workflow ที่พบ

---

## ขอความช่วยเหลือ

- **Documentation:** `.mahirolab/docs/`
- **Examples:** `.mahirolab/examples/`
- **Issues:** GitHub Issues
- **Discussions:** GitHub Discussions

---

**พร้อมลุยแล้ว! 🚀**

เริ่มจากงานง่าย ๆ แล้วค่อยสำรวจฟีเจอร์ขั้นสูง ยิ่งใช้บ่อย คุณจะยิ่งทำงานได้ไวขึ้น

