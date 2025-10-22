# Use Case #1: Quick Code Fixes

**Category:** Maintenance
**Complexity:** ⭐ Low
**Time Savings:** 5-10 minutes → 30 seconds (90-95% reduction)
**Target Audience:** 🌍 Everyone

---

## The Scenario

You've just run ESLint on your React project and discovered 23 warnings across 8 component files. Most are simple issues like:
- Unused imports
- Missing PropTypes
- Console.log statements left in code
- Inconsistent quote styles

---

## BEFORE: Manual Approach

### Steps:
1. **Run linter** to get list of errors
   ```bash
   npm run lint
   ```
   Output: Long list of warnings

2. **Open each file individually**
   - Navigate to first file
   - Find the line with the issue
   - Make the fix
   - Save

3. **Repeat** for all 23 warnings across 8 files
   - Lost in file switching
   - Easy to miss some warnings
   - Context switching overhead

4. **Re-run linter** to verify
   ```bash
   npm run lint
   ```

5. **Stage and commit** changes
   ```bash
   git add src/components/
   git commit -m "Fix ESLint warnings"
   ```

### Time Breakdown:
- Initial lint: 10 seconds
- Opening files + finding issues: 3 minutes
- Making fixes: 5 minutes
- Verification: 10 seconds
- Git operations: 30 seconds
- **Total: 8-10 minutes**

### Pain Points:
- ❌ Tedious and repetitive
- ❌ Easy to miss some warnings
- ❌ Context switching between files
- ❌ Mental overhead for trivial fixes
- ❌ Risk of introducing typos

---

## WITH mahiro-lab: AI-Assisted Approach

### Command:
```bash
./codex-exec.sh low "Fix all ESLint warnings in src/components/"
```

### What Happens:
1. **Codex analyzes** the linting errors
2. **Applies fixes** across all affected files
3. **Shows diff** for your review
4. **Waits** for your approval before committing

### Output Example:
```
🔍 Running ESLint analysis...
✅ Found 23 warnings in 8 files

🔧 Applying fixes:
  src/components/Header.jsx
    - Removed unused import 'useState'
    - Removed console.log statement
    - Fixed quote style (3 instances)

  src/components/Button.jsx
    - Added missing PropTypes
    - Removed unused variable 'temp'

  ... (6 more files)

✅ All fixes applied
📊 Files modified: 8
📝 Changes ready for review

Would you like to review the diff? (y/n)
```

### Review Diff:
```diff
--- src/components/Header.jsx
+++ src/components/Header.jsx
@@ -1,5 +1,4 @@
 import React from 'react';
-import { useState } from 'react';
 import './Header.css';

 export function Header({ title }) {
-  console.log('Rendering header');
-  return <h1 className='header'>{title}</h1>;
+  return <h1 className="header">{title}</h1>;
 }
```

### Time Breakdown:
- Run command: 5 seconds
- AI processing: 15-20 seconds
- Review diff: 5-10 seconds
- **Total: 25-35 seconds**

### Benefits:
- ✅ Handles all files at once
- ✅ Consistent fixes across codebase
- ✅ Shows clear diff for review
- ✅ No manual file navigation needed
- ✅ Reduces human error

---

## Metrics Comparison

| Metric | Manual | With mahiro-lab | Improvement |
|--------|--------|-----------------|-------------|
| **Time** | 8-10 min | 30 sec | **95% faster** |
| **Files opened** | 8 | 0 | **100% reduction** |
| **Context switches** | 8+ | 1 | **87% reduction** |
| **Error risk** | Medium | Low | **Safer** |
| **Mental overhead** | High | Minimal | **Less fatigue** |

---

## Real-World Impact

### Individual Developer:
- **Daily savings:** 3-4 quick fixes/day × 8 min = 24-32 min saved
- **Weekly savings:** ~2-3 hours
- **Annual savings:** ~100-150 hours

### Team of 10 Developers:
- **Annual savings:** 1,000-1,500 hours
- **Equivalent to:** 6-9 months of full-time work

### Business Value:
- Developer can focus on high-value tasks
- Faster iteration cycles
- More consistent code quality
- Reduced context switching fatigue

---

## Variations

### Other Quick Fix Examples:

**1. Update import paths after refactoring:**
```bash
./codex-exec.sh low "Update all imports of './utils/helper' to './lib/helper'"
```

**2. Add TypeScript types:**
```bash
./codex-exec.sh medium "Add TypeScript interfaces for all API response types"
```

**3. Remove deprecated API calls:**
```bash
./codex-exec.sh low "Replace deprecated React.render with createRoot"
```

**4. Fix accessibility issues:**
```bash
./codex-exec.sh medium "Add ARIA labels to all interactive elements missing them"
```

---

## Demo Script

**For Presentation (2-3 minutes):**

1. **Show the problem** (30 sec)
   - Display terminal with ESLint output
   - "23 warnings across 8 files - this would normally take me 10 minutes"

2. **Run the command** (10 sec)
   ```bash
   ./codex-exec.sh low "Fix all ESLint warnings in src/components/"
   ```

3. **Watch it work** (20 sec)
   - Show processing output
   - Build anticipation

4. **Review the diff** (60 sec)
   - Show 2-3 file changes
   - Point out consistency
   - Highlight that you review before accepting

5. **Emphasize the value** (30 sec)
   - "That's 10 minutes back in my day"
   - "And I didn't have to open a single file"
   - "This is just one example - imagine applying this to bigger tasks"

---

## Talking Points

**For Developers:**
- "This frees you to focus on architecture and problem-solving"
- "Consistent automated fixes reduce code review friction"
- "You still review everything - you're in control"

**For Managers:**
- "24-32 minutes saved per developer per day"
- "Multiply that across your team"
- "Faster delivery without sacrificing quality"

**For General Audience:**
- "Think of it like autocorrect for your code"
- "AI handles the tedious, you handle the creative"

---

**Demo Priority:** ⭐⭐⭐ HIGH - Great introductory demo, quick to show, immediately relatable
