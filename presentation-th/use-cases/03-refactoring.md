# กรณีใช้งาน #3: Large-Scale Refactoring

**หมวดหมู่:** Architecture & Design  
**ความซับซ้อน:** ⭐⭐⭐ สูง  
**ประหยัดเวลา:** 4 ชั่วโมง → 30 นาที (ลดลง 87%)  
**กลุ่มเป้าหมาย:** 🔧 นักพัฒนา

---

## สถานการณ์

ทีมดีไซน์เพิ่งปล่อย design system ใหม่ออกมา คุณต้อง refactor คอมโพเนนต์ Button จำนวน 45 ตัวทั่วทั้งโค้ดเบส React ให้ใช้ API ของ design system ใหม่

**Old API:**
```jsx
<Button variant="primary" size="large" onClick={handleClick}>
  Submit
</Button>
```

**New API:**
```jsx
<Button intent="primary" scale="lg" onPress={handleClick}>
  Submit
</Button>
```

การเปลี่ยนแปลงที่ต้องทำ:
- `variant` → `intent`
- `size` → `scale` (แม็ปค่า: large→lg, medium→md, small→sm)
- `onClick` → `onPress`
- เปลี่ยน import path
- อัปเดต TypeScript types ที่เกี่ยวข้อง

---

## วิธีเดิม: ทำเองทั้งหมด

### ขั้นตอน:

1. **ค้นหา Button ทั้งหมด**
   ```bash
   grep -r "<Button" src/
   ```
   ผลลัพธ์: พบไฟล์ที่มี Button 45 ไฟล์

2. **วางแผน refactoring**
   - รวบรวมรายชื่อไฟล์ที่จะต้องแก้
   - บันทึก prop ที่ต้องเปลี่ยน
   - จด edge case (prop แบบมีเงื่อนไข, spread operators)
   - วางแผนวิธีทดสอบ

3. **refactor ด้วยมือ** (ทำทีละไฟล์)
   - เปิดไฟล์ที่ 1
   - หา Button
   - แก้ props อย่างระมัดระวัง:
     - เปลี่ยน `variant` เป็น `intent`
     - แม็ปค่า size (large→lg ฯลฯ)
     - เปลี่ยน `onClick` เป็น `onPress`
   - อัปเดต import หากจำเป็น
   - เช็ก error ของ TypeScript
   - ทำซ้ำกับ Button ถัดไปในไฟล์
   - เซฟแล้วไปไฟล์ถัดไป

4. **จัดการ edge case**
   - Button ที่ใช้ spread props
   - variant แบบมีเงื่อนไข
   - โครงสร้าง Button แบบ custom
   - ไฟล์เทสต์ที่ mock Button

5. **การทดสอบ**
   - รันคอมไพเลอร์ TypeScript
   - แก้ type error
   - รันเทสต์
   - เช็ก UI ด้วยสายตา
   - แก้ regression

6. **เตรียม code review**
   - ทบทวนการแก้ไข
   - ตรวจความสอดคล้อง
   - เขียนคำอธิบาย PR

### ใช้เวลาประมาณ:
- ค้นหา & วางแผน: 30 นาที
- refactoring ด้วยมือ: 2.5 ชั่วโมง (ไฟล์ละ 3-4 นาที × 45 ไฟล์)
- Edge case: 30 นาที
- ทดสอบ & แก้: 45 นาที
- ทบทวน & เคลียร์งาน: 15 นาที
- **รวม: 4-5 ชั่วโมง**

### จุดเจ็บปวด:
- ❌ น่าเบื่อและมีโอกาสพลาดสูง
- ❌ ใช้สมาธิมากเพื่อรักษาความสอดคล้อง
- ❌ พลาดบาง instance ได้ง่าย
- ❌ เสี่ยงทำให้เกิดบั๊ก
- ❌ สมองล้าเพราะต้องสลับบริบทตลอด
- ❌ ยากจะโฟกัสต่อเนื่องหลายชั่วโมง

---

## ใช้ mahiro-lab: Automated Refactoring

