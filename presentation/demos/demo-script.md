# Live Demo Script

**Purpose:** Step-by-step scripts for live demonstrations during presentation
**Total Demo Time:** ~15 minutes across presentation

---

## Demo Setup Requirements

### Before Presentation:
- [ ] Clean terminal (clear history)
- [ ] Navigate to demo directory
- [ ] Ensure all scripts are executable
- [ ] Test internet connection (for research demo)
- [ ] Have fallback screenshots ready
- [ ] Terminal font size: 18pt minimum
- [ ] Terminal theme: High contrast

### Terminal Setup:
```bash
cd /Users/mahiro/Git/me/vibe-code/mahiro-lab
clear
# Increase font size for visibility
# Set PS1 to simple prompt: export PS1='$ '
```

---

## Demo #1: Quick Fix (Slide 7)
**Duration:** 2 minutes
**Complexity:** Low
**Purpose:** Introduce basic concept with immediate value

### Script:

**[SLIDE 7 - Quick Demo Preview]**

**SAY:** "Let me show you how simple this is. I have a few TODO comments scattered across my codebase. Normally I'd grep, open files, read through them. Let's see mahiro-lab do it."

**TYPE:**
```bash
./codex-exec.sh low "List all TODO comments in src/ with file locations"
```

**WHILE RUNNING (15-20 seconds):**
- "It's analyzing the codebase right now"
- "Using low reasoning level - perfect for simple tasks"
- "This would take me 5-10 minutes manually"

**WHEN COMPLETE:**
```
✅ Found 12 TODOs across 8 files

src/components/Header.tsx:15
  // TODO: Add responsive breakpoint

src/utils/api.ts:42
  // TODO: Implement retry logic

... (show 3-4 more)
```

**SAY:** "There we go - 12 TODOs across 8 files in under 30 seconds. I didn't have to open a single file. This is just a taste of what's possible."

**TRANSITION:** Continue with presentation to Slide 8 divider

---

## Demo #2: Research Task (Slides 11)
**Duration:** 3-4 minutes
**Complexity:** Medium
**Purpose:** Show web integration and structured output

### Script:

