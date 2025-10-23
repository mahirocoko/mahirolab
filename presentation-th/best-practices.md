# แนวปฏิบัติและทิปส์ที่ดีที่สุด

**เพิ่มประสิทธิภาพและความปลอดภัยเมื่อใช้ mahiro-lab**

---

## ความปลอดภัยมาก่อน

### ✅ การตั้งค่าสภาพแวดล้อม
- **ใช้สภาพแวดล้อมพัฒนาที่แยกตัวทุกครั้ง**
- ห้ามรันบนระบบ production
- ใช้ VM หรือ Docker containers เมื่อเป็นไปได้
- เก็บข้อมูลอ่อนไหวไว้นอกขอบเขตงาน

### ✅ ก่อนรันทุกคำสั่ง
- [ ] ตรวจว่าคุณอยู่ในไดเรกทอรีที่ถูกต้อง
- [ ] ทบทวนให้แน่ใจว่าเข้าใจผลของคำสั่งนั้น
- [ ] มีสำเนา git สำรองไว้แล้ว (commit หรือ stash)
- [ ] ตรวจสอบว่าไม่มีความลับอยู่ในขอบเขตงาน

### ✅ หลังรันทุกคำสั่ง
- [ ] ตรวจ diff ด้วย `git diff`
- [ ] ตรวจรหัสสถานะ (exit code)
- [ ] รันชุดทดสอบ
- [ ] commit พร้อมข้อความอธิบาย

---

## การเลือกระดับเหตุผล (Reasoning Levels)

### ผังการตัดสินใจ

**งานเล็กน้อย? (เช่น list files, count lines)**
→ ใช้ `minimal` (5-10 วินาที)

**งานง่าย? (แก้ warning, ปรับโค้ดเบื้องต้น)**
→ ใช้ `low` (10-15 วินาที)

**งานปานกลาง? (ค้นคว้า, refactor ระดับกลาง)**
→ ใช้ `medium` (15-25 วินาที)

**งานซับซ้อน? (refactor ขนาดใหญ่, วิเคราะห์เชิงลึก)**
→ ใช้ `high` (30-60 วินาทีขึ้นไป)

### ความคุ้มค่าระหว่างต้นทุนกับคุณภาพ

| Level | ความเร็ว | คุณภาพ | ต้นทุน | ใช้ดีที่สุดกับ |
|-------|----------|--------|--------|----------------|
| minimal | ⚡⚡⚡ | ⭐⭐ | $ | คำถามง่าย |
| low | ⚡⚡ | ⭐⭐⭐ | $$ | งานส่วนใหญ่ |
| medium | ⚡ | ⭐⭐⭐⭐ | $$$ | งานค้นคว้า, refactor |
| high | 🐌 | ⭐⭐⭐⭐⭐ | $$$$ | งานสำคัญวิกฤต |

**💡 ทิป:** เริ่มด้วย `low` แล้วค่อยยกระดับหากผลไม่พอใจ

---

## รูปแบบเวิร์กโฟลว์

### รูปแบบที่ 1: แก้ไขด่วน
```bash
./codex-exec.sh low "task"
# ตรวจผลลัพธ์ทันที
git diff && git commit
```
**ใช้เวลา:** ไม่เกิน 2 นาที

### รูปแบบที่ 2: ขับเคลื่อนด้วยการค้นคว้า
```bash
./codex-research.sh "topic"
# อ่านรายงาน
cat .mahirolab/research/*.md
# ลงมือทำตามสิ่งที่ค้นพบ
./codex-exec.sh medium "implement X"
```
**ใช้เวลา:** 10-20 นาที

### รูปแบบที่ 3: งานเบื้องหลัง
```bash
./codex-worker-launcher.sh high "large task"
# ทำงานอื่นต่อ
# แวะตรวจเป็นระยะ
./codex-status.sh
# ตรวจผลเมื่อเสร็จ
```
**ใช้เวลา:** 30-60 นาที

### รูปแบบที่ 4: ทำงานขนานกัน
```bash
./codex-worker-launcher.sh "task 1" &
./codex-worker-launcher.sh "task 2" &
./codex-worker-launcher.sh "task 3" &
wait
# ตรวจผลทุกงาน
```
**ใช้เวลา:** ตามงานที่นานที่สุด

---

## การจัดการสถานะงาน

### ความต่อเนื่องของเซสชัน

