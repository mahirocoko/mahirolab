# Quick Start Guide

**Get started with mahiro-lab in 5 minutes**

---

## Prerequisites

✅ **Claude Code** installed
✅ **Git** repository
✅ **Terminal** access
✅ **Bash** shell

---

## Installation (2 minutes)

### Step 1: Clone Repository
```bash
git clone https://github.com/your-username/mahiro-lab.git
cd mahiro-lab
```

### Step 2: Make Scripts Executable
```bash
chmod +x .mahirolab/bin/*.sh
```

### Step 3: Verify Installation
```bash
ls -la .mahirolab/bin/
```

You should see:
- `codex-exec.sh`
- `codex-research.sh`
- `codex-worker-launcher.sh`
- `codex-status.sh`
- `codex-cleanup.sh`

---

## Your First Command (1 minute)

### Try a Simple Task:
```bash
./mahirolab/bin/codex-exec.sh low "List all files in src/ directory"
```

**Expected Output:**
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

**Congratulations!** You just ran your first mahiro-lab command! 🎉

---

## Core Commands (2 minutes)

### 1. Quick Synchronous Tasks
**Pattern:** `./codex-exec.sh [reasoning] "task"`

```bash
# Find all TODO comments
./codex-exec.sh low "Find all TODO comments in codebase"

# Fix linting warnings
./codex-exec.sh low "Fix ESLint warnings in src/components/"

# Count lines of code
./codex-exec.sh minimal "Count total lines of code"
```

**When to use:** Tasks under 2 minutes, need immediate results

---

### 2. Research Tasks
**Pattern:** `./codex-research.sh "topic"`

```bash
# Research technology
./codex-research.sh "React Server Components best practices"

# Compare options
./codex-research.sh "Zustand vs Redux Toolkit comparison"

# Security investigation
./codex-research.sh "CVE-2024-XXXXX mitigation strategies"
```

**Output Location:** `.mahirolab/research/YYYYMMDD_HHMMSS_*.md`

**When to use:** Need web search, structured report, citations

---

### 3. Background Workers
**Pattern:** `./codex-worker-launcher.sh [reasoning] "task"`

```bash
# Large refactoring
./codex-worker-launcher.sh high "Refactor all components to use new API"

# Generate tests
./codex-worker-launcher.sh medium "Create unit tests for utils/"

# Documentation generation
./codex-worker-launcher.sh medium "Generate API documentation"
```

**Output Location:** `.mahirolab/workers/YYYYMMDD_HHMMSS_*.md`

**When to use:** Tasks over 5 minutes, can work on other things meanwhile

---

## Reasoning Levels

| Level | Duration | Use For |
|-------|----------|---------|
| `minimal` | 5-10s | List files, simple queries |
| `low` | 10-15s | **Quick fixes** (default) |
| `medium` | 15-25s | Research, moderate tasks |
| `high` | 30-60s+ | Large refactoring, deep analysis |

**💡 Tip:** Start with `low`, increase if results aren't satisfactory

---

## Shortcode Protocol

### Using Claude Code UI:

**Create Context:**
```
User: ccc
```
Creates session context with goals and status

**Create Plan:**
```
User: nnn
```
Creates implementation plan based on context

**Execute Plan:**
```
User: gogogo
```
Executes the plan with real-time progress tracking

**Check Status:**
```
User: lll
```
Shows project status dashboard

**Create Retrospective:**
```
User: rrr
```
Generates session retrospective

---

## Monitoring Jobs

### Check Status:
```bash
./codex-status.sh --all
```

**Output:**
```
Running Jobs: 2
├─ research_20251022_141234 (5 min ago)
└─ worker_20251022_143000 (2 min ago)

Completed: 7 jobs (last 24h)
Storage: 45 MB
```

### View Specific Job:
```bash
cat .mahirolab/workers/20251022_143000_*.md
```

---

## Example Workflows

### Workflow 1: Quick Code Fix
```bash
# 1. Find the issue
./codex-exec.sh low "Find all console.log statements"

# 2. Fix it
./codex-exec.sh low "Remove all console.log statements from src/"

# 3. Verify
git diff
```

**Time:** 1-2 minutes

---

### Workflow 2: Research & Implement
```bash
# 1. Research (runs in background if using Claude UI)
./codex-research.sh "Best practices for React error boundaries"

# 2. Read the report
cat .mahirolab/research/*error_boundaries*.md

# 3. Implement based on findings
./codex-exec.sh medium "Add error boundary to App component"
```

**Time:** 10-15 minutes

---

### Workflow 3: Large Refactoring
```bash
# 1. Launch background worker
./codex-worker-launcher.sh high "Migrate from class components to hooks"

# 2. Continue other work...

# 3. Check progress periodically
./codex-status.sh

# 4. Review when complete
cat .mahirolab/workers/*migrate*.md
git diff
```

**Time:** 30-45 minutes (mostly automated)

---

## Safety Checklist

Before running any command:

✅ **Working in development environment** (not production)
✅ **Have uncommitted changes backed up** (git stash/commit)
✅ **Will review diffs before committing** (always check output)
✅ **Understand the task** (don't run blindly)

⚠️ **Remember:** Scripts use `danger-full-access` - use only in isolated environments

---

## Common Issues & Solutions

### Issue: Permission Denied
```bash
# Solution: Make scripts executable
chmod +x .mahirolab/bin/*.sh
```

### Issue: Command Not Found
```bash
# Solution: Use full path or add to PATH
./mahirolab/bin/codex-exec.sh low "task"

# OR add to PATH:
export PATH="$PATH:$(pwd)/.mahirolab/bin"
```

### Issue: Job Output Not Found
```bash
# Solution: Check for TEMP files (still writing)
ls .mahirolab/workers/*TEMP*

# Wait a moment, then check again
ls .mahirolab/workers/
```

### Issue: Web Search Not Working
```bash
# Solution: Check internet connection
# Research scripts require network access
ping anthropic.com
```

---

## Next Steps

**Now that you're set up:**

1. **📖 Read Full Docs:** [`.mahirolab/docs/`]
2. **🎯 Try Examples:** [`.mahirolab/examples/`]
3. **🔧 Customize:** Create your own templates
4. **📊 Track Progress:** Use shortcode workflow (ccc/nnn/gogogo)
5. **🤝 Share:** Contribute use cases and patterns

---

## Getting Help

- **Documentation:** `.mahirolab/docs/`
- **Examples:** `.mahirolab/examples/`
- **Issues:** GitHub Issues
- **Discussions:** GitHub Discussions

---

**You're ready to go! 🚀**

Start with simple tasks, gradually explore advanced features. The more you use it, the more efficient you'll become.
