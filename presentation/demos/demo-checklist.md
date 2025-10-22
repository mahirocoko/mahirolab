# Demo Environment Checklist

## Pre-Presentation Setup (1 hour before)

### Terminal Setup
- [ ] Clean terminal (clear history)
- [ ] Font size: 18pt minimum
- [ ] Theme: High contrast (dark recommended)
- [ ] Simple prompt: `export PS1='$ '`
- [ ] Test terminal visibility from back of room

### Environment Verification
- [ ] Navigate to project directory
- [ ] Scripts are executable: `ls -la .mahirolab/bin/`
- [ ] Internet connection working: `ping anthropic.com`
- [ ] Claude Code accessible
- [ ] Git status clean or known state

### Backup Materials
- [ ] Screenshots of expected outputs ready
- [ ] Fallback commands prepared
- [ ] PDF slides exported (in case live demos fail)

### Test Run
- [ ] Run each demo command once
- [ ] Verify outputs match expectations
- [ ] Time each demo
- [ ] Clear outputs for fresh presentation

---

## Demo Scenarios

### Scenario 1: Quick Fix (Ready to show)
**File:** `src/demo-component.tsx`
**Issue:** Has TODO comments and console.logs
**Command:** `./codex-exec.sh low "Find all TODO and console.log in src/"`

### Scenario 2: Research (Ready to show)
**Topic:** "React 19 Server Components best practices"
**Command:** `./codex-research.sh "React 19 Server Components"`
**Expected time:** 4-5 minutes

### Scenario 3: Shortcode Workflow (In Claude UI)
**Commands:** `ccc` → `nnn` → `gogogo`
**Task:** "Analyze mahiro-lab directory structure"

---

## Fallback Plan

If live demo fails, have these ready:
1. Pre-recorded terminal session (asciinema)
2. Screenshots of key outputs
3. Backup simpler command to try
4. Move forward confidently with slides

**Demo Priority:** Must show #1 and #2, #3 is optional
