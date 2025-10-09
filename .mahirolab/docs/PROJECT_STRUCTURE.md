# Project Structure

Complete overview of the Codex Orchestrator/Worker Architecture

---

## 📁 Directory Layout

```
my-ai/
├── 📜 Core Scripts (3)
│   ├── codex-exec.sh              # Direct synchronous execution
│   ├── codex-research.sh          # Web-enabled research
│   └── codex-worker-launcher.sh   # Background workers with PID tracking
│
├── 🛠️ Utility Scripts (2)
│   ├── codex-status.sh            # Job monitoring dashboard
│   └── codex-cleanup.sh           # Automated cleanup & maintenance
│
├── 📖 Documentation
│   ├── CLAUDE.md                  # Main architecture documentation
│   ├── docs/
│   │   ├── SHORTCODES.md          # Communication protocol
│   │   └── PROJECT_STRUCTURE.md   # This file
│   └── .gitignore                 # Git ignore rules
│
├── 📚 Examples
│   └── examples/
│       ├── 01-quick-task.sh       # Basic synchronous execution
│       ├── 02-research-workflow.sh # Web-enabled research
│       ├── 03-parallel-workers.sh # Concurrent background tasks
│       ├── 04-mixed-reasoning-levels.sh # Reasoning strategy guide
│       ├── 05-sequential-pipeline.sh # Chained dependent tasks
│       └── README.md              # Examples documentation
│
├── 📄 Templates
│   └── templates/
│       ├── research-report.md     # Structured research output
│       ├── worker-task.md         # Background task reports
│       ├── code-review.md         # Comprehensive code reviews
│       └── README.md              # Templates documentation
│
└── 💾 Runtime Data (Generated)
    └── .mahirolab/
        ├── workers/               # Worker job outputs (auto-created)
        ├── research/              # Research reports (auto-created)
        └── state/                 # Communication protocol state
            ├── context.md         # Session context (ccc)
            ├── plan_*.md          # Implementation plans (nnn)
            ├── progress.md        # Execution progress (gogogo)
            └── retrospective_*.md # Session retrospectives (rrr)
```

---

## 📜 Core Scripts

### `codex-exec.sh` - Direct Execution
**Purpose:** Quick, synchronous task execution with real-time output

**Key Features:**
- Default `low` reasoning level
- `--dry-run` mode for preview
- `--help` with examples
- Streams output to console
- No file saving

**Usage:**
```bash
./codex-exec.sh "List TypeScript files"
./codex-exec.sh high "Refactor auth system"
./codex-exec.sh --dry-run "Dangerous operation"
```

**When to Use:**
- Quick fixes
- Simple edits
- Real-time monitoring needed
- Interactive tasks

---

### `codex-research.sh` - Research Engine
**Purpose:** Web-enabled research with structured markdown reports

**Key Features:**
- Fixed `medium` reasoning level
- Web search enabled
- Structured report template
- Direct URL citations (no markdown titles)
- Saved to `.mahirolab/research/`

**Usage:**
```bash
./codex-research.sh "Next.js 15 features"
./codex-research.sh "PostgreSQL vs MySQL 2024"
```

**When to Use:**
- Technology research
- Feature comparisons
- Documentation discovery
- Trend analysis

---

### `codex-worker-launcher.sh` - Background Workers
**Purpose:** Long-running tasks with PID tracking and persistent logs

**Key Features:**
- Configurable reasoning level
- Background execution
- Bash PID tracking in filename
- Saved to `.mahirolab/workers/` or custom dir
- Non-blocking execution

**Usage:**
```bash
./codex-worker-launcher.sh "Analyze codebase"
./codex-worker-launcher.sh high "Deep refactoring"
./codex-worker-launcher.sh medium workers "Custom task"
```

**When to Use:**
- Long-running analysis
- Parallel execution needed
- Large refactoring
- Multiple independent tasks

---

## 🛠️ Utility Scripts

### `codex-status.sh` - Job Dashboard
**Purpose:** Monitor all Codex jobs and view statistics

**Key Features:**
- List all jobs (workers, research)
- Filter by type
- Show statistics (file count, disk usage)
- Display job age and size
- Sort by modification time

**Usage:**
```bash
./codex-status.sh              # Recent jobs
./codex-status.sh --stats      # Statistics
./codex-status.sh --workers    # Workers only
./codex-status.sh --latest 20  # Last 20 jobs
```

**When to Use:**
- Check job progress
- View completed tasks
- Monitor disk usage
- Debug job issues

---

### `codex-cleanup.sh` - Maintenance Utility
**Purpose:** Automated cleanup and storage management

**Key Features:**
- Delete old files (default: 7+ days)
- Compress aging files (3+ days)
- Storage statistics
- Dry-run mode
- Force mode (skip confirmation)

**Usage:**
```bash
./codex-cleanup.sh --dry-run   # Preview cleanup
./codex-cleanup.sh --stats     # Show disk usage
./codex-cleanup.sh --age 14    # Delete 14+ days old
./codex-cleanup.sh --force     # No confirmation
```

**When to Use:**
- Regular maintenance
- Low disk space
- Archive old reports
- Clean up experiments

---

## 📚 Examples Library

Pre-built workflow examples in `examples/`:

| Example | Description | Runtime |
|---------|-------------|---------|
| **01-quick-task.sh** | Basic synchronous execution | < 1 min |
| **02-research-workflow.sh** | Multiple research tasks | 3-5 min |
| **03-parallel-workers.sh** | Concurrent background jobs | Varies |
| **04-mixed-reasoning-levels.sh** | Reasoning strategy demo | 2-3 min |
| **05-sequential-pipeline.sh** | Chained dependent tasks | 5-10 min |

