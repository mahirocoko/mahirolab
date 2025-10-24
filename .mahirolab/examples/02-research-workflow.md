# Example 02: Research Workflow

This example demonstrates using `codex-research.sh` for web-enabled research with structured report generation.

## Overview

The `codex-research.sh` script is specialized for:
- ✅ Web search enabled by default
- ✅ Structured markdown report output
- ✅ Template-based formatting
- ✅ Medium reasoning for balanced depth
- ✅ Citation management with plain URLs

## Basic Usage

### Single Research Task

```bash
./.mahirolab/bin/codex-research.sh "Next.js 15 new features and breaking changes"
```

**What happens:**
1. Topic sanitized to filename slug
2. Timestamp prepended to output file
3. Template loaded from `.mahirolab/templates/research-report.md`
4. Web search automatically enabled
5. Medium reasoning applied (15-25s)
6. Report saved to `.mahirolab/research/YYYYMMDD_HHMMSS_PLACEHOLDER_codex_next_js_15_new_features.md`

**Expected output:**
- Executive Summary (2-3 sentences)
- Key Findings (4+ bullet points)
- Detailed Analysis sections
- Comparison tables
- Best Practices
- References with direct URLs only
- Recommendations

## Example Workflows

### Workflow 1: Technology Research

```bash
./.mahirolab/bin/codex-research.sh "Next.js 15 new features and breaking changes"
```

**Output structure:**
```markdown
# Research Report: Next.js 15 new features and breaking changes

**Date:** 2025-10-24
**Researcher:** Codex AI
**Reasoning Level:** medium

## Executive Summary
[Brief overview of Next.js 15 changes]

## Key Findings
- React 19 support
- Turbopack stable
- Breaking changes in App Router
- Performance improvements

## Detailed Analysis
[Technical deep dive]

## References & Sources
- https://nextjs.org/blog/next-15
- https://github.com/vercel/next.js/releases
```

### Workflow 2: Multiple Research Topics

```bash
# Research multiple related topics
./.mahirolab/bin/codex-research.sh "Docker BuildKit cache optimization"
./.mahirolab/bin/codex-research.sh "PostgreSQL 16 performance improvements"
./.mahirolab/bin/codex-research.sh "Rust async runtime comparison"
```

**Use case:**
- Comparative analysis
- Technology stack evaluation
- Best practices compilation

### Workflow 3: Sequential Pipeline

```bash
# Step 1: Research best practices
./.mahirolab/bin/codex-research.sh "React Server Components best practices 2025"

# Step 2: Use research for implementation
./.mahirolab/bin/codex-exec.sh medium "Design blog architecture based on React Server Components research"
```

## Features

### Automatic Template Injection

Template from `.mahirolab/templates/research-report.md` is automatically loaded with variable substitution:

| Variable | Replaced With | Example |
|----------|--------------|---------|
| `{{TOPIC}}` | Research topic | "Docker cache optimization" |
| `{{DATE}}` | Current date | "2025-10-24" |
| `{{REASONING_LEVEL}}` | Always "medium" | "medium" |

### Fixed Configuration

| Setting | Value | Reason |
|---------|-------|--------|
| Reasoning Level | `medium` | Balance between speed and depth |
| Web Search | `enabled` | Access to latest information |
| Safety Mode | `danger-full-access` | Full system access |

### Output Format

All research reports follow consistent structure:

1. **Executive Summary** - High-level overview
2. **Key Findings** - 4+ main discoveries
3. **Detailed Analysis** - Technical deep dive
4. **Comparison & Alternatives** - Tables and matrices
5. **Best Practices** - Actionable recommendations
6. **Common Pitfalls** - What to avoid
7. **References & Sources** - Direct URLs only (no markdown titles)
8. **Recommendations** - Short and long term
9. **Conclusion** - Summary and next steps

### Citation Requirements

⚠️ **IMPORTANT:** References must use direct URLs only

✅ **Correct:**
```markdown
## References & Sources
- https://docs.docker.com/build/cache/
- https://github.com/moby/buildkit
- https://www.postgresql.org/docs/16/
```

❌ **Incorrect:**
```markdown
## References & Sources
- [Docker Build Cache](https://docs.docker.com/build/cache/)
- [BuildKit GitHub](https://github.com/moby/buildkit)
```

## When to Use codex-research.sh

✅ **Use when:**
- Need latest information from web
- Want structured report with citations
- Research for documentation or decision-making
- Comparing technologies or approaches
- Building knowledge base

❌ **Don't use when:**
- Local codebase analysis only (use `codex-exec.sh`)
- Quick facts (use web search directly)
- No need for formatted report
- Time-sensitive (web search adds latency)

## Tips & Tricks

### 1. Specific Topics Get Better Results

```bash
# ❌ Too broad
./.mahirolab/bin/codex-research.sh "React"

# ✅ Specific and actionable
./.mahirolab/bin/codex-research.sh "React 19 concurrent rendering patterns and migration guide"
```

