# mahiro-lab Presentation Slides

**Format:** Markdown (convertible to Marp, reveal.js, or PDF)
**Duration:** 60 minutes
**Slides:** 28

---

<!-- Slide 1 -->
# mahiro-lab
## AI-Assisted Development Orchestration

**Streamline your development workflow with intelligent AI agents**

[Your Name]
[Date]

---

<!-- Slide 2 -->
# The Development Workflow Challenge

❌ Context switching kills productivity
❌ Repetitive tasks consume valuable time
❌ Complex refactoring requires hours of focus
❌ Research and documentation lag behind code

> "Developers spend 35% of time on non-coding tasks"

---

<!-- Slide 3 -->
# Current Solutions Fall Short

**🤖 ChatGPT/Claude:** Great for conversations, but...
- No execution capability
- Manual copy-paste required
- No state persistence

**🔧 Basic automation:** Scripts & CI/CD
- Requires upfront work
- Not adaptive
- Limited to predefined tasks

---

<!-- Slide 4 -->
# What If AI Could Actually DO the Work?

✨ Execute commands directly
✨ Maintain context across sessions
✨ Orchestrate multiple parallel tasks
✨ Learn and adapt to your workflow

**mahiro-lab makes this vision real**

---

<!-- Slide 5 -->
# mahiro-lab: Architecture Overview

```
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
```

**Built on:** Claude Code + Direct Process Execution

---

<!-- Slide 6 -->
# Four Pillars of mahiro-lab

**1. Direct Process Execution**
- No terminal emulation (tmux)
- Clean stdout/stderr access
- Reliable exit codes

**2. State Management**
- Context versioning
- Session continuity
- Progress tracking

**3. Shortcode Protocol**
- `ccc`: Create context
- `nnn`: Create plan
- `gogogo`: Execute
- `rrr`: Retrospective

**4. Safety First**
- Sandboxed execution
- Explicit permissions
- Review before commit

---

<!-- Slide 7 -->
# Quick Demo

**[LIVE DEMO]**

```bash
$ ./codex-exec.sh low "List all TODO comments in src/"
```

🔍 Scanning codebase...
✅ Found 12 TODOs across 8 files

---

<!-- Slide 8: Section Divider -->
# PART 2
## Practical Workflows & Use Cases

---

<!-- Slide 9 -->
# 7 Ways mahiro-lab Saves Time

| Use Case | Time Saved |
|----------|------------|
| ⚡ Quick Fixes | 5-10 min → 30 sec |
| 🔍 Research Tasks | 30-60 min → 5 min |
| 🔄 Large Refactoring | 4 hours → 30 min |
| ✅ Code Reviews | 20 min → 5 min |
| 📝 Documentation | 1 hour → 15 min |
| 🧪 Test Generation | 45 min → 10 min |
| 🐛 Bug Analysis | 30 min → 5 min |

**Average Time Saved: 60-70% per task**

---

<!-- Slide 10 -->
# Use Case: Quick Code Fixes

**BEFORE (Manual):** 5-10 minutes
1. Search for issue
2. Open files, make edits
3. Test changes
4. Commit

**WITH mahiro-lab:** 30 seconds
```bash
$ ./codex-exec.sh low "Fix ESLint warnings in components/"
```

✅ Auto-detects issues
✅ Applies fixes
✅ Shows diff for review

🌍 **For Everyone**

---

<!-- Slide 11 -->
# Use Case: Technical Research

**BEFORE (Manual):** 30-60 minutes
- Open 15+ browser tabs
- Read documentation
- Synthesize information
- Write summary

**WITH mahiro-lab:** 5 minutes
```bash
$ ./codex-research.sh "React 19 Server Components"
```

✅ Web search enabled
✅ Structured report with citations
✅ Saved to `.mahirolab/research/`

**[DEMO]**

💼 **Business Impact:** 15x time multiplier

---

<!-- Slide 12 -->
# Use Case: Large-Scale Refactoring

**BEFORE (Manual):** 4 hours
- Plan approach
- Update 20+ files manually
- Ensure consistency
- Test thoroughly

