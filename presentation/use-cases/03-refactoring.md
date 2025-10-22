# Use Case #3: Large-Scale Refactoring

**Category:** Architecture & Design
**Complexity:** ⭐⭐⭐ High
**Time Savings:** 4 hours → 30 minutes (87% reduction)
**Target Audience:** 🔧 Developers

---

## The Scenario

Your design team has shipped a new design system. You need to refactor 45 Button components across your React codebase to use the new design system API:

**Old API:**
```jsx
<Button variant="primary" size="large" onClick={handleClick}>
  Submit
</Button>
```

**New API:**
```jsx
<Button intent="primary" scale="lg" onPress={handleClick}>
  Submit
</Button>
```

Changes required:
- `variant` → `intent`
- `size` → `scale` (with value mapping: large→lg, medium→md, small→sm)
- `onClick` → `onPress`
- Import path changes
- Update corresponding TypeScript types

---

## BEFORE: Manual Approach

### Steps:

1. **Find all Button usages**
   ```bash
   grep -r "<Button" src/
   ```
   Output: 45 files with Button components

2. **Create refactoring plan**
   - List all files to modify
   - Document prop changes
   - Note edge cases (conditional props, spread operators)
   - Plan testing approach

3. **Manual refactoring** (file by file)
   - Open file #1
   - Find Button usage
   - Update props carefully:
     - Change `variant` to `intent`
     - Map size values (large→lg, etc.)
     - Change `onClick` to `onPress`
   - Update import if needed
   - Check TypeScript errors
   - Repeat for next Button in file
   - Save and move to next file

4. **Handle edge cases**
   - Buttons with spread props
   - Conditional variants
   - Custom button compositions
   - Test files that mock Button

5. **Testing**
   - Run TypeScript compiler
   - Fix type errors
   - Run tests
   - Manual visual verification
   - Fix regressions

6. **Code review prep**
   - Review changes
   - Ensure consistency
   - Write PR description

### Time Breakdown:
- Discovery & planning: 30 minutes
- Manual refactoring: 2.5 hours (3-4 min per file × 45 files)
- Edge cases: 30 minutes
- Testing & fixes: 45 minutes
- Review & cleanup: 15 minutes
- **Total: 4-5 hours**

### Pain Points:
- ❌ Extremely tedious and error-prone
- ❌ High cognitive load maintaining consistency
- ❌ Easy to miss instances
- ❌ Risk of introducing bugs
- ❌ Context switching fatigue
- ❌ Hard to maintain focus for hours

---

## WITH mahiro-lab: Automated Refactoring

### Command:
```bash
./codex-worker-launcher.sh high "Refactor all Button components to use new design system API: variant→intent, size→scale (large→lg, medium→md, small→sm), onClick→onPress. Update imports and types."
```

### What Happens:

1. **Background worker launched**
   - Runs with `high` reasoning (deep analysis)
   - Won't block your terminal
   - Progress tracked in real-time

2. **AI analysis phase** (2-3 min)
   - Scans codebase for all Button usages
   - Understands current API patterns
   - Identifies edge cases automatically
   - Plans refactoring approach

3. **Execution phase** (15-20 min)
   - Applies changes systematically
   - Handles edge cases intelligently
   - Updates TypeScript types
   - Ensures consistency

4. **Verification phase** (5 min)
   - Runs type checks
   - Validates changes
   - Creates summary report

### Output Example:
```
🚀 Starting worker job...
   Job ID: bash_12346
   Reasoning: high
   Task: Refactor Button components
   Output: .mahirolab/workers/20251022_143000_TEMP_codex_task.md

✅ Job running in background
   Use "check worker status" to monitor progress
```

### Monitoring Progress:
```bash
# While working on other tasks, periodically check:
$ Check worker status

🔄 Worker in progress...
   Started: 8 minutes ago
   Status: Applying changes to components/forms/
   Processed: 32/45 files
   Progress: [██████████████░░░░░░] 71%
   ETA: 4 minutes remaining
```

### Final Report:
```markdown
# Worker Task Report

**Task:** Button component refactoring
**Started:** 2025-10-22 14:30:00
**Completed:** 2025-10-22 14:52:15
**Duration:** 22 minutes

---

## Summary

✅ Successfully refactored 45 Button components across codebase
✅ Updated all prop mappings (variant→intent, size→scale, onClick→onPress)
✅ Migrated size values (large→lg, medium→md, small→sm)
✅ Updated TypeScript types and imports
✅ All type checks passing

---

## Changes Applied

### Files Modified: 45

**Components:**
- src/components/forms/LoginForm.tsx (3 buttons)
- src/components/forms/SignupForm.tsx (2 buttons)
- src/components/modals/ConfirmDialog.tsx (2 buttons)
... (42 more files)

**Total Button instances updated:** 78

---

## Prop Changes

| Old Prop | New Prop | Instances |
|----------|----------|-----------|
| variant  | intent   | 78 |
| size     | scale    | 65 |
| onClick  | onPress  | 78 |

### Size Value Mappings:
- large → lg (23 instances)
- medium → md (31 instances)
- small → sm (11 instances)

---

## Edge Cases Handled

1. **Spread props:** Preserved in 8 instances
   ```jsx
   <Button {...commonProps} intent="primary" />
   ```

2. **Conditional variants:** Updated in 6 instances
   ```jsx
   <Button intent={isPrimary ? "primary" : "secondary"} />
   ```

3. **Custom compositions:** Refactored 3 instances
   ```jsx
   const SubmitButton = (props) => (
     <Button intent="primary" scale="lg" {...props} />
   )
   ```

---

## TypeScript Updates

- Updated `ButtonProps` interface
- Fixed 12 type errors in test files
- Updated type imports in 8 files

---

## Verification

✅ TypeScript compilation: PASSED
✅ ESLint: PASSED
✅ Consistent prop usage: VERIFIED
✅ No breaking changes to public API: VERIFIED

---

## Git Status

Modified files: 45
Lines changed: +234 -234 (net: 0)
Ready for review and commit

---

## Recommendations

1. ✅ Review diff with `git diff src/components/`
2. ✅ Run full test suite
3. ✅ Visual QA in Storybook/dev environment
4. ✅ Create PR with changes
5. Consider updating Button documentation

---

**Success:** Refactoring complete and verified ✅
```