**[SLIDE 11 - Use Case #2: Research]**

**SAY:** "Now let's tackle something more substantial. Imagine I need to research React 19 Server Components. Normally this means opening 15 tabs, reading for an hour, taking notes, synthesizing everything. Watch this."

**TYPE:**
```bash
./codex-research.sh "React 19 Server Components best practices"
```

**WHILE RUNNING (4-5 minutes - use this time!):**

**SAY (immediately after starting):**
- "This is running with web search enabled"
- "It's reading official docs, blog posts, community discussions"
- "Creating a structured report with citations"
- "This would normally take me 60-90 minutes"

**DURING WAIT:**
- "While this runs in the background, let me show you what it's doing" (show animation or progress if visible)
- "It's accessing real-time information from the web"
- "Synthesizing multiple sources"
- "Creating a professional research report"
- Optional: "I could actually start other work while this runs, but let's wait to see the result"

**CHECK STATUS (optional, if taking long):**
```bash
# If demo is taking too long, you can say:
"Let me check on that research..."
# But ideally it completes during your explanation
```

**WHEN COMPLETE:**
```
✅ Research complete!
   Output: .mahirolab/research/20251022_150300_12345_react_19_server_components.md
   Time: 4 minutes 32 seconds
```

**OPEN THE FILE:**
```bash
cat .mahirolab/research/20251022_*_react_19_server_components.md | head -50
```

**SAY WHILE SHOWING OUTPUT:**
- "Look at this structure: Executive Summary, Key Findings"
- Scroll to show sections
- "Here are the citations - direct URLs, properly tracked"
- "Recommendations for implementation"
- "This is production-ready documentation"
- "60-90 minutes → 5 minutes. That's a 95% time savings."

**TRANSITION:** "And that's just research. What about bigger tasks like refactoring?"

---

## Demo #3: Shortcode Workflow (Slide 14)
**Duration:** 5 minutes
**Complexity:** Medium
**Purpose:** Show state management and shortcode protocol

### Script:

**[SLIDE 14 - Shortcode Protocol Demo]**

**SAY:** "Now I want to show you the shortcode protocol - this is how we manage complex workflows with state tracking. I'll demonstrate the full cycle: create context, plan, execute."

### Step 1: Create Context (ccc)

**TYPE:**
```bash
# In Claude Code interface, type:
ccc
```

**WATCH IT CREATE:**
```markdown
# Session Context

**Date:** 2025-10-22 15:30
**Session ID:** 20251022_153000

## Goals
- Demonstrate mahiro-lab shortcode workflow
- Show state management capabilities

## Current Status
Fresh session initialized for demo

## Next Steps
- [ ] Create implementation plan
- [ ] Execute plan
```

**SAY:**
- "ccc creates our session context"
- "This maintains state across our entire workflow"
- "Notice the session ID, goals, next steps"

### Step 2: Create Plan (nnn)

**SAY:** "Now let's create a plan. I'll ask it to analyze our codebase structure."

**TYPE:**
```bash
nnn
```

**PROMPT (when asked):** "Analyze the mahiro-lab codebase structure and create documentation of the directory layout"

**WATCH IT WORK:**
```markdown
# Implementation Plan

**Created:** 2025-10-22 15:31
**Based on Context:** context.md

## Phase 1: Discovery
- [ ] Scan directory structure
- [ ] Identify key files and patterns

## Phase 2: Documentation
- [ ] Create directory map
- [ ] Document each component
```

**SAY:**
- "It read our context automatically"
- "Created a structured plan"
- "Now watch it execute"

### Step 3: Execute (gogogo)

**TYPE:**
```bash
gogogo
```

**WATCH PROGRESS TRACKING:**
```
🚀 Execution started!

Phase 1: Discovery
🔄 Scanning directory structure...
✅ Complete (15 seconds)

Phase 2: Documentation
🔄 Creating directory map...
✅ Complete (22 seconds)

✅ All tasks complete!
```

**SAY:**
- "Real-time progress tracking"
- "Each phase tracked with timestamps"
- "State preserved throughout"

### Step 4: Show State Files

**TYPE:**
```bash
ls -la .mahirolab/state/
```

**SHOW:**
```
context.md
context_history/
  context_v1_20251022.md
  context_v2_20251022.md
plans/
  plan_20251022_153000.md
progress.md
execution_log.md
```

**SAY:**
- "All state is preserved"
- "Context versioning"
- "Complete execution history"
- "This enables session continuity"
- "You can pick up exactly where you left off"

**TRANSITION:** "This state management is crucial for complex, multi-day projects. Now let's look at the technical details..."

---

## Demo #4: Monitoring (Slide 17) - OPTIONAL
**Duration:** 2 minutes
**Complexity:** Low
**Purpose:** Show job monitoring capabilities

### Script:

**[SLIDE 17 - Monitoring & Status]**

**SAY:** "Quick bonus - monitoring running jobs."

**TYPE:**
```bash
./codex-status.sh --all
```

**SHOW OUTPUT:**
```
╔════════════════════════════════════════╗
║      CODEX STATUS DASHBOARD           ║
╚════════════════════════════════════════╝

Running Jobs: 2
├─ research_20251022_141234 (15 min ago)
└─ worker_20251022_143000 (5 min ago)

Completed: 7 jobs (last 24h)
Storage: 45 MB (.mahirolab/)
```

**SAY:**
- "See all running and completed jobs"
- "Monitor progress anytime"
- "Track resource usage"
- "Built-in observability"

---

## Demo Fallback Strategy

### If Demo Fails:

**Plan A - Quick Recovery:**
1. Say: "Looks like we hit a network issue, let me show you the output"
2. Open pre-prepared screenshot
3. Walk through what would have happened

**Plan B - Skip and Summarize:**
1. Say: "Let's keep moving, but here's what you would see..."
2. Show prepared screenshots
3. Move to next section

**Plan C - Use Different Example:**
1. Have 2-3 backup commands ready
2. Switch to simpler demo
3. Complete successfully

### Backup Commands (if primary fails):

```bash
# Backup for quick fix demo:
./codex-exec.sh low "Count total lines of code in src/"

# Backup for research demo:
./codex-research.sh "TypeScript 5.3 new features summary"

# Backup for shortcode demo:
# Just show state files directly without execution
```

---

## Demo Checklist

### Before Presentation:
- [ ] Test all demos at least twice
- [ ] Prepare screenshots of expected outputs
- [ ] Check internet connectivity
- [ ] Verify Claude Code is working
- [ ] Clear terminal history
- [ ] Set up high-contrast terminal theme
- [ ] Increase font size (18pt+)
- [ ] Have backup commands ready

### During Presentation:
- [ ] Speak while demos run (don't wait silently)
- [ ] Explain what's happening
- [ ] Connect to use case value
- [ ] Show confidence (even if nervous)
- [ ] Have fallback ready mentally

### After Each Demo:
- [ ] Briefly summarize what happened
- [ ] Connect to business value
- [ ] Transition smoothly to next section

---

## Demo Tips

**Speaking While Demo Runs:**
- Never let silence hang while processing
- Explain what the AI is doing
- Build anticipation
- Connect to pain points
- Remind audience of time savings

**Handling Questions During Demos:**
- "Great question, let me answer that after this completes"
- OR if quick: Answer briefly then return to demo
- Don't lose focus on the demo output

**Energy Management:**
- Demos are high-energy moments
- Show enthusiasm
- Let excitement be genuine
- Audience feeds off your energy

**If Demo Breaks:**
- Stay calm, confident
- Have backup ready
- Say: "Let me show you the expected output"
- Move forward smoothly
- Don't apologize excessively

---

## Post-Demo Actions

After presentation:
- [ ] Share demo commands in chat/slides
- [ ] Provide GitHub repo link
- [ ] Offer to answer demo questions offline
- [ ] Share fallback screenshots as examples

---

**Demo Priority:**
1. **Must Show:** Demo #1 (Quick Fix) - easiest, builds confidence
2. **Must Show:** Demo #2 (Research) - biggest wow factor
3. **Should Show:** Demo #3 (Shortcode) - shows full workflow
4. **Nice to Have:** Demo #4 (Monitoring) - if time permits

**Total Demo Time:** 10-15 minutes of 60-minute presentation
