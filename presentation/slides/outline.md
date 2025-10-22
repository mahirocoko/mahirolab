# Presentation Slide Outline

**Title:** mahiro-lab: AI-Assisted Development Orchestration
**Duration:** 60 minutes
**Target Slides:** 28-30 slides
**Format:** Markdown (convertible to reveal.js, Marp, or PDF)

---

## Slide Breakdown with Timing

### PART 1: FOUNDATION (15 min) - Slides 1-8

#### Slide 1: Title (1 min)
**Time:** 0:00-0:01

```
mahiro-lab
AI-Assisted Development Orchestration

Streamline your development workflow with intelligent AI agents

[Your Name]
[Date]
```

---

#### Slide 2: The Problem (2 min)
**Time:** 0:01-0:03
**Audience:** 🌍 Everyone

```
The Development Workflow Challenge

❌ Context switching kills productivity
❌ Repetitive tasks consume valuable time
❌ Complex refactoring requires hours of focus
❌ Research and documentation lag behind code

"Developers spend 35% of time on non-coding tasks"
```

---

#### Slide 3: Current Solutions Fall Short (1 min)
**Time:** 0:03-0:04
**Audience:** 🌍 Everyone

```
Existing Approaches

🤖 ChatGPT/Claude: Great for conversations, but...
   - No execution capability
   - Manual copy-paste required
   - No state persistence

🔧 Basic automation: Scripts & CI/CD
   - Requires upfront work
   - Not adaptive
   - Limited to predefined tasks
```

---

#### Slide 4: The Vision (2 min)
**Time:** 0:04-0:06
**Audience:** 🌍 Everyone

```
What If AI Could Actually DO the Work?

✨ Execute commands directly
✨ Maintain context across sessions
✨ Orchestrate multiple parallel tasks
✨ Learn and adapt to your workflow

mahiro-lab makes this vision real
```

---

#### Slide 5: What is mahiro-lab? (3 min)
**Time:** 0:06-0:09
**Audience:** 🌍 Everyone

```
mahiro-lab: Architecture Overview

┌─────────────────────────────────────┐
│  You (Orchestrator)                 │
│  Using shortcode protocol           │
└──────────┬──────────────────────────┘
           │
           ├─→ codex-exec.sh (Quick tasks)
           ├─→ codex-research.sh (Web research)
           └─→ codex-worker-launcher.sh (Background jobs)
                    │
                    ├─→ Worker 1 (Refactoring)
                    ├─→ Worker 2 (Tests)
                    └─→ Worker 3 (Docs)

Built on: Claude Code + Direct Process Execution
```

---

#### Slide 6: Core Concepts (4 min)
**Time:** 0:09-0:13
**Audience:** 🌍 Everyone

```
Four Pillars of mahiro-lab

1. Direct Process Execution
   - No terminal emulation (tmux)
   - Clean stdout/stderr access
   - Reliable exit codes

2. State Management
   - Context versioning
   - Session continuity
   - Progress tracking

3. Shortcode Protocol
   - ccc: Create context
   - nnn: Create plan
   - gogogo: Execute
   - rrr: Retrospective

4. Safety First
   - Sandboxed execution
   - Explicit permissions
   - Review before commit
```

---

#### Slide 7: Quick Demo Preview (2 min)
**Time:** 0:13-0:15
**Audience:** 🌍 Everyone

```
Let's See It In Action

[LIVE DEMO or SCREENSHOT]

$ ./codex-exec.sh low "List all TODO comments in src/"

🔍 Scanning codebase...
✅ Found 12 TODOs across 8 files

Output: [Show terminal screenshot]

More demos coming soon!
```

---

#### Slide 8: Section Divider
**Time:** 0:15

```
PART 2
Practical Workflows & Use Cases
```

---

### PART 2: PRACTICAL WORKFLOWS (20 min) - Slides 9-18

#### Slide 9: Use Case Categories (2 min)
**Time:** 0:15-0:17
**Audience:** 💼 Managers, 🌍 Everyone

