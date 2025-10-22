# mahiro-lab Presentation Materials

**Complete presentation package for 60-minute talk**

---

## 📁 Directory Structure

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

## 🎯 Presentation Overview

**Title:** mahiro-lab: AI-Assisted Development Orchestration
**Duration:** 60 minutes
**Format:** Slides + Live Demos
**Target Audience:** Developers, Managers, General Audience

### Structure:
1. **Part 1 (15 min):** Foundation - Problem, vision, core concepts
2. **Part 2 (20 min):** Practical Workflows - Use cases, demos, patterns
3. **Part 3 (15 min):** Technical Deep Dive - Architecture, customization
4. **Part 4 (10 min):** Wrap-up & Q&A

---

## 🚀 Quick Start for Presenters

### 1. Review Materials (1 hour)
```bash
# Read these files first:
1. presentation-structure.md       # Understand the flow
2. slides/outline.md               # Review all slides
3. demos/demo-script.md            # Practice demos
4. presenter-notes.md              # Timing and tips
```

### 2. Prepare Demos (30 minutes)
```bash
# Follow demo checklist:
cd demos/
cat demo-checklist.md

# Test each demo:
- Quick fix demo
- Research demo
- Shortcode workflow demo
```

### 3. Convert Slides (10 minutes)

**Option A: Marp (Recommended)**
```bash
# Install Marp CLI
npm install -g @marp-team/marp-cli

# Convert to PDF
marp slides/slides.md --pdf -o mahiro-lab-presentation.pdf

# Convert to HTML
marp slides/slides.md -o mahiro-lab-presentation.html
```

**Option B: reveal.js**
```bash
# Install pandoc
brew install pandoc  # macOS
# or apt-get install pandoc  # Linux

# Convert
pandoc slides/slides.md -t revealjs -s -o slides.html
```

**Option C: Use as-is**
- Present directly from markdown
- Use VSCode with Markdown Preview
- Or any markdown viewer

---

## 📊 Key Metrics to Emphasize

- **Average time savings:** 83% across all use cases
- **Quick fixes:** 95% faster (10 min → 30 sec)
- **Research:** 92% faster (60 min → 5 min)
- **Refactoring:** 87% faster (4 hours → 30 min)

---

## 🎬 Live Demo Overview

### Demo #1: Quick Fix (Slide 7)
**Duration:** 2 minutes
**Command:** `./codex-exec.sh low "List all TODO comments"`
**Purpose:** Show simplicity and speed

### Demo #2: Research (Slide 11)
**Duration:** 3-4 minutes
**Command:** `./codex-research.sh "React 19 Server Components"`
**Purpose:** Show web integration and structured output

### Demo #3: Shortcode Workflow (Slide 14)
**Duration:** 5 minutes
**Commands:** `ccc` → `nnn` → `gogogo`
**Purpose:** Show state management and full workflow

**Total Demo Time:** ~15 minutes of 60-minute presentation

---

## 📚 Handout Materials

Provide these to attendees:
1. `quick-start.md` - Get started in 5 minutes
2. `shortcode-reference.md` - Quick reference card
3. `best-practices.md` - Tips and best practices
4. `use-cases/` - All 7 use cases documented

**Tip:** Print `shortcode-reference.md` as a one-page handout

---

## 🎨 Presentation Customization

### Branding
Edit `slides/slides.md`:
- Line 8: Add your name
- Line 9: Add date
- Slide 27: Add contact information
- Slide 29: Add social media links

### Timing Adjustments
- **30-minute version:** Use slides 1-12, 24, 26 only
- **45-minute version:** Skip slides 19-23 (technical deep dive)
- **90-minute workshop:** Add hands-on exercises after each demo

### Content Variations
- **Technical audience only:** Expand Part 3 (slides 19-25)
- **Management audience only:** Expand metrics and ROI in Part 2
- **General audience only:** Focus on Part 1-2, skip Part 3

---

## ✅ Pre-Presentation Checklist

**1 Week Before:**
- [ ] Review all materials
- [ ] Practice demos 3+ times
- [ ] Customize slides with your info
- [ ] Export to preferred format
- [ ] Test in presentation mode

**1 Day Before:**
- [ ] Test all demos again
- [ ] Prepare backup materials (screenshots)
- [ ] Check internet connection
- [ ] Print handouts (if needed)

**1 Hour Before:**
- [ ] Set up terminal (font size, theme)
- [ ] Clear terminal history
- [ ] Test screen sharing
- [ ] Have water ready
- [ ] Deep breath - you've got this!

---

## 🎯 Success Criteria

**During Presentation:**
- ✅ Audience engaged (questions, nodding)
- ✅ Demos execute successfully
- ✅ Stay within 60 minutes

**After Presentation:**
- ✅ Attendees ask how to get started
- ✅ Positive feedback on clarity
- ✅ Developers want to try it immediately

---

## 📖 Additional Resources

### For Presenters:
- `presenter-notes.md` - Slide-by-slide notes
- `demos/demo-script.md` - Detailed demo walkthrough
- `audience-analysis.md` - Understand your audience

### For Attendees:
- `quick-start.md` - Get started guide
- `shortcode-reference.md` - Command reference
- `best-practices.md` - Tips and tricks
- All use case documentation

---

## 💡 Tips for Success

**Before:**
- Practice demos until you can do them blind
- Know your backup plan if demos fail
- Arrive early to test equipment

**During:**
- Speak to the back of the room
- Pause for impact after key points
- Use wait time during demos productively
- Show genuine enthusiasm

**After:**
- Share slides and materials
- Follow up on questions
- Collect feedback for improvement

---

## 🐛 Troubleshooting

**Slides won't convert:**
- Use markdown viewer directly
- Export to PDF from IDE
- Use online markdown-to-slides tools

**Demos fail:**
- Switch to backup screenshots immediately
- Stay calm and confident
- "Here's what you would see..."

**Running out of time:**
- Skip slides 21-22 (customization)
- Reduce Q&A to 5 minutes
- Skip optional demos

**Too much time:**
- Expand demos
- Take more questions
- Show additional examples

---

## 📞 Support

**Questions about presentation materials:**
- Check relevant `.md` files first
- Review `presenter-notes.md` for tips
- Practice demos to build confidence

**Technical questions about mahiro-lab:**
- See main project documentation
- `.mahirolab/docs/` directory
- GitHub repository

---

## 📄 License & Attribution

**Attribution:**
When presenting, please mention:
- mahiro-lab project
- Built on Claude Code
- Link to GitHub repository

**Customization:**
You are free to:
- Customize slides for your audience
- Add company branding
- Modify examples
- Translate to other languages

---

## 🎉 Ready to Present!

You have everything you need:
- ✅ Complete slide deck (28 slides)
- ✅ Detailed demo scripts
- ✅ Use case documentation
- ✅ Presenter notes with timing
- ✅ Handout materials
- ✅ Backup plans

**Now go inspire your audience to embrace AI-assisted development!** 🚀

---

**Questions?** Review `presenter-notes.md` for additional guidance.

**Good luck!** You're going to do great! 💪
