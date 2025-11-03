# Speaker Notes - Experience Sharing Presentation

**Presentation:** มนุษย์กับ AI: ความหวัง ความเจ็บปวด และบทเรียนจริง
**Duration:** 45-60 นาที
**Created:** 2025-11-03

---

## 📋 Pre-Presentation Checklist

- [ ] Test demos 2-3 times
- [ ] Prepare backup screenshots
- [ ] Terminal font size 16-18pt
- [ ] Check projector resolution
- [ ] Water bottle ready
- [ ] Timer/clock visible
- [ ] Slides loaded in Marp/reveal.js
- [ ] GitHub link ready to share

---

## 🎯 Overall Timing Guide

| Section | Duration | Cumulative |
|---------|----------|------------|
| Act 1: Honeymoon | 5 min | 5 min |
| Act 2: Reality Check | 15 min | 20 min |
| Act 3: Turning Point | 12 min | 32 min |
| Act 4: Solution | 8 min | 40 min |
| Act 5: Lessons | 8 min | 48 min |
| Act 6: Honest Talk | 4 min | 52 min |
| Act 7: Wrap-up | 5 min | 57 min |
| Demos (optional) | 10 min | - |
| Q&A Buffer | 10-15 min | - |

**Total:** ~50-60 นาที (พร้อม demos)

---

## Act 1: The Honeymoon Phase (5 นาที)

### Slide: Title Slide
**Timing:** 1 นาที

**Script:**
> "สวัสดีครับ วันนี้ผมจะมาแชร์ประสบการณ์จริงๆ ในการใช้ Claude Code และสร้าง Codex - ไม่ใช่แค่เรื่องสวยงาม แต่รวมถึงความเจ็บปวด บทเรียน และสิ่งที่เรียนรู้มาด้วย"

**Key Points:**
- แนะนำตัวเอง
- ตั้งความคาดหวังว่าจะเป็น experience sharing ไม่ใช่ technical deep dive
- Quote สำคัญ: "การใช้ AI ที่ดีไม่ใช่แค่ prompting ที่เก่ง แต่เป็นการบริหาร Context"

**Transition:** "เริ่มจากช่วงแรกที่เจอ Claude Code..."

---

### Slide: ช่วงแรก มหัศจรรย์มาก!
**Timing:** 2 นาที

**Script:**
> "ครั้งแรกที่ใช้ Claude Code รู้สึกเหมือนเจอ magic wand จริงๆ..."

**Talking Points:**
- เล่า "wow moments" แรกๆ (เขียนโค้ดให้, refactor ให้, แก้ bug ให้)
- เน้นความรู้สึก enthusiastic, hopeful
- "นี่คือ future of coding แล้ว!" (พูดด้วยอารมณ์ excited)

**Anecdote (optional):**
> "แก้ bug ที่ติดอยู่ 2 วัน... Claude ช่วยแก้ได้ใน 10 นาที!"

**Transition:** "แล้วก็เกิดไอเดีย... ถ้า AI เก่งขนาดนี้ เราต้อง scale มันขึ้น!"

---

### Slide: เกิดไอเดีย Codex
**Timing:** 2 นาที

**Script:**
> "วิสัยทัศน์คือให้ Claude Agents หลายตัวทำงานพร้อมกัน - research อัตโนมัติ, background workers, orchestration!"

**Talking Points:**
- อธิบายวิสัยทัศน์เบื้องต้น
- เน้น excitement, ambition
- "Excited มากกกก!" (พูดด้วยพลัง)

**Transition (with pause):**
> "แต่แล้ว... ความจริงมันก็มาหา" (เปลี่ยนโทนเสียง)

---

## Act 2: Reality Check (15 นาที) 🔥

### Slide: 5 Pain Points Overview
**Timing:** 1 นาที

**Script:**
> "เมื่อ honeymoon phase จบลง ผมเจอกับความเจ็บปวดจริงๆ - 5 pain points ที่ไม่มีใครบอก"

**Key Points:**
- ระบุ pain points ทั้ง 5 อย่างชัดเจน
- เน้นว่านี่คือ **ประสบการณ์จริง** ไม่ใช่เรื่องแต่ง
- เตรียมผู้ฟังว่าจะลงลึกแต่ละอัน