**เริ่มวัน:**
```
ccc  # สร้าง/รีเฟรช context
lll  # ตรวจสถานะ
```

**ระหว่างทำงาน:**
```
nnn     # สร้างแผน
gogogo  # เริ่มทำงาน
lll     # ตรวจความคืบหน้า
```

**จบวัน:**
```
rrr  # สร้าง retrospective
```

### การจัดการเวอร์ชันของ context

- ทุกครั้งที่รัน `ccc` จะสร้างเวอร์ชันใหม่
- เลือก "Continue" เพื่อรวมกับเซสชันก่อนหน้า
- เลือก "Fresh" หากต้องการเริ่มใหม่
- ทุกเวอร์ชันถูกเก็บไว้ใน `context_history/`

**💡 ทิป:** ใช้ "Continue" สำหรับงานต่อเนื่อง และ "Fresh" สำหรับหัวข้อใหม่

---

## การมอนิเตอร์และดีบัก

### ตรวจสถานะงาน
```bash
# งานทั้งหมด
./codex-status.sh --all

# เฉพาะ worker
./codex-status.sh --workers

# เฉพาะ research
./codex-status.sh --research

# สถิติรวม
./codex-status.sh --stats
```

### ดีบักงานที่ล้มเหลว

**ขั้นตอนที่ 1:** หาไฟล์ผลลัพธ์
```bash
ls -lt .mahirolab/workers/ | head
```

**ขั้นตอนที่ 2:** อ่านรายงาน
```bash
cat .mahirolab/workers/20251022_*.md
```

**ขั้นตอนที่ 3:** ตรวจ execution log
```bash
tail -50 .mahirolab/state/execution_log.md
```

**ขั้นตอนที่ 4:** ตรวจ exit code (ดูในรายงาน)

---

## งานบำรุงรักษา

### การทำความสะอาดเป็นประจำ

**รายสัปดาห์:**
```bash
# ทดลองแบบ dry-run ก่อน
./codex-cleanup.sh --dry-run

# ลบไฟล์อายุมากกว่า 7 วัน
./codex-cleanup.sh --age 7

# บีบอัดไฟล์เก่า
./codex-cleanup.sh --compress-only
```

### การจัดการพื้นที่จัดเก็บ

**ตรวจการใช้งาน:**
```bash
./codex-status.sh --stats
```

**เก็บเซสชันเก่าไว้ที่อื่น:**
```bash
# ย้ายด้วยตนเองไป archive
mv .mahirolab/state/context_history/old_* .mahirolab/state/archive/
```

---

## เคล็ดลับด้านประสิทธิภาพ

### ปรับแต่งเวลาทำงานให้เหมาะสม

**ควรทำ:**
- ✅ เลือก reasoning level ให้ตรงงาน
- ✅ ระบุคำสั่ง prompt ให้ชัดเจน
- ✅ แยกงานใหญ่เป็นงานย่อย
- ✅ ใช้ background workers สำหรับงานยาว

**ไม่ควรทำ:**
- ❌ ใช้ `high` กับงานง่าย
- ❌ ให้ prompt คลุมเครือ
- ❌ ยัดทุกอย่างในคำสั่งเดียว
- ❌ นั่งรองานยาวโดยไม่ทำอย่างอื่น

### การทำงานแบบกลุ่ม

**แทนที่จะทำแบบนี้:**
```bash
./codex-exec.sh low "fix file1"
./codex-exec.sh low "fix file2"
./codex-exec.sh low "fix file3"
```

**ให้ทำแบบนี้:**
```bash
./codex-exec.sh low "fix file1, file2, and file3"
```

---

## การทำงานร่วมกับทีม

### แชร์เทมเพลต

สร้างเทมเพลตร่วมกันของทีม:
```
.mahirolab/templates/
├── team-code-review.md
├── team-bug-report.md
└── team-feature-spec.md
```

### ทำแพทเทิร์นให้เป็นมาตรฐาน

บันทึกเวิร์กโฟลว์ที่ใช้บ่อย:
```
docs/team-patterns/
├── onboarding-tasks.md
├── release-checklist.md
└── incident-response.md
```

### เชื่อมกับกระบวนการ Code Review

```bash
# ตรวจ PR ก่อนอนุมัติ
./codex-exec.sh medium "Review PR #123 for code quality and security"

# รวมคอมเมนต์รีวิว
cat .mahirolab/output/*.md >> pr-review.md
```