**WITH mahiro-lab:** 30 minutes
```bash
$ ./codex-worker-launcher.sh high \
  "Refactor Button components to new design system"
```

✅ Runs in background
✅ Progress tracking
✅ Consistent changes

🔧 **For Developers**

---

<!-- Slide 13 -->
# Choosing the Right Pattern

**SYNCHRONOUS** (`codex-exec.sh`)
- ✓ Quick tasks (< 2 min)
- ✓ Need immediate output
- ✓ Interactive workflows

**BACKGROUND** (`codex-worker-launcher.sh`)
- ✓ Long-running tasks (> 5 min)
- ✓ Don't need to watch
- ✓ Parallel execution

**RESEARCH** (`codex-research.sh`)
- ✓ Need latest information
- ✓ Web search required
- ✓ Structured output

---

<!-- Slide 14 -->
# Shortcode Protocol Demo

**[LIVE TERMINAL DEMO]**

```bash
$ ccc          # Create context
$ nnn          # Create plan
$ gogogo       # Execute plan
$ lll          # Check status
```

**Shows:** State management, session continuity, progress tracking

🔧 **For Developers**

---

<!-- Slide 15 -->
# Choosing Reasoning Levels

| Level | Duration | Use For |
|-------|----------|---------|
| `minimal` | ~5-10s | List files, simple queries |
| `low` | ~10-15s | Quick fixes, basic tasks |
| `medium` | ~15-25s | Research, moderate complexity |
| `high` | ~30-60s+ | Large refactors, deep analysis |

💡 **Tip:** Start low, increase if results aren't good enough

---

<!-- Slide 16 -->
# Safety-First Approach

⚠️ **CRITICAL:** `danger-full-access` flag
- Grants unrestricted system access
- Use only in isolated dev environments
- Keep secrets out of scope

✅ **Best Practices:**
- Review all diffs before committing
- Check exit codes (0 = success)
- Use version control
- Test in sandbox first
- Monitor background jobs

🔒 **Production Safety:**
- Never run on production systems
- Scope to specific directories
- Add permission guards before sharing

---

<!-- Slide 17 -->
# Monitoring Jobs

```bash
$ ./codex-status.sh --all

Running Jobs: 3
├─ research_20251022_141234 (5 min ago)
├─ worker_20251022_142000 (2 min ago)
└─ worker_20251022_143000 (30 sec ago)

Completed: 7 jobs (last 24h)
Storage: 45 MB (.mahirolab/)
```

---

<!-- Slide 18: Section Divider -->
# PART 3
## Technical Deep Dive
**(Developers - buckle up! 🚀)**

---

<!-- Slide 19 -->
# Architecture Deep Dive

**Helper Script Layer:**
- `codex-exec.sh` → Thin wrapper for sync tasks
- `codex-research.sh` → Web search + template injection
- `codex-worker-launcher.sh` → Background + PID tracking

**Core Foundation:**
```bash
codex exec -s danger-full-access \
  -c model_reasoning_effort="X" "prompt"
```

**State Management:**
```
.mahirolab/state/
├── context.md (current session)
├── context_history/ (versioned snapshots)
├── plans/ (implementation plans)
├── progress.md (real-time tracking)
└── execution_log.md (detailed timeline)
```

🔧 **For Developers**

---

<!-- Slide 20 -->
# Advanced Features

**Parallel Execution:**
```bash
$ ./codex-worker-launcher.sh "Task 1" &
$ ./codex-worker-launcher.sh "Task 2" &
$ wait
```

**Context Versioning:**
- Every session creates new version
- Continue from previous or start fresh
- Full history preserved

**Progress Tracking:**
```
[████████░░░░░░░░░░░░] 40% (6/15 tasks)
ETA: 12 minutes
```

**Analytics:**
- Success rates
- Average task duration
- Productivity metrics

---

<!-- Slide 21 -->
# Customization & Extension

**Custom Templates:**
```
.mahirolab/templates/
├── research-report.md
├── worker-task.md
└── your-custom-template.md
```