**Tone:** เปลี่ยนจาก excited → realistic/honest

---

### Slide: Pain #1 - Context Explosion
**Timing:** 2-3 นาที

**Script:**
> "ปัญหาแรก: Context Explosion - AI มี context window จำกัด แต่โปรเจกต์เราไม่จำกัด"

**Story:**
- เริ่มด้วยแก้ bug เล็กๆ
- จบที่อ่าน 47 ไฟล์
- Context เต็ม 200K tokens
- ยังไม่ได้แก้ bug! 😅

**Emphasis:**
> "เริ่มต้นด้วย 'เล็ก' แต่จบด้วย 'ใหญ่มาก'"

**Check audience:** "ใครเคยเจอแบบนี้บ้าง?" (pause for reaction)

---

### Slide: Pain #2 - Illusion of Control
**Timing:** 2-3 นาที

**Script:**
> "Pain ที่สอง: คิดว่าควบคุม AI ได้... แต่จริงๆ มันตีความแล้วทำเอง"

**Story:**
- ผม: "Fix the login bug"
- Claude: *ทำทุกอย่าง* (bug + refactor + tests + docs)
- Git diff 847 บรรทัด
- Review ไม่ไหว 😱

**Lesson:**
> "ยิ่งให้อิสระมาก ยิ่งควบคุมยาก"

**Humor:** "เหมือนบอกว่าซื้อนม... กลับมาได้ supermarket ทั้งร้าน"

---

### Slide: Pain #3 - Time Sink Paradox
**Timing:** 2-3 นาที

**Script:**
> "นี่คือ paradox ที่น่าสนใจ: AI ช่วยประหยัดเวลา... หรือเปล่า?"

**Show table:**
- AI เขียนโค้ด: 5 นาที
- Review: 30 นาที
- แก้ไข: 45 นาที
- Debug: 1 ชั่วโมง
- **รวม: 2+ ชั่วโมง**

**Reality check:**
> "ถ้าเขียนเอง = 1 ชั่วโมง... แล้วประหยัดตรงไหน?"

**Key insight:** เวลาไม่ได้หายไป แค่ย้ายไปอีกที่ (จาก coding → reviewing)

---

### Slide: Pain #4 - Context Switching Hell
**Timing:** 2-3 นาที

**Script:**
> "วงจรอุบาทว์ของการสลับ context ระหว่างสั่ง AI กับทำเองจนสมองแตก"

**Walk through cycle:**
1. สั่ง AI ทำ Task A
2. รอ 3-5 นาที
3. ไปทำ Task B
4. AI เสร็จ → กลับมา Task A
5. Context Task A หาย → อ่านใหม่
6. Review เสร็จ → Task B context หายแล้ว!

**Emphasis:**
> "Productivity ลง, Mental load เพิ่ม"

**Gesture:** แสดงท่าทางสับสนตามด้วย

---

### Slide: Pain #5 - Unpredictability
**Timing:** 2-3 นาที

**Script:**
> "Pain สุดท้าย: ทำเหมือนเดิม แต่ได้ผลต่างกัน... ทุกครั้ง"

**Example:**
- วันจันทร์: 47 test cases พร้อม mocks ✨
- วันอังคาร (prompt เดียวกัน): 3 test cases basic 🤔

**Humor:**
> "Reasoning effort? Model version? Phase of the moon? 🌙"

**Key point:** Stochastic nature ของ AI = ความไม่แน่นอนที่หลีกเลี่ยงไม่ได้

---

### Slide: Insight - ทำไมถึงเหนื่อย?
**Timing:** 2 นาที

**Script (slow down):**
> "หลังจากเจอ pain points เหล่านี้... ผมนั่งคิด: ทำไมถึงเหนื่อยขนาดนี้?"

**Journey:**
- ตอนแรกคิดว่า: "AI ไม่เก่งพอ"
- แต่จริงๆ: "เราไม่รู้จักบริหาร Context!"

**Realization moment (pause for effect):**
> "AI ไม่ใช่ปัญหา... วิธีใช้ต่างหาก"

**Transition:**
> "แล้วถ้า Context คือปัญหา... เราจะบริหารมันยังไง?"