### 2. Include Year for Latest Info

```bash
./.mahirolab/bin/codex-research.sh "TypeScript best practices 2025"
./.mahirolab/bin/codex-research.sh "PostgreSQL vs MySQL comparison 2025"
```

### 3. Combine with Implementation

```bash
# Research first
./.mahirolab/bin/codex-research.sh "JWT authentication best practices 2025"

# Review the report
cat .mahirolab/research/*jwt_authentication*.md

# Implement based on findings
./.mahirolab/bin/codex-exec.sh high "Implement JWT auth following best practices from research"
```

### 4. Archive and Reference

```bash
# Create knowledge base
mkdir -p .mahirolab/research/archive/2025-q1/

# Move completed research
mv .mahirolab/research/20250124_*.md .mahirolab/research/archive/2025-q1/
```

## Common Use Cases

### Technology Evaluation

```bash
./.mahirolab/bin/codex-research.sh "GraphQL vs REST API 2025 comparison"
./.mahirolab/bin/codex-research.sh "Prisma vs TypeORM vs Drizzle comparison"
```

### Security Research

```bash
./.mahirolab/bin/codex-research.sh "OWASP top 10 2024 mitigation strategies"
./.mahirolab/bin/codex-research.sh "JWT token security best practices"
```

### Performance Optimization

```bash
./.mahirolab/bin/codex-research.sh "Next.js image optimization techniques"
./.mahirolab/bin/codex-research.sh "PostgreSQL query performance tuning guide"
```

### Migration Planning

```bash
./.mahirolab/bin/codex-research.sh "React 18 to 19 migration guide"
./.mahirolab/bin/codex-research.sh "Node 18 to 20 breaking changes"
```

## Monitoring and Output

### Check Progress

Research runs in foreground by default (blocking):

```bash
# Runs and waits for completion
./.mahirolab/bin/codex-research.sh "topic"

# For background execution
./.mahirolab/bin/codex-research.sh "topic" &
PID=$!

# Check if still running
ps -p $PID
```

### Find Output Files

```bash
# List all research reports
ls -lt .mahirolab/research/

# Search by topic
ls .mahirolab/research/*docker*.md

# Find today's research
ls .mahirolab/research/$(date +%Y%m%d)*.md
```

### Review Generated Reports

```bash
# Quick preview
head -50 .mahirolab/research/20251024_*.md

# Full review
less .mahirolab/research/20251024_150000_12345_codex_topic.md

# Search within reports
grep -r "Key Findings" .mahirolab/research/
```

## Troubleshooting

### Template Not Found

```
Warning: Template not found, using default structure
Solution: Create .mahirolab/templates/research-report.md
```

### Web Search Fails

```
Error: Web search unavailable
Solution: Check internet connection, verify codex web_search tool access
```

### Output Directory Missing

```
Error: .mahirolab/research/ does not exist
Solution: mkdir -p .mahirolab/research/
```

### Filename Too Long

```
Error: Filename exceeds system limits
Solution: Use shorter, more concise research topics
```

## Advanced Patterns

### Comparative Research Matrix

```bash
# Research multiple options
./.mahirolab/bin/codex-research.sh "PostgreSQL 16 features"
./.mahirolab/bin/codex-research.sh "MySQL 8.2 features"
./.mahirolab/bin/codex-research.sh "MongoDB 7 features"

# Create comparison document manually or with codex-exec
./.mahirolab/bin/codex-exec.sh high "Compare the three database research reports and create decision matrix"
```

### Research Pipeline

```bash
#!/bin/bash
# research-pipeline.sh

TOPIC_BASE="React Server Components"

# Phase 1: Broad research
./.mahirolab/bin/codex-research.sh "$TOPIC_BASE overview 2025"

# Phase 2: Deep dives
./.mahirolab/bin/codex-research.sh "$TOPIC_BASE caching strategies"
./.mahirolab/bin/codex-research.sh "$TOPIC_BASE data fetching patterns"
./.mahirolab/bin/codex-research.sh "$TOPIC_BASE performance optimization"

# Phase 3: Synthesis
./.mahirolab/bin/codex-exec.sh high "Synthesize all RSC research into comprehensive implementation guide"
```

## Summary

`codex-research.sh` is your research assistant for:
- Web-enabled information gathering
- Structured markdown reports
- Technology evaluation and comparison
- Best practices compilation
- Citation management

**Remember:**
- Always uses medium reasoning (15-25s)
- Web search automatically enabled
- Template-based consistent output
- Direct URLs only in references
- Output saved to `.mahirolab/research/`

---

**Next Steps:**
- Example 01: Quick task execution
- Example 03: Parallel workers
- Example 06: Shortcode integration (rrresearch)

---

*Example Version: 1.0.0 | Updated: 2025-10-24*