**Slash Commands:**
```
.claude/commands/
└── custom-workflow.md
```

**Add Your Own Scripts:**
```
.mahirolab/bin/
└── your-helper.sh
```

**MCP Integration:** Playwright, IDE diagnostics, custom servers

---

<!-- Slide 22 -->
# Debugging & Troubleshooting

**Common Issues:**

Job fails silently:
- ✓ Check `.mahirolab/workers/*.md` for errors
- ✓ Verify exit code
- ✓ Review `execution_log.md`

Output file not found:
- ✓ Agent may still be writing
- ✓ Check temp files (`TEMP_codex_task.md`)
- ✓ Wait for PID-tagged file

**Cleanup & Maintenance:**
```bash
$ ./codex-cleanup.sh --age 7 --dry-run
$ ./codex-status.sh --stats
```

---

<!-- Slide 23 -->
# Real-World Integration

**Daily Development:**
- Morning: `ccc` (review context)
- Planning: `nnn` (create plan)
- Execution: `gogogo` (run tasks)
- Evening: `rrr` (retrospective)

**CI/CD Integration:**
- Run `codex exec` in pipelines
- Automated code analysis
- Documentation generation
- Test coverage reports

**Team Adoption:**
1. Start with one developer (prove value)
2. Share templates and patterns
3. Create team-specific shortcodes
4. Regular retrospectives on AI usage

---

<!-- Slide 24 -->
# Getting Started

**Prerequisites:**
- ✓ Claude Code installed
- ✓ Git repository
- ✓ Terminal access

**Quick Start:**
```bash
1. Clone mahiro-lab
   $ git clone [repo-url]

2. Make scripts executable
   $ chmod +x .mahirolab/bin/*.sh

3. Run your first task
   $ ./codex-exec.sh low "Describe this project"

4. Explore examples
   $ ls .mahirolab/examples/
```

**Complete docs:** [GitHub link]

---

<!-- Slide 25: Section Divider -->
# WRAP-UP
## Key Takeaways & Next Steps

---

<!-- Slide 26 -->
# Key Takeaways

**For Developers 🔧:**
- ✓ Architecture: Orchestrator/worker pattern
- ✓ Tools: exec, research, worker-launcher
- ✓ Practice: Shortcode workflow (ccc/nnn/gogogo)

**For Managers 💼:**
- ✓ ROI: 60-70% time savings on routine tasks
- ✓ Safety: Sandboxed, review-required approach
- ✓ Adoption: Start small, prove value, scale

**For Everyone 🌍:**
- ✓ Concept: AI can execute, not just advise
- ✓ Future: Collaborative AI workflows are here
- ✓ Action: Try it yourself today

---

<!-- Slide 27 -->
# Resources

**📚 Documentation:**
- GitHub: [repo-url]
- Quick Start: README.md
- Examples: `.mahirolab/examples/`

**💡 Templates:**
- Research reports
- Worker tasks
- Custom workflows

**🎯 Next Steps:**
- Clone and experiment
- Join discussions (Issues/Discussions)
- Share your use cases

**📧 Contact:** [your-contact]

---

<!-- Slide 28 -->
# Questions?

❓ **Your Questions**

---

**Common questions to prepare for:**
- How does this compare to GitHub Copilot?
- Can it work with other AI models?
- What about cost (API usage)?
- Security concerns?
- Team collaboration features?

---

# Thank You!

**Let's build the future of AI-assisted development together**

[GitHub Repository]
[Contact Information]
[Social Media]

---

<!-- END OF SLIDES -->

## Slide Notes

**Total Slides:** 28
**Format:** Markdown (ready for Marp/reveal.js conversion)
**Theme Suggestion:** Dark theme with high contrast
**Font:** Monospace for code, Sans-serif for content

**Marp Conversion:**
Add frontmatter:
```yaml
---
marp: true
theme: default
class: invert
paginate: true
---
```

**reveal.js Conversion:**
Use pandoc:
```bash
pandoc slides.md -t revealjs -s -o slides.html
```