**[Take a breath, drink water - this is a natural break point]**

---

## Act 3: The Turning Point (12 นาที) 💡

### Slide: ปัญหาที่แท้จริง
**Timing:** 2 นาที

**Script:**
> "นี่คือ turning point ของทั้งเรื่อง: การใช้ AI ที่ดี ไม่ใช่แค่ prompting ที่เก่ง... แต่เป็นการบริหาร Context!"

**Define Context:**
- ข้อมูลที่ AI ต้องรู้
- เป้าหมายที่ชัดเจน
- ประวัติการตัดสินใจ
- ความสัมพันธ์ระหว่างงาน

**Key formula:**
> "Context ดี → AI ทำงานได้ดี"

**Transition:** "แล้ว Context ที่ดีมีหลักการอะไร?"

---

### Slides: 5 Context Management Principles
**Timing:** 2 นาทีต่อ principle = 10 นาที**

#### Principle #1: Context is Currency (2 min)
**Script:**
> "หลักการแรก: Context = เงิน... ใช้อย่างฉลาด!"

**Key concept:** มากกว่า ≠ ดีกว่า

**Example:**
- ❌ แย่: "Read all files and fix bugs" (100+ files)
- ✅ ดี: "Fix bug in src/auth/login.ts:45" (targeted)

**Takeaway:** เลือกใช้ context อย่างรอบคอบ

---

#### Principle #2: Explicit > Implicit (2 min)
**Script:**
> "บอกชัดๆ ดีกว่าให้เดา!"

**Compare:**
- ❌ คลุมเครือ: "Make it better"
- ✅ ชัดเจน: "Refactor auth to use JWT, keep endpoints unchanged, 24h expiry, update middleware.ts"

**Emphasis:**
> "เขียนละเอียดตอนแรก = ประหยัดเวลาทีหลัง"

---

#### Principle #3: Context Versioning (2 min)
**Script:**
> "เก็บประวัติไว้... จะได้ไม่ต้องเล่าใหม่ทุกครั้ง"

**Show example:**
```markdown
# Session Context v3
## Completed: ✅ Fixed login, Added JWT
## Decisions: 24h expiry (better UX)
## Next: Migrate users, Update mobile
```

**Benefit:** Session ต่อไปเริ่มจากจุดนี้เลย!

---

#### Principle #4: Task Decomposition (2 min)
**Script:**
> "แบ่งงานใหญ่ → งานเล็กๆ หลายอัน"

**Compare:**
- ❌ งานใหญ่: "Build auth system" (2000 lines, review ไม่ไหว)
- ✅ งานเล็ก: Phase 1: JWT (100 lines), Phase 2: Middleware (50 lines), etc.

**Takeaway:** Review ง่าย, ควบคุมได้, มั่นใจมากขึ้น

---

#### Principle #5: Documentation as Context (2 min)
**Script:**
> "เขียน docs = ให้ Context กับ AI ในอนาคต"

**ROI perspective:**
- เขียน CLAUDE.md 30 นาที
- ประหยัด 10 นาที/session × 50 sessions
- = **500 นาที saved!**

**Rule of thumb:**
> "ถ้าอธิบายซ้ำ 3 รอบ → เขียน docs เลย!"

---

### Slide: Demo - Before/After
**Timing:** Optional (3-4 นาที if doing live demo)

**If doing live demo:**
- Follow Demo Option 2 script
- Show contrast clearly

**If showing screenshots:**
- Before: chaotic, slow
- After: organized, fast

**Transition:**
> "เห็นความต่างไหม? นี่แหละคือพลังของ Context Management!"

---

## Act 4: The Solution (8 นาที) 🏗️

### Slide: เกิด Codex
**Timing:** 2 นาที

**Script:**
> "ถ้าปัญหาคือ Context Management... เราก็สร้างระบบจัดการ Context สิ!"

**Introduce Codex:**
- Orchestrator สำหรับ Claude Agents
- State Management (context versioning, progress)
- Background Workers
- Research mode
- Shortcodes

**Goal:**
> "ทำให้ Context Management เป็นเรื่องง่าย"

---

### Slide: Pain → Solution Mapping
**Timing:** 2 นาที

