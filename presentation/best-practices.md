# Best Practices & Tips

**Maximize productivity and safety with mahiro-lab**

---

## Safety First

### ✅ Environment Setup
- **Always use isolated dev environments**
- Never run on production systems
- Use VM or Docker containers when possible
- Keep sensitive data out of scope

### ✅ Before Every Command
- [ ] Check you're in correct directory
- [ ] Review what the command will do
- [ ] Have git backup (commit or stash)
- [ ] Verify no secrets in scope

### ✅ After Every Command
- [ ] Review diffs: `git diff`
- [ ] Check exit codes
- [ ] Run tests
- [ ] Commit with descriptive message

---

## Choosing Reasoning Levels

### Decision Tree

**Is it trivial? (list files, count lines)**
→ Use `minimal` (5-10s)

**Is it simple? (fix warnings, basic edits)**
→ Use `low` (10-15s)

**Is it moderate? (research, medium refactor)**
→ Use `medium` (15-25s)

**Is it complex? (large refactor, deep analysis)**
→ Use `high` (30-60s+)

### Cost vs Quality Trade-off

| Level | Speed | Quality | Cost | Best For |
|-------|-------|---------|------|----------|
| minimal | ⚡⚡⚡ | ⭐⭐ | $ | Simple queries |
| low | ⚡⚡ | ⭐⭐⭐ | $$ | Most tasks |
| medium | ⚡ | ⭐⭐⭐⭐ | $$$ | Research, refactoring |
| high | 🐌 | ⭐⭐⭐⭐⭐ | $$$$ | Critical work |

**💡 Tip:** Start low, re-run with higher level if unsatisfied

---

## Workflow Patterns

### Pattern 1: Quick Fix
```bash
./codex-exec.sh low "task"
# Review output immediately
git diff && git commit
```
**Time:** < 2 minutes

### Pattern 2: Research-Driven
```bash
./codex-research.sh "topic"
# Read report
cat .mahirolab/research/*.md
# Implement based on findings
./codex-exec.sh medium "implement X"
```
**Time:** 10-20 minutes

### Pattern 3: Background Worker
```bash
./codex-worker-launcher.sh high "large task"
# Continue other work
# Check periodically
./codex-status.sh
# Review when done
```
**Time:** 30-60 minutes

### Pattern 4: Parallel Execution
```bash
./codex-worker-launcher.sh "task 1" &
./codex-worker-launcher.sh "task 2" &
./codex-worker-launcher.sh "task 3" &
wait
# Review all results
```
**Time:** Depends on longest task

---

## State Management

### Session Continuity

**Start of day:**
```
ccc  # Create/refresh context
lll  # Check status
```

**During work:**
```
nnn     # Create plan
gogogo  # Execute
lll     # Check progress
```

**End of day:**
```
rrr  # Create retrospective
```

### Context Versioning

- Every `ccc` creates new version
- Choose "Continue" to merge with previous session
- Choose "Fresh" to start clean
- All versions preserved in `context_history/`

**💡 Tip:** Use "Continue" for ongoing projects, "Fresh" for new topics

---

## Monitoring & Debugging

### Check Job Status
```bash
# All jobs
./codex-status.sh --all

# Just workers
./codex-status.sh --workers

# Just research
./codex-status.sh --research

# Statistics
./codex-status.sh --stats
```

### Debug Failed Jobs

**Step 1:** Find the output file
```bash
ls -lt .mahirolab/workers/ | head
```

**Step 2:** Read the report
```bash
cat .mahirolab/workers/20251022_*.md
```

**Step 3:** Check execution log
```bash
tail -50 .mahirolab/state/execution_log.md
```

**Step 4:** Verify exit code (in report)

---

## Maintenance

### Regular Cleanup

**Weekly:**
```bash
# Dry run first
./codex-cleanup.sh --dry-run

# Delete files older than 7 days
./codex-cleanup.sh --age 7

# Compress aging files
./codex-cleanup.sh --compress-only
```

### Storage Management

**Check usage:**
```bash
./codex-status.sh --stats
```