### คำสั่ง:
```bash
./codex-worker-launcher.sh high "Refactor all Button components to use new design system API: variant→intent, size→scale (large→lg, medium→md, small→sm), onClick→onPress. Update imports and types."
```

### เกิดอะไรขึ้นบ้าง:

1. **เปิด background worker**
   - รันด้วยระดับเหตุผล `high` (วิเคราะห์ลึก)
   - ไม่บล็อกเทอร์มินัลของคุณ
   - มีการอัปเดตความคืบหน้าตามเวลาจริง

2. **ช่วง AI วิเคราะห์** (2-3 นาที)
   - สแกนโค้ดเบสหา Button ทั้งหมด
   - เข้าใจแพตเทิร์นของ API ปัจจุบัน
   - หา edge case ให้อัตโนมัติ
   - วางแผนวิธี refactoring

3. **ช่วงลงมือ** (15-20 นาที)
   - ลงการเปลี่ยนแปลงอย่างเป็นระบบ
   - จัดการ edge case อย่างชาญฉลาด
   - อัปเดต TypeScript types
   - รักษาความสอดคล้องทั้งหมด

4. **ช่วงตรวจสอบ** (5 นาที)
   - รัน type check
   - ยืนยันความถูกต้อง
   - สร้างสรุปรายงาน

### ตัวอย่างผลลัพธ์:
```
🚀 Starting worker job...
   Job ID: bash_12346
   Reasoning: high
   Task: Refactor Button components
   Output: .mahirolab/workers/20251022_143000_TEMP_codex_task.md

✅ Job running in background
   Use "check worker status" to monitor progress
```

### ติดตามความคืบหน้า:
```bash
# ระหว่างทำงานอื่น แวะเช็กเป็นระยะ:
$ Check worker status

🔄 Worker in progress...
   Started: 8 minutes ago
   Status: Applying changes to components/forms/
   Processed: 32/45 files
   Progress: [██████████████░░░░░░] 71%
   ETA: 4 minutes remaining
```

### รายงานสุดท้าย:
```markdown
# Worker Task Report

**Task:** Button component refactoring
**Started:** 2025-10-22 14:30:00
**Completed:** 2025-10-22 14:52:15
**Duration:** 22 minutes

---

## Summary

✅ Successfully refactored 45 Button components across codebase
✅ Updated all prop mappings (variant→intent, size→scale, onClick→onPress)
✅ Migrated size values (large→lg, medium→md, small→sm)
✅ Updated TypeScript types and imports
✅ All type checks passing

---

## Changes Applied

### Files Modified: 45

**Components:**
- src/components/forms/LoginForm.tsx (3 buttons)
- src/components/forms/SignupForm.tsx (2 buttons)
- src/components/modals/ConfirmDialog.tsx (2 buttons)
... (42 more files)

**Total Button instances updated:** 78

---

## Prop Changes

| Old Prop | New Prop | Instances |
|----------|----------|-----------|
| variant  | intent   | 78 |
| size     | scale    | 65 |
| onClick  | onPress  | 78 |

### Size Value Mappings:
- large → lg (23 instances)
- medium → md (31 instances)
- small → sm (11 instances)

---

## Edge Cases Handled

1. **Spread props:** Preserved in 8 instances
   ```jsx
   <Button {...commonProps} intent="primary" />
   ```

2. **Conditional variants:** Updated in 6 instances
   ```jsx
   <Button intent={isPrimary ? "primary" : "secondary"} />
   ```

3. **Custom compositions:** Refactored 3 instances
   ```jsx
   const SubmitButton = (props) => (
     <Button intent="primary" scale="lg" {...props} />
   )
   ```

---

## TypeScript Updates

- Updated `ButtonProps` interface
- Fixed 12 type errors in test files
- Updated type imports in 8 files

---

## Verification

✅ TypeScript compilation: PASSED  
✅ ESLint: PASSED  
✅ Consistent prop usage: VERIFIED  
✅ No breaking changes to public API: VERIFIED

---

## Git Status

Modified files: 45  
Lines changed: +234 -234 (net: 0)  
Ready for review and commit

---

## Recommendations

1. ✅ Review diff with `git diff src/components/`
2. ✅ Run full test suite
3. ✅ Visual QA in Storybook/dev environment
4. ✅ Create PR with changes
5. Consider updating Button documentation

---

**Success:** Refactoring complete and verified ✅
```