---

## กับดักที่พบบ่อย

### ❌ กับดักที่ 1: ไม่ตรวจ diff

**ปัญหา:** commit โค้ดที่ AI สร้างโดยไม่ตรวจสอบ

**ทางแก้:**
```bash
# ตรวจทุกครั้งก่อน
git diff
# ถ้าดูโอเคค่อย commit
git add . && git commit -m "message"
```

### ❌ กับดักที่ 2: เลือกระดับ reasoning ผิด

**ปัญหา:** ใช้ `high` ตลอด (ทั้งช้าและแพง)

**ทางแก้:** เริ่มจาก `low` แล้วค่อยเพิ่มเมื่อจำเป็น

### ❌ กับดักที่ 3: ตั้ง prompt กว้างเกินไป

**แบบไม่ดี:** "fix the code"
**แบบดี:** "fix ESLint warnings in src/components/"

### ❌ กับดักที่ 4: ไม่สนใจ exit code

**ปัญหา:** คิดว่างานสำเร็จโดยไม่ตรวจสอบ

**ทางแก้:** ตรวจรายงานว่า exit code เป็นอย่างไร และดู error

### ❌ กับดักที่ 5: ไม่มีสำเนาสำรอง

**ปัญหา:** AI เปลี่ยนโค้ดไม่ตรงใจแต่ย้อนกลับไม่ได้

**ทางแก้:** commit หรือ stash ก่อนทุกครั้งที่สั่งงาน

---

## เทคนิคขั้นสูง

### สคริปต์ wrapper แบบกำหนดเอง

สร้าง helper เฉพาะโปรเจกต์:
```bash
#!/bin/bash
# scripts/quick-review.sh
./mahirolab/bin/codex-exec.sh medium "Review latest commit for issues"
```

### ปรับแต่งเทมเพลต

แก้ไขเทมเพลตให้เข้ากับมาตรฐานทีม:
```bash
# ปรับเทมเพลตสำหรับ research
vim .mahirolab/templates/research-report.md
```

### เชื่อมกับ CI/CD

```yaml
# .github/workflows/ai-analysis.yml
- name: AI Code Analysis
  run: |
    ./mahirolab/bin/codex-exec.sh medium "Analyze PR for quality issues"
```

---

## Pro Tips

**💡 ทิป 1:** ตั้งชื่องานให้สื่อความหมาย
- ตัวอย่างที่ดี: "Refactor Button components to use design tokens"
- ตัวอย่างที่ไม่ดี: "fix buttons"

**💡 ทิป 2:** ตรวจสถานะระหว่างทำหลายงานพร้อมกัน
```bash
watch -n 30 './codex-status.sh --workers'
```

**💡 ทิป 3:** สร้าง alias สำหรับคำสั่งที่ใช้บ่อย
```bash
alias cexec='.mahirolab/bin/codex-exec.sh'
alias cresearch='.mahirolab/bin/codex-research.sh'
alias cworker='.mahirolab/bin/codex-worker-launcher.sh'
```

**💡 ทิป 4:** เก็บ execution log เพื่อทำ retrospective
```bash
# ทบทวนสิ่งที่ทำได้ดี
grep "✅" .mahirolab/state/execution_log.md
```

**💡 ทิป 5:** ใช้โหมด dry-run เมื่อกำลังเรียนรู้
```bash
./codex-exec.sh --dry-run low "task"
```

---

## คู่มือแก้ปัญหา

| ปัญหา | ทางแก้ |
|-------|--------|
| Command not found | ใช้ full path หรือ `chmod +x` |
| Permission denied | ตรวจสิทธิ์ของสคริปต์ |
| หา output ไม่เจอ | ตรวจไฟล์ TEMP (อาจยังเขียนไม่เสร็จ) |
| ทำงานช้า | ลด reasoning level |
| คุณภาพไม่ดี | เพิ่ม reasoning level |
| ปัญหาเครือข่าย | ตรวจอินเทอร์เน็ตสำหรับงาน research |
| Git conflict | ตรวจ diff ก่อน commit |

---

**จำไว้เสมอ:** mahiro-lab คือเครื่องมือทรงพลัง ใช้อย่างมีสติ ตรวจผลลัพธ์ทุกครั้ง และรักษาวินัยการพัฒนาให้ดีอยู่เสมอ!
