# Presentation Structure Design

**Created:** 2025-10-22
**Duration:** 60 minutes
**Format:** Slides + Live Demo

---

## 3-Layer Approach

### Philosophy
Present information in **progressive layers** so each audience segment can engage at their comfort level:
- **Layer 1:** Accessible to everyone (concepts, visuals, stories)
- **Layer 2:** Practical details (workflows, examples, metrics)
- **Layer 3:** Technical depth (implementation, customization, advanced features)

Use **visual cues** to signal depth:
- 🌍 Universal content (everyone)
- 💼 Business focus (managers)
- 🔧 Technical detail (developers)

---

## Presentation Flow (60 minutes)

### Part 1: Foundation (15 min) - Layer 1 🌍

**Goal:** Get everyone on the same page with core concepts

**Slides 1-8:**
1. **Title Slide** (1 min)
   - mahiro-lab: AI-Assisted Development Orchestration

2. **The Problem** (2 min) 🌍
   - Development workflow pain points
   - Context switching overhead
   - Repetitive tasks drain productivity

3. **The Vision** (2 min) 🌍
   - AI as a development teammate
   - Orchestrate multiple AI agents for complex tasks
   - Maintain state and continuity across sessions

4. **What is mahiro-lab?** (3 min) 🌍
   - High-level architecture diagram
   - Orchestrator/Worker pattern explained with analogy
   - "Like having a project manager (you) directing AI workers"

5. **Core Concepts** (4 min) 🌍
   - Direct process execution (no tmux hacks)
   - State management & session continuity
   - Shortcode protocol for efficiency
   - Safety-first approach

6. **Quick Demo Preview** (3 min) 🌍
   - Show terminal, show output
   - "We'll dive deeper into this soon"

---

### Part 2: Practical Workflows (20 min) - Layer 2 🌍💼🔧

**Goal:** Show real value with concrete use cases

**Slides 9-18:**

7. **Use Case Overview** (2 min) 💼
   - 7 categories of tasks mahiro-lab excels at
   - Time savings metrics overview

8. **Use Case 1: Quick Code Fixes** (3 min) 🌍
   - Before: Manual search, edit, test cycle
   - With mahiro-lab: Single command execution
   - Demo: `codex-exec.sh low "Fix typo in header"`
   - Time saved: 5-10 minutes → 30 seconds

9. **Use Case 2: Research Tasks** (3 min) 🌍💼
   - Before: Tab overload, manual synthesis
   - With mahiro-lab: Web-enabled research with structured output
   - Demo: `rrresearch "latest React 19 features"`
   - Time saved: 30-60 minutes → 5 minutes

10. **Use Case 3: Large Refactoring** (4 min) 🔧
    - Before: Hours of careful manual work
    - With mahiro-lab: Background workers with progress tracking
    - Demo: Launch worker for component refactoring
    - Time saved: 4 hours → 30 minutes

11. **Workflow Patterns** (3 min) 🌍
    - Synchronous vs. background execution
    - When to use different reasoning levels
    - Parallel execution for independent tasks

12. **Shortcode Protocol** (3 min) 🔧
    - Live demo: `ccc`, `nnn`, `gogogo` workflow
    - Show state management in action
    - Session continuity demonstration

13. **Safety & Best Practices** (2 min) 💼🔧
    - Sandboxed environments
    - Permission model (`danger-full-access` warning)
    - Review before commit
    - Exit code checking

---

### Part 3: Technical Deep Dive (15 min) - Layer 3 🔧

**Goal:** Give developers everything they need to adopt

**Slides 19-26:**

14. **Architecture Details** (3 min) 🔧
    - `codex exec` as foundation
    - Helper scripts: exec, research, worker-launcher
    - State directory structure
    - Template auto-injection system

15. **Reasoning Levels Explained** (2 min) 🔧
    - minimal, low, medium, high
    - Runtime comparison (5s → 60s)
    - When to use each level
    - Cost/benefit tradeoff

16. **Advanced Features** (4 min) 🔧
    - Background job monitoring (BashOutput, KillShell)
    - Parallel execution patterns
    - Context versioning and history
    - Progress tracking and analytics

17. **Customization & Extension** (2 min) 🔧
    - Custom templates
    - Slash commands
    - MCP integration potential
    - Adding new helper scripts

18. **Monitoring & Debugging** (2 min) 🔧
    - `codex-status.sh` dashboard
    - Execution logs
    - Common issues and solutions

19. **Getting Started** (2 min) 🌍
    - Installation steps
    - First command to try
    - Documentation resources

---

### Part 4: Wrap-up & Q&A (10 min)

**Slides 27-30:**

20. **Key Takeaways** (2 min) 🌍
    - For Developers: How to start using today
    - For Managers: ROI summary and adoption path
    - For Everyone: The future of AI-assisted development

21. **Resources** (1 min) 🌍
    - GitHub repository
    - Documentation links
    - Example library
    - Community/support

22. **Q&A** (7 min) 🌍
    - Open floor for questions
    - Address specific scenarios

---

## Demo Strategy

### Live Demos (Integrated Throughout)
**Total demo time: ~15 minutes across presentation**

1. **Quick Demo (Part 1):** Show basic `codex-exec.sh` command (2 min)
2. **Research Demo (Part 2):** Launch `rrresearch` and show output (3 min)
3. **Shortcode Demo (Part 2):** Walk through `ccc` → `nnn` → `gogogo` (5 min)
4. **Monitoring Demo (Part 3):** Show `codex-status.sh` and progress tracking (3 min)
5. **Advanced Demo (Part 3):** Parallel workers if time permits (2 min)

### Fallback Strategy
- Have screenshots ready for each demo
- Pre-record demos as backup
- Key outputs saved as files to display if live execution fails

---

## Slide Design Principles

**Visual Hierarchy:**
- Use icons to indicate audience: 🌍 💼 🔧
- Color code: Blue (concepts), Green (success/metrics), Orange (warnings/safety)
- Large code examples in monospace
- Diagrams for architecture, simple text for concepts

**Content Density:**
- Max 5 bullet points per slide
- Code examples: 10-15 lines max
- Diagrams: One concept per diagram
- Avoid text walls

**Engagement:**
- Every 5 minutes: Ask a question or show something interactive
- Use "raise hands" questions for general audience
- "Who has experienced X?" to build connection

---

## Time Buffers

**Built-in Flexibility:**
- If running short: Add optional deep-dive slides (marked with *)
- If running long: Skip advanced demos, focus on Q&A
- Each section can compress by 20% if needed

**Transition Markers:**
- Clear "Part 1 → Part 2" slides
- Progress indicator on each slide (e.g., "15/30")

---

## Success Metrics

**During Presentation:**
- Audience engagement (questions, nodding, note-taking)
- Successful live demos
- Staying within time limit

**Post-Presentation:**
- Developers: % who clone repo within 24 hours
- Managers: Follow-up conversations about adoption
- General: Positive feedback on clarity

---

**Next Step:** Create detailed slide outline (Task 1.3)