**Archive old sessions:**
```bash
# Manually move to archive
mv .mahirolab/state/context_history/old_* .mahirolab/state/archive/
```

---

## Performance Tips

### Optimize Execution Time

**DO:**
- ✅ Use appropriate reasoning level
- ✅ Be specific in prompts
- ✅ Break large tasks into smaller ones
- ✅ Use background workers for long tasks

**DON'T:**
- ❌ Use `high` reasoning for simple tasks
- ❌ Give vague prompts
- ❌ Try to do everything in one command
- ❌ Wait watching long-running jobs

### Batch Operations

**Instead of:**
```bash
./codex-exec.sh low "fix file1"
./codex-exec.sh low "fix file2"
./codex-exec.sh low "fix file3"
```

**Do:**
```bash
./codex-exec.sh low "fix file1, file2, and file3"
```

---

## Team Collaboration

### Share Templates

Create team-specific templates:
```
.mahirolab/templates/
├── team-code-review.md
├── team-bug-report.md
└── team-feature-spec.md
```

### Standardize Patterns

Document common use cases:
```
docs/team-patterns/
├── onboarding-tasks.md
├── release-checklist.md
└── incident-response.md
```

### Code Review Integration

```bash
# Review PR before approval
./codex-exec.sh medium "Review PR #123 for code quality and security"

# Generate review comments
cat .mahirolab/output/*.md >> pr-review.md
```

---

## Common Pitfalls

### ❌ Pitfall 1: Not Reviewing Diffs

**Problem:** Blindly committing AI-generated changes

**Solution:**
```bash
# Always review first
git diff
# If looks good, then commit
git add . && git commit -m "message"
```

### ❌ Pitfall 2: Wrong Reasoning Level

**Problem:** Using `high` for everything (slow + expensive)

**Solution:** Start with `low`, increase only if needed

### ❌ Pitfall 3: Vague Prompts

**Bad:** "fix the code"
**Good:** "fix ESLint warnings in src/components/"

### ❌ Pitfall 4: Ignoring Exit Codes

**Problem:** Assuming success without checking

**Solution:** Check report for exit code and errors

### ❌ Pitfall 5: No Backups

**Problem:** AI makes unwanted changes, no way back

**Solution:** Always commit or stash before running commands

---

## Advanced Techniques

### Custom Script Wrappers

Create project-specific helpers:
```bash
#!/bin/bash
# scripts/quick-review.sh
./mahirolab/bin/codex-exec.sh medium "Review latest commit for issues"
```

### Template Customization

Edit templates to match team standards:
```bash
# Customize research template
vim .mahirolab/templates/research-report.md
```

### Integration with CI/CD

```yaml
# .github/workflows/ai-analysis.yml
- name: AI Code Analysis
  run: |
    ./mahirolab/bin/codex-exec.sh medium "Analyze PR for quality issues"
```

---

## Pro Tips

**💡 Tip 1:** Use descriptive task names
- Good: "Refactor Button components to use design tokens"
- Bad: "fix buttons"

**💡 Tip 2:** Check status while multitasking
```bash
watch -n 30 './codex-status.sh --workers'
```

**💡 Tip 3:** Create aliases for common commands
```bash
alias cexec='.mahirolab/bin/codex-exec.sh'
alias cresearch='.mahirolab/bin/codex-research.sh'
alias cworker='.mahirolab/bin/codex-worker-launcher.sh'
```

**💡 Tip 4:** Keep execution log for retrospectives
```bash
# Review what worked well
grep "✅" .mahirolab/state/execution_log.md
```

**💡 Tip 5:** Use dry-run mode when learning
```bash
./codex-exec.sh --dry-run low "task"
```

---

## Troubleshooting Guide

| Problem | Solution |
|---------|----------|
| Command not found | Use full path or `chmod +x` |
| Permission denied | Check script permissions |
| Job output missing | Check for TEMP files (still writing) |
| Slow execution | Lower reasoning level |
| Poor quality output | Increase reasoning level |
| Network errors | Check internet for research tasks |
| Git conflicts | Review diffs before committing |

---

**Remember:** mahiro-lab is a power tool. Use it wisely, review outputs, and maintain good development practices!