```
7 Ways mahiro-lab Saves Time

1. ⚡ Quick Fixes (5-10 min → 30 sec)
2. 🔍 Research Tasks (30-60 min → 5 min)
3. 🔄 Large Refactoring (4 hours → 30 min)
4. ✅ Code Reviews (20 min → 5 min)
5. 📝 Documentation (1 hour → 15 min)
6. 🧪 Test Generation (45 min → 10 min)
7. 🐛 Bug Analysis (30 min → 5 min)

Average Time Saved: 60-70% per task
```

---

#### Slide 10: Use Case #1 - Quick Fixes (3 min)
**Time:** 0:17-0:20
**Audience:** 🌍 Everyone

```
Use Case: Quick Code Fixes

BEFORE (Manual):
1. Search for issue (grep, IDE search)
2. Open files, make edits
3. Test changes
4. Commit
⏱️ Time: 5-10 minutes

WITH mahiro-lab:
$ ./codex-exec.sh low "Fix ESLint warnings in components/"

✅ Auto-detects issues
✅ Applies fixes
✅ Shows diff for review
⏱️ Time: 30 seconds

[SCREENSHOT: Before/After code comparison]
```

---

#### Slide 11: Use Case #2 - Research (3 min)
**Time:** 0:20-0:23
**Audience:** 🌍 Everyone, 💼 Managers

```
Use Case: Technical Research

BEFORE (Manual):
- Open 15+ browser tabs
- Read documentation
- Synthesize information
- Write summary
⏱️ Time: 30-60 minutes

WITH mahiro-lab:
$ ./codex-research.sh "React 19 Server Components best practices"

✅ Web search enabled
✅ Structured report with citations
✅ Saved to .mahirolab/research/
⏱️ Time: 5 minutes

[DEMO or SCREENSHOT: Research report output]
```

---

#### Slide 12: Use Case #3 - Large Refactoring (4 min)
**Time:** 0:23-0:27
**Audience:** 🔧 Developers

```
Use Case: Component Refactoring

BEFORE (Manual):
- Plan refactoring approach
- Update 20+ files manually
- Ensure consistency
- Test thoroughly
⏱️ Time: 4 hours

WITH mahiro-lab:
$ ./codex-worker-launcher.sh high "Refactor Button components to use new design system"

✅ Runs in background
✅ Progress tracking
✅ Consistent changes across codebase
⏱️ Time: 30 minutes (mostly automated)

[SCREENSHOT: Worker progress output]
```

---

#### Slide 13: Workflow Patterns (3 min)
**Time:** 0:27-0:30
**Audience:** 🔧 Developers, 🌍 Everyone

```
Choosing the Right Pattern

SYNCHRONOUS (codex-exec.sh)
✓ Quick tasks (< 2 min)
✓ Need immediate output
✓ Interactive workflows
Example: "List all dependencies"

BACKGROUND (codex-worker-launcher.sh)
✓ Long-running tasks (> 5 min)
✓ Don't need to watch
✓ Parallel execution
Example: "Analyze entire codebase performance"

RESEARCH (codex-research.sh)
✓ Need latest information
✓ Web search required
✓ Structured output
Example: "Compare framework options"
```

---

#### Slide 14: Shortcode Protocol Demo (5 min)
**Time:** 0:30-0:35
**Audience:** 🔧 Developers

```
Live Demo: ccc → nnn → gogogo Workflow

[LIVE TERMINAL DEMO]

Step 1: Create context
$ ccc

Step 2: Create plan
$ nnn

Step 3: Execute plan
$ gogogo

Step 4: Review progress
$ lll

Shows: State management, session continuity, progress tracking
```

---

#### Slide 15: Reasoning Levels (2 min)
**Time:** 0:35-0:37
**Audience:** 🔧 Developers

```
Choosing Reasoning Levels

minimal (~5-10s)
  └─ List files, simple queries

low (~10-15s) [DEFAULT]
  └─ Quick fixes, basic tasks

medium (~15-25s)
  └─ Research, moderate complexity

high (~30-60s+)
  └─ Large refactors, deep analysis

💡 Tip: Start low, increase if results aren't good enough
```

---

#### Slide 16: Safety & Best Practices (2 min)
**Time:** 0:37-0:39
**Audience:** 💼 Managers, 🔧 Developers