All examples are:
- ✅ Executable bash scripts
- ✅ Well-documented
- ✅ Include tips & best practices
- ✅ Self-contained

---

## 📄 Templates Library

Markdown templates for consistent outputs in `templates/` (**reference-only, manual use**):

### `research-report.md`
- Executive Summary
- Key Findings
- Technical Specifications
- References (direct URLs)
- Recommendations

### `worker-task.md`
- Task Summary
- Execution Details
- Files Modified/Created
- Code Changes
- Testing Results
- Next Steps

### `code-review.md`
- Overview & Rating
- Critical/Moderate/Minor Issues
- Code Quality Metrics
- Security Analysis
- Performance Analysis
- Action Items

**Note:** Templates are not automatically integrated. Reference them manually in prompts or copy their structure as needed.

---

## 💬 Communication Protocol

### Shortcodes (defined in `docs/SHORTCODES.md`)

Quick commands for User ↔ Claude collaboration:

- **`ccc`** - Create context & compact conversation
- **`nnn`** - Smart planning (auto-runs ccc if needed)
- **`gogogo`** - Execute most recent plan
- **`rrr`** - Create session retrospective
- **`lll`** - List project status

### State Files (`.mahirolab/state/`)

| File | Created By | Purpose |
|------|------------|---------|
| `context.md` | ccc | Current session context |
| `plan_YYYYMMDD_HHMMSS.md` | nnn | Implementation plans |
| `progress.md` | gogogo | Execution progress |
| `execution_log.md` | gogogo | Detailed execution log |
| `retrospective_YYYYMMDD.md` | rrr | Session retrospectives |

---

## 🎯 Typical Workflows

### Workflow 1: Quick Fix
```bash
./codex-exec.sh "Fix bug in auth.ts line 42"
```

### Workflow 2: Research → Implement
```bash
# Step 1: Research
./codex-research.sh "Next.js Server Actions"

# Step 2: Implement
./codex-exec.sh high "Implement Server Actions based on research"
```

### Workflow 3: Parallel Analysis
```bash
# Launch 3 workers in parallel
./codex-worker-launcher.sh "Analyze src/auth/" &
./codex-worker-launcher.sh "Analyze src/api/" &
./codex-worker-launcher.sh "Analyze src/utils/" &

# Wait for completion
wait

# Check results
./codex-status.sh --workers
```

### Workflow 4: Using Shortcodes (Recommended)
```bash
# Session start
User: lll                    # Check status
User: ccc                    # Create context
User: nnn                    # Create plan
User: gogogo                 # Execute plan
User: rrr                    # Retrospective
```

---

## 🎨 Reasoning Levels Guide

| Level | Time | Best For | Example Use Cases |
|-------|------|----------|-------------------|
| **minimal** | 5-10s | Trivial tasks | File listing, simple searches |
| **low** | 10-15s | Simple edits | Add comments, simple refactors |
| **medium** | 15-25s | Moderate tasks | API design, moderate analysis |
| **high** | 30-60s+ | Complex analysis | Architecture review, deep refactoring |

**Rule of thumb:**
- Start with `low` for unknown tasks
- Use `minimal` for batch operations
- Reserve `high` for critical thinking

---

## 📊 File Naming Conventions

### Research Reports
```
.mahirolab/research/YYYYMMDD_HHMMSS_PLACEHOLDER_codex_topic_name.md
                    └─timestamp─┘ └─PID─┘        └─sanitized topic─┘
```

### Worker Tasks
```
.mahirolab/workers/YYYYMMDD_HHMMSS_12345_codex_task.md
                   └─timestamp─┘ └─PID┘
```

### State Files
```
.mahirolab/state/plan_YYYYMMDD_HHMMSS.md
.mahirolab/state/retrospective_YYYYMMDD.md
```

---

## 🔧 Maintenance

### Regular Tasks
- **Daily:** Check `./codex-status.sh --stats`
- **Weekly:** Run `./codex-cleanup.sh --dry-run`
- **Monthly:** Archive old reports, review retrospectives

### Disk Space Management
```bash
# Check usage
./codex-status.sh --stats

# Preview cleanup
./codex-cleanup.sh --dry-run

# Clean up old files
./codex-cleanup.sh --age 30
```

### Backup Important Reports
```bash
# Backup research
tar -czf research_backup_$(date +%Y%m%d).tar.gz .mahirolab/research/

# Backup state
tar -czf state_backup_$(date +%Y%m%d).tar.gz .mahirolab/state/
```

---

## 🚀 Getting Started

### 1. Quick Test
```bash
# Test all core scripts
./codex-exec.sh --version
./codex-research.sh --help
./codex-worker-launcher.sh --help
```

### 2. Run First Example
```bash
./examples/01-quick-task.sh
```

### 3. Start Using Shortcodes
```bash
# In your conversation with Claude
User: lll    # See current status
User: ccc    # Start session with context
```

### 4. Read Documentation
- Main: `CLAUDE.md`
- Protocol: `docs/SHORTCODES.md`
- This file: `docs/PROJECT_STRUCTURE.md`

---

## 📖 Additional Resources

- [CLAUDE.md](../CLAUDE.md) - Main architecture documentation
- [docs/SHORTCODES.md](SHORTCODES.md) - Communication protocol
- [examples/README.md](examples/README.md) - Examples guide
- [templates/README.md](templates/README.md) - Templates guide

---

*Last Updated: 2025-01-03 | Version: 1.0.0*