### ใช้เวลาประมาณ:
- รันคำสั่ง: 10 วินาที
- ประมวลผลเบื้องหลัง: 22 นาที
- ทบทวนรายงาน & diff: 5-8 นาที
- **รวม: 27-30 นาที**
- **แถม: ระหว่าง 22 นาทีไปทำงานอื่นได้**

### จุดเด่น:
- ✅ ครอบคลุมและสอดคล้องทุกไฟล์
- ✅ จัดการ edge case ให้อัตโนมัติ
- ✅ ทำงานเบื้องหลัง ไม่บล็อกเวลา
- ✅ มีรายงานสรุปรายละเอียด
- ✅ Refactoring ที่ปลอดภัยต่อ type
- ✅ ลดโอกาสผิดพลาดอย่างมาก

---

## เปรียบเทียบตัวเลข

| Metric | Manual | With mahiro-lab | Improvement |
|--------|--------|-----------------|-------------|
| **Active time** | 4-5 hrs | 30 min | **87% faster** |
| **Your attention** | ต่อเนื่อง | เช็กเป็นช่วงๆ | **คืนเวลา 90%** |
| **Files modified** | 45 | 45 | ครบเท่ากัน |
| **Consistency** | ผันแปร | 100% | **ไร้ที่ติ** |
| **Edge cases missed** | น่าจะพลาด 2-3 | 0 | **เชื่อถือได้กว่า** |
| **Stress level** | สูง | ต่ำ | **ทำงานสบายกว่า** |

---

## ผลลัพธ์ในโลกจริง

### นักพัฒนาระดับบุคคล:
- **refactor ขนาดใหญ่ต่อไตรมาส:** 2-3 ครั้ง
- **เวลาที่ประหยัดต่อครั้ง:** 3.5 ชั่วโมง
- **ประหยัดต่อไตรมาส:** 10-11 ชั่วโมง
- **ประหยัดต่อปี:** 40-45 ชั่วโมง
- **ประโยชน์:** กล้าลงมือทำ refactoring ที่ใหญ่ขึ้น

### ทีมวิศวกรรม (10 คน):
- **เวลารวมที่ประหยัดต่อปี:** 400-450 ชั่วโมง
- **คุณภาพโค้ดดีขึ้น:** ทำ refactoring ได้ถี่ขึ้น
- **ลด technical debt:** ขยับปรับปรุงได้เร็ว
- **กำลังใจทีมดีขึ้น:** งานน่าเบื่อน้อยลง

### คุณค่าทางธุรกิจ:
- **นำ design system ใหม่มาใช้ได้เร็วขึ้น**
- **ลดความเสี่ยงของ refactoring**
- **ยกระดับคุณภาพโค้ดได้บ่อยขึ้น**
- **นักพัฒนามีเวลาทำเรื่อง architecture มากขึ้น ไม่ติดงานจุกจิก**

---

## ทางเลือกอื่น

### ตัวอย่าง Refactoring เพิ่มเติม:

**1. API migration:**
```bash
./codex-worker-launcher.sh high "Migrate from Axios to fetch API across all API client files"
```

**2. ปรับระบบ state management:**
```bash
./codex-worker-launcher.sh high "Convert all Redux containers to use Redux Toolkit createSlice"
```

**3. อัปเดต import path:**
```bash
./codex-worker-launcher.sh medium "Update all relative imports to use TypeScript path aliases (@/components)"
```

**4. Rename ทั้งโค้ดเบส:**
```bash
./codex-worker-launcher.sh medium "Rename all instances of 'getUserData' to 'fetchUserProfile' including tests and types"
```