```
Safety-First Approach

⚠️ CRITICAL: danger-full-access flag
   - Grants unrestricted system access
   - Use only in isolated dev environments
   - Keep secrets out of scope

✅ Best Practices:
   - Review all diffs before committing
   - Check exit codes (0 = success)
   - Use version control
   - Test in sandbox first
   - Monitor background jobs

🔒 Production Safety:
   - Never run on production systems
   - Scope to specific directories
   - Add permission guards before sharing
```

---

#### Slide 17: Monitoring & Status (1 min)
**Time:** 0:39-0:40
**Audience:** 🔧 Developers

```
Monitoring Jobs

$ ./codex-status.sh --all

Running Jobs: 3
├─ research_20251022_141234 (5 min ago)
├─ worker_20251022_142000 (2 min ago)
└─ worker_20251022_143000 (30 sec ago)

Completed: 7 jobs (last 24h)
Storage: 45 MB (.mahirolab/)

[SCREENSHOT: Status dashboard]
```

---

#### Slide 18: Section Divider
**Time:** 0:40

```
PART 3
Technical Deep Dive
(Developers - buckle up! 🚀)
```

---

### PART 3: TECHNICAL DEEP DIVE (12 min) - Slides 19-25

#### Slide 19: Architecture Deep Dive (3 min)
**Time:** 0:40-0:43
**Audience:** 🔧 Developers

```
Under the Hood

Helper Script Layer:
  codex-exec.sh       → Thin wrapper for sync tasks
  codex-research.sh   → Web search + template injection
  codex-worker-launcher.sh → Background + PID tracking

Core Foundation:
  codex exec -s danger-full-access -c model_reasoning_effort="X" "prompt"

State Management:
  .mahirolab/state/
    ├── context.md (current session)
    ├── context_history/ (versioned snapshots)
    ├── plans/ (implementation plans)
    ├── progress.md (real-time tracking)
    └── execution_log.md (detailed timeline)

Template System:
  - Auto-injects structured formats
  - Variable substitution ({{TOPIC}}, {{DATE}})
  - Consistent output across runs
```

---

#### Slide 20: Advanced Features (3 min)
**Time:** 0:43-0:46
**Audience:** 🔧 Developers

```
Advanced Capabilities

Parallel Execution:
  $ ./codex-worker-launcher.sh "Task 1" &
  $ ./codex-worker-launcher.sh "Task 2" &
  $ wait

Context Versioning:
  - Every session creates new version
  - Continue from previous or start fresh
  - Full history preserved

Progress Tracking:
  [████████░░░░░░░░░░░░] 40% (6/15 tasks)
  ETA: 12 minutes

Analytics:
  - Success rates
  - Average task duration
  - Productivity metrics
```

---

#### Slide 21: Customization (2 min)
**Time:** 0:46-0:48
**Audience:** 🔧 Developers

```
Extending mahiro-lab

Custom Templates:
  .mahirolab/templates/
    ├── research-report.md
    ├── worker-task.md
    └── your-custom-template.md

Slash Commands:
  .claude/commands/
    └── custom-workflow.md

MCP Integration:
  - Playwright for browser automation
  - IDE diagnostics
  - Custom MCP servers

Add Your Own Scripts:
  .mahirolab/bin/
    └── your-helper.sh
```

---

#### Slide 22: Debugging & Troubleshooting (2 min)
**Time:** 0:48-0:50
**Audience:** 🔧 Developers

```
Common Issues & Solutions

Job fails silently:
  ✓ Check .mahirolab/workers/*.md for errors
  ✓ Verify exit code
  ✓ Review execution_log.md

Output file not found:
  ✓ Agent may still be writing
  ✓ Check temp files (TEMP_codex_task.md)
  ✓ Wait for PID-tagged file

Cleanup & Maintenance:
  $ ./codex-cleanup.sh --age 7 --dry-run
  $ ./codex-status.sh --stats

Debug Mode:
  $ codex exec --dry-run "task"
```

---

#### Slide 23: Real-World Integration (2 min)
**Time:** 0:50-0:52
**Audience:** 🔧 Developers, 💼 Managers