### Time Breakdown:
- Run command: 10 seconds
- Background processing: 22 minutes
- Review report & diff: 5-8 minutes
- **Total: 27-30 minutes**
- **Plus: You can do other work during the 22 minutes!**

### Benefits:
- ✅ Comprehensive and consistent
- ✅ Handles edge cases automatically
- ✅ Non-blocking (work on other tasks)
- ✅ Detailed report of changes
- ✅ Type-safe refactoring
- ✅ Much lower error rate

---

## Metrics Comparison

| Metric | Manual | With mahiro-lab | Improvement |
|--------|--------|-----------------|-------------|
| **Active time** | 4-5 hrs | 30 min | **87% faster** |
| **Your attention** | Continuous | Occasional checks | **90% freed up** |
| **Files modified** | 45 | 45 | Same coverage |
| **Consistency** | Variable | 100% | **Perfect** |
| **Edge cases missed** | 2-3 likely | 0 | **More reliable** |
| **Stress level** | High | Low | **Better experience** |

---

## Real-World Impact

### Individual Developer:
- **Large refactors per quarter:** 2-3
- **Time saved per refactor:** 3.5 hours
- **Quarterly savings:** 10-11 hours
- **Annual savings:** 40-45 hours
- **Benefit:** Can take on more ambitious refactoring

### Engineering Team (10 people):
- **Annual collective savings:** 400-450 hours
- **Improved code quality:** More frequent refactoring
- **Reduced technical debt:** Lower barrier to improvements
- **Better morale:** Less tedious work

### Business Value:
- **Faster design system adoption**
- **Reduced refactoring risk**
- **More frequent code quality improvements**
- **Developers focus on architecture, not mechanics**

---

## Variations

### Other Refactoring Examples:

**1. API migration:**
```bash
./codex-worker-launcher.sh high "Migrate from Axios to fetch API across all API client files"
```

**2. State management update:**
```bash
./codex-worker-launcher.sh high "Convert all Redux containers to use Redux Toolkit createSlice"
```

**3. Import path updates:**
```bash
./codex-worker-launcher.sh medium "Update all relative imports to use TypeScript path aliases (@/components)"
```

**4. Rename across codebase:**
```bash
./codex-worker-launcher.sh medium "Rename all instances of 'getUserData' to 'fetchUserProfile' including tests and types"
```

**5. Deprecation removal:**
```bash
./codex-worker-launcher.sh high "Remove all usage of deprecated componentWillMount lifecycle, replace with useEffect"
```

---

## Demo Script

**For Presentation (4-5 minutes):**

1. **Set the scene** (45 sec)
   - "New design system: 45 files to update"
   - "Normally 4-5 hours of tedious work"
   - "High risk of inconsistency and mistakes"

2. **Show the scope** (30 sec)
   - Quick `grep -r "<Button"` to show number of files
   - "This is what I'm facing"

3. **Launch the worker** (15 sec)
   ```bash
   ./codex-worker-launcher.sh high "Refactor Button components..."
   ```

4. **Explain background processing** (60 sec)
   - "It's running in the background with high reasoning"
   - "I can check status anytime"
   - "Meanwhile, I can work on something else"

5. **Check status** (30 sec)
   ```bash
   Check worker status
   ```
   - Show progress bar
   - Show ETA

6. **Show final report** (90 sec)
   - Open the generated report
   - Highlight: 45 files, 78 instances, edge cases handled
   - Show verification passed
   - Quick `git diff` to show changes

7. **Emphasize value** (30 sec)
   - "4 hours → 30 minutes"
   - "Perfect consistency"
   - "I could do other work while it ran"
   - "This is game-changing for refactoring"

---

## Talking Points

**For Developers:**
- "Makes ambitious refactoring feasible"
- "Perfect consistency across large codebases"
- "You review the strategy, AI handles the mechanics"
- "Non-blocking: use your time better"

**For Tech Leads:**
- "Reduce technical debt faster"
- "Design system migrations become practical"
- "Lower risk, higher consistency"

**For Managers:**
- "87% time savings on refactoring tasks"
- "Enables more frequent code quality improvements"
- "Reduces refactoring as a blocker to innovation"

---

## Advanced Features Shown

**Progress Tracking:**
- Real-time progress bars
- ETA calculation
- Status monitoring

**Background Execution:**
- Non-blocking workflow
- Can work on other tasks
- Check-in when convenient

**High Reasoning:**
- Deep code analysis
- Edge case detection
- Type-aware refactoring

**Comprehensive Reporting:**
- Detailed change summary
- Verification status
- Recommendations

---

**Demo Priority:** ⭐⭐⭐⭐⭐ HIGHEST - Shows power of background workers, impressive time savings, technical depth