**Script:**
> "Codex ตอบโจทย์ pain points ทั้งหมด"

**Walk through table:**
- Context Explosion → State files แยก scope
- Illusion of Control → Explicit plans + tracking
- Time Sink → Background workers
- Context Switching → Session continuity
- Unpredictability → Reasoning levels ชัดเจน

**Summary:**
> "Codex = Context Management Principles ที่เป็นจริง!"

---

### Slide: Architecture Overview
**Timing:** 2 นาที

**Script:**
> "Architecture ง่ายๆ มีหน้าตาแบบนี้"

**Explain flow:**
1. You → Shortcodes (ccc, nnn, gogogo)
2. Claude (Orchestrator)
3. State Management
4. Workers / Research

**Key principle:**
> "แยก concerns, explicit state, reproducible workflows"

**Note:** ไม่ต้องลงลึก technical มากเกินไป

---

### Slide: Demo - Shortcode Workflow
**Timing:** 2 นาที

**Script:**
> "ในทางปฏิบัติ workflow มีหน้าตาแบบนี้"

**Show steps:**
1. `ccc` → Context
2. `nnn` → Plan
3. `gogogo` → Execute with progress
4. `rrr` → Retrospective

**Benefits:**
- Context ชัดเจน
- Progress tracking real-time
- Documentation อัตโนมัติ
- Session continuity

---

### Slide: Bonus - Research & Workers
**Timing:** Optional (skip if running late)

**Quick mention:**
- Research: `rrresearch` + web search
- Workers: `www` + background execution
- Scale up without losing control

---

## Act 5: Lessons Learned (8 นาที) 🎓

**General approach:** แต่ละ lesson ใช้ ~1.5 นาที

### Lesson #1: AI ไม่ใช่ Magic Wand
**Script:**
> "บทเรียนแรก: AI ไม่ใช่ปุ่มวิเศษที่กดแล้วทุกอย่างดีขึ้น"

**Reality:**
- AI = เครื่องมือ
- ยังต้อง human judgment
- AI output = draft, not final

**Takeaway:** ตั้งความคาดหวัง realistic

---

### Lesson #2: Context > Prompting Skills
**Script:**
> "Prompt ดีไม่พอ... ถ้า Context ยังห่วย"

**Ratio:**
> "80% context, 20% prompt"

**Example:** Prompt ธรรมดา + Context ดี > Prompt ดี + Context แย่

---

### Lesson #3: Workflow > One-off Commands
**Script:**
> "งานซ้ำๆ ควรเป็น workflow"

**Benefits:**
- Repeatable
- Reliable
- Scalable
- Consistency ↑, Cognitive load ↓

---

### Lesson #4: Documentation = Investment
**Script:**
> "เขียน docs = ให้ context กับ AI และตัวเองในอนาคต"

**ROI table:** แสดงให้เห็นว่า docs คุ้มค่า

**Rule:**
> "อธิบายซ้ำ 3 รอบ → เขียน docs!"

---

### Lesson #5: Experimentation is Key
**Script:**
> "ไม่มี one-size-fits-all... ต้องลอง-ผิด-เรียนรู้"

**Framework:**
1. Hypothesis
2. Test
3. Measure
4. Learn
5. Document

**Mindset:**
> "Treat every task as learning opportunity"

---

### Lesson #6: Balance is Everything
**Script:**
> "Automation มากเกินไป = เสียความยืดหยุ่น. Manual มากเกินไป = เสียเวลา"

**Decision framework:**
- ทำบ่อยไหม?
- Pattern ชัดเจนไหม?
- → Yes to both? Automate!

**Examples:**
- ✅ Automate: Context, tests, reports
- ❌ Manual: Reviews, architectural decisions

---

## Act 6: Honest Talk (4 นาที) 😅

### Slide: สิ่งที่ยังแย่อยู่
**Timing:** 2 นาที

**Script (self-deprecating tone):**
> "ตอนนี้ต้อง honest: Codex ไม่ได้ทำให้ทุกอย่างง่ายขึ้น... แค่ทำให้บางอย่างทนได้มากขึ้น"