```
Integrating into Your Workflow

Daily Development:
  Morning: ccc (review context)
  Planning: nnn (create plan)
  Execution: gogogo (run tasks)
  Evening: rrr (retrospective)

CI/CD Integration:
  - Run codex exec in pipelines
  - Automated code analysis
  - Documentation generation
  - Test coverage reports

Team Adoption:
  1. Start with one developer (prove value)
  2. Share templates and patterns
  3. Create team-specific shortcodes
  4. Regular retrospectives on AI usage
```

---

#### Slide 24: Getting Started (2 min)
**Time:** 0:52-0:54
**Audience:** 🌍 Everyone

```
Try It Today

Prerequisites:
  ✓ Claude Code installed
  ✓ Git repository
  ✓ Terminal access

Quick Start:
  1. Clone mahiro-lab
     $ git clone [repo-url]

  2. Make scripts executable
     $ chmod +x .mahirolab/bin/*.sh

  3. Run your first task
     $ ./codex-exec.sh low "Describe this project"

  4. Explore examples
     $ ls .mahirolab/examples/

Complete docs: [GitHub link]
```

---

#### Slide 25: Section Divider
**Time:** 0:54

```
WRAP-UP
Key Takeaways & Next Steps
```

---

### PART 4: WRAP-UP (6 min) - Slides 26-28 + Q&A

#### Slide 26: Key Takeaways (2 min)
**Time:** 0:54-0:56
**Audience:** 🌍 Everyone

```
What You Learned Today

For Developers 🔧:
  ✓ Architecture: Orchestrator/worker pattern
  ✓ Tools: exec, research, worker-launcher
  ✓ Practice: Shortcode workflow (ccc/nnn/gogogo)

For Managers 💼:
  ✓ ROI: 60-70% time savings on routine tasks
  ✓ Safety: Sandboxed, review-required approach
  ✓ Adoption: Start small, prove value, scale

For Everyone 🌍:
  ✓ Concept: AI can execute, not just advise
  ✓ Future: Collaborative AI workflows are here
  ✓ Action: Try it yourself today
```

---

#### Slide 27: Resources (1 min)
**Time:** 0:56-0:57
**Audience:** 🌍 Everyone

```
Learn More

📚 Documentation:
   - GitHub: [repo-url]
   - Quick Start: README.md
   - Examples: .mahirolab/examples/

💡 Templates:
   - Research reports
   - Worker tasks
   - Custom workflows

🎯 Next Steps:
   - Clone and experiment
   - Join discussions (Issues/Discussions)
   - Share your use cases

📧 Contact: [your-contact]
```

---

#### Slide 28: Questions? (7 min)
**Time:** 0:57-1:04
**Audience:** 🌍 Everyone

```
Q&A

❓ Your Questions

[Open floor for discussion]

Common questions to prepare for:
- How does this compare to GitHub Copilot?
- Can it work with other AI models?
- What about cost (API usage)?
- Security concerns?
- Team collaboration features?
```

---

## Timing Summary

| Part | Duration | Slides | Key Content |
|------|----------|--------|-------------|
| 1. Foundation | 15 min | 1-8 | Problem, vision, concepts |
| 2. Practical | 20 min | 9-18 | Use cases, workflows, demos |
| 3. Technical | 12 min | 19-25 | Architecture, customization |
| 4. Wrap-up | 6 min | 26-28 | Takeaways, resources |
| Q&A | 7 min | - | Open discussion |
| **Total** | **60 min** | **28** | **Complete presentation** |

---

## Notes for Presenter

**Buffer Strategy:**
- If ahead of schedule: Expand demos, add Q&A time
- If behind schedule: Skip slides 21-22 (customization/debugging)
- Must-include: Slides 1-11, 14, 24, 26

**Energy Management:**
- Part 1: High energy, engage audience
- Part 2: Practical, show value
- Part 3: Deep focus, technical excitement
- Part 4: Inspire action

**Interaction Points:**
- Slide 2: "Raise hands if you've experienced this"
- Slide 9: "Which use case resonates most?"
- Slide 14: Live demo - invite questions
- Slide 28: Full Q&A session

---

**Next Step:** Create actual slide content (Phase 3)