**5. ลบของ deprecated:**
```bash
./codex-worker-launcher.sh high "Remove all usage of deprecated componentWillMount lifecycle, replace with useEffect"
```

---

## สคริปต์เดโม

**สำหรับการพรีเซนต์ (4-5 นาที):**

1. **ปูภาพรวม** (45 วินาที)
   - "Design system ใหม่: ต้องแก้ 45 ไฟล์"
   - "ปกติใช้เวลา 4-5 ชั่วโมงที่น่าเบื่อ"
   - "เสี่ยงหลุดความสอดคล้องและผิดพลาดสูง"

2. **โชว์ขอบเขตงาน** (30 วินาที)
   - รัน `grep -r "<Button"` ให้เห็นจำนวนไฟล์
   - "นี่คือปริมาณงานที่ต้องทำ"

3. **สั่งงาน worker** (15 วินาที)
   ```bash
   ./codex-worker-launcher.sh high "Refactor Button components..."
   ```

4. **อธิบายการทำงานเบื้องหลัง** (60 วินาที)
   - "รันพื้นหลังด้วย reasoning สูง"
   - "เช็กสถานะได้ตลอด"
   - "ระหว่างนี้ไปทำงานอื่นได้"

5. **เช็กสถานะ** (30 วินาที)
   ```bash
   Check worker status
   ```
   - โชว์ progress bar
   - โชว์ ETA

6. **เปิดรายงานสุดท้าย** (90 วินาที)
   - เปิดรายงานที่สร้างให้
   - ชี้ให้เห็น: 45 ไฟล์ 78 instance, edge case ถูกจัดการ
   - โชว์ว่า verification ผ่าน
   - รัน `git diff` ให้เห็นตัวอย่างการแก้

7. **ตอกย้ำคุณค่า** (30 วินาที)
   - "4 ชั่วโมง → 30 นาที"
   - "ความสอดคล้องสมบูรณ์"
   - "มีเวลาทำอย่างอื่นระหว่างที่ worker รัน"
   - "นี่คือ game changer ของการ refactoring"

---

## Talking Points

**สำหรับนักพัฒนา:**
- "ทำ refactoring ใหญ่ๆ ไหวโดยไม่หมดแรง"
- "ความสอดคล้องทั้งโค้ดเบสเป๊ะ"
- "คุณโฟกัสที่กลยุทธ์ AI จัดการงานจุกจิก"
- "ไม่บล็อกเวลา เรียกเช็กสถานะเฉพาะตอนจำเป็น"

**สำหรับ Tech Leads:**
- "ลด technical debt ได้เร็ว"
- "การทำ design system migration กลายเป็นเรื่องปกติ"
- "ลดความเสี่ยง เพิ่มความสอดคล้อง"

**สำหรับผู้จัดการ:**
- "ประหยัดเวลาทำ refactoring 87%"
- "ยกระดับคุณภาพโค้ดได้บ่อยขึ้น"
- "refactoring ไม่ใช่ตัวถ่วงนวัตกรรมอีกต่อไป"

---

## ฟีเจอร์ขั้นสูงที่ได้โชว์

**Progress Tracking:**
- Progress bar แบบเรียลไทม์
- คำนวณ ETA
- ติดตามสถานะได้

**Background Execution:**
- ทำงานแบบไม่บล็อก
- ไปทำงานอื่นได้
- กลับมาเช็กเมื่อสะดวก

**High Reasoning:**
- วิเคราะห์โค้ดเชิงลึก
- จับ edge case ได้เอง
- Refactoring แบบเข้าใจ type

**Comprehensive Reporting:**
- มีสรุปการแก้ไขละเอียด
- แจ้งผลการตรวจสอบ
- ให้คำแนะนำถัดไป

---

**ลำดับความสำคัญของเดโม:** ⭐⭐⭐⭐⭐ สูงสุด - โชว์ศักยภาพของ background worker, ประหยัดเวลาแบบเห็นภาพ, มีความลึกเชิงเทคนิคครบ