**5 Challenges (quick list):**
1. ความช้า (not instant)
2. ค่าใช้จ่าย (API costs)
3. ความไม่แน่นอน (stochastic)
4. Learning curve
5. Maintenance overhead

**Tone:** Honest but not negative

---

### Slide: ข้อจำกัดที่ต้องยอมรับ
**Timing:** 2 นาที

**Script:**
> "Perfect automation ไม่มีอยู่จริง"

**Trade-offs:**
- ความเร็ว vs ความแม่นยำ
- Automation vs ความยืดหยุ่น
- Cost vs Convenience

**Acceptance:**
- ใช้กับงานที่เหมาะ
- ไม่บังคับทุกอย่าง
- "Good enough" ก็ดีพอ

**Bottom line:**
> "Codex ไม่ perfect... แต่มันทำให้ทำงานกับ Claude Code สบายขึ้นมาก"

---

## Act 7: Wrap-up & Q&A (5 นาที)

### Slide: Key Takeaways
**Timing:** 2 นาที

**Script (slow, emphatic):**
> "3 สิ่งที่อยากให้จำไว้..."

**Takeaway 1:** Context > Everything
**Takeaway 2:** Workflows > Commands
**Takeaway 3:** Balance > Perfection

**Final quote:**
> "AI is not about replacing humans... It's about augmenting our ability to manage complexity."

**[Pause - let it sink in]**

---

### Slide: Resources & Next Steps
**Timing:** 1 นาที

**Script:**
> "ถ้าสนใจลองเล่น Codex..."

**Share:**
- GitHub: github.com/mahirocoko/mahirolab
- Documentation ภาษาไทย + อังกฤษ
- Examples พร้อมใช้

**Encourage:**
- Fork + ปรับแต่ง
- แชร์ประสบการณ์
- Contribute ideas

---

### Slide: Q&A
**Timing:** 2 นาที intro + remaining time

**Script:**
> "เปิด floor สำหรับคำถามและหารือ"

**Discussion prompts:**
- ใครมี pain points คล้ายกัน?
- วิธี manage context แบบอื่น?
- Features ที่อยากเห็น?
- Concerns หรือข้อกังวล?

**Encourage:**
- Open discussion
- Experience sharing
- Collaboration

---

### Slide: Thank You
**Timing:** 30 seconds

**Script:**
> "ขอบคุณทุกคนครับ!"

**Final words:**
> "Context is King. Manage it well." 👑

**Stay available** สำหรับคำถามเพิ่มเติมหลังจบ

---

## 💡 General Presentation Tips

### Energy Management
- Start strong (Act 1 - enthusiastic)
- Build tension (Act 2 - realistic)
- Release with insight (Act 3 - enlightening)
- Offer solution (Act 4 - helpful)
- Share wisdom (Act 5 - reflective)
- Be vulnerable (Act 6 - honest)
- End strong (Act 7 - inspiring)

### Pacing
- **Acts 1-2:** Build momentum
- **Act 3:** Natural breather (drink water here)
- **Acts 4-5:** Maintain energy
- **Acts 6-7:** Wrap up cleanly

### Interaction
- Check for understanding: "ใครเคยเจอแบบนี้บ้าง?"
- Pause after key insights
- Read the room - adjust pace accordingly
- Save detailed technical questions for after

### Backup Plans
- If running late: Skip Demo 3, compress Act 5
- If ahead: Add more anecdotes in Acts 2-3
- If demos fail: Use screenshots, stay calm
- If tough questions: "Good question! Let's discuss after"

---

## 🎯 Key Messages to Emphasize

1. **Context Management = Core Skill** (repeat 3+ times)
2. **AI = Tool, not magic** (ground expectations)
3. **Workflows > Ad-hoc** (systematic approach)
4. **Good enough > Perfect** (practical wisdom)
5. **Experimentation = Learning** (growth mindset)

---

## 🚨 Common Pitfalls to Avoid

- ❌ Going too technical (keep it experience-focused)
- ❌ Rushing through pain points (these are important!)
- ❌ Overselling Codex (be honest about limitations)
- ❌ Skipping context principles (these are the core)
- ❌ Forgetting to breathe (pause, drink water)

---

**Last Updated:** 2025-11-03
**Version:** 1.0

**Good luck! คุณทำได้! 💪**
