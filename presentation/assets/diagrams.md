# Visual Diagrams for Presentation

**Purpose:** Architecture diagrams and visual aids
**Format:** ASCII art (embeddable in slides)

---

## System Architecture

```
┌──────────────────────────────────────────────┐
│           USER (Orchestrator)                │
│        (ccc, nnn, gogogo, rrr, lll)         │
└────────────────┬─────────────────────────────┘
                 │
    ┌────────────┴────────────┐
    │                         │
    ▼                         ▼
┌───────────────┐      ┌──────────────────┐
│ Claude Code   │◄────►│  State Manager   │
└───────┬───────┘      └──────────────────┘
        │
    ┌───┴────────────────────┐
    │                        │
    ▼                        ▼
┌──────────────┐    ┌─────────────────┐
│codex-exec.sh │    │codex-research.sh│
└──────────────┘    └─────────────────┘
         │
         ▼
┌────────────────────────┐
│codex-worker-launcher.sh│
└────────┬───────────────┘
         │
    ┌────┴─────┬────────┐
    ▼          ▼        ▼
┌────────┐ ┌────────┐ ┌────────┐
│Worker 1│ │Worker 2│ │Worker N│
└────────┘ └────────┘ └────────┘
```

---

## Time Savings Chart

```
Manual vs mahiro-lab

Quick Fixes:    ████████████ → ░  (10min → 30sec)
Research:       ██████████████████████████████ → ██░  (60min → 5min)
Refactoring:    ████████████████████████████████████████████ → ███████░  (240min → 30min)

Average Savings: 83%
```

---

## Workflow Patterns

```
SYNCHRONOUS              BACKGROUND              RESEARCH
┌──────┐                ┌──────┐                ┌──────┐
│ User │───► Result     │ User │                │ User │
└──────┘    (< 2min)    └───┬──┘                └──────┘
                            │                        │
                        ┌───▼────┐              ┌───▼────┐
                        │ Worker │              │Research│
                        └────────┘              │+ Web   │
                                                └────────┘
```

**All diagrams ready for slides**
