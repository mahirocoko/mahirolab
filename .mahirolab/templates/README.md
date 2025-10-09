# Codex Report Templates

Collection of markdown templates for generating consistent, well-structured reports from Codex tasks.

## Available Templates

### 1. Research Report (`research-report.md`)

**Purpose:** Structured research output with citations and analysis
**Use Case:** Technology research, comparisons, documentation discovery
**Placeholders:**
- `{{TOPIC}}` - Research topic
- `{{DATE}}` - Report date
- `{{REASONING_LEVEL}}` - Reasoning effort used

**Sections:**
- Executive Summary
- Key Findings
- Detailed Analysis
- Comparisons & Alternatives
- Best Practices
- References (direct URLs)
- Recommendations

---

### 2. Worker Task Report (`worker-task.md`)

**Purpose:** Background task execution report
**Use Case:** Code modifications, refactoring, feature implementation
**Placeholders:**
- `{{TASK_DESCRIPTION}}` - Task description
- `{{START_TIME}}` / `{{END_TIME}}` - Timestamps
- `{{WORKER_PID}}` - Process ID
- `{{EXIT_CODE}}` - Task exit status

**Sections:**
- Task Summary
- Execution Details
- Results (files modified/created/deleted)
- Code Changes
- Testing
- Issues Encountered
- Next Steps

---

### 3. Code Review (`code-review.md`)

**Purpose:** Comprehensive code review report
**Use Case:** Pull requests, periodic code audits, quality assessment
**Placeholders:**
- `{{PROJECT_NAME}}` - Project name
- `{{DATE}}` - Review date
- `{{REVIEW_SCOPE}}` - Files/modules reviewed
- `{{FILE_COUNT}}` / `{{LOC}}` - Metrics

**Sections:**
- Overview & Rating
- Strengths & Improvements
- Critical/Moderate/Minor Issues
- Code Quality Metrics
- Security Analysis
- Performance Analysis
- Architecture Review
- Technical Debt
- Action Items

---

## Using Templates

Templates are **reference-only** and not automatically integrated with scripts.

### Method 1: Manual Replacement

1. Copy template file
2. Replace `{{PLACEHOLDER}}` with actual values
3. Fill in sections with content

### Method 2: Reference in Prompts

```bash
./codex-exec.sh "Generate a code review following the format in templates/code-review.md"
./codex-research.sh "Research topic using structure from templates/research-report.md"
```

### Method 3: Copy Structure

Copy the markdown structure from templates and paste into your own reports as needed.

---

## Creating Custom Templates

### Template Structure

```markdown
# Title with {{PLACEHOLDER}}

**Metadata:** {{VALUE}}

---

## Section 1

[Content guidelines]

## Section 2

[Content guidelines]
```

### Placeholder Conventions

- Use `{{ALL_CAPS_WITH_UNDERSCORES}}`
- Common placeholders:
  - `{{DATE}}` - ISO 8601 date
  - `{{TIME}}` - Timestamp
  - `{{AUTHOR}}` - Creator name
  - `{{VERSION}}` - Version number
  - `{{PROJECT_NAME}}` - Project identifier

### Best Practices

1. **Clear Structure:** Use headings, sections, separators
2. **Consistent Formatting:** Maintain uniform style
3. **Placeholders:** Make them obvious and easy to find
4. **Guidelines:** Include instructions in `[brackets]`
5. **Examples:** Show sample content where helpful

---

## Template Variables Reference

### Common Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{DATE}}` | Current date | 2024-01-15 |
| `{{TIME}}` | Current time | 14:30:00 |
| `{{TIMESTAMP}}` | Full timestamp | 20240115_143000 |
| `{{REASONING_LEVEL}}` | AI reasoning effort | low, medium, high |
| `{{TASK_DESCRIPTION}}` | Task prompt | "Analyze codebase" |
| `{{WORKER_PID}}` | Process ID | 12345 |
| `{{EXIT_CODE}}` | Exit status | 0 (success) |

### Project Variables

| Variable | Description |
|----------|-------------|
| `{{PROJECT_NAME}}` | Project name |
| `{{VERSION}}` | Project version |
| `{{AUTHOR}}` | Author name |
| `{{LICENSE}}` | License type |

### Metric Variables

| Variable | Description |
|----------|-------------|
| `{{FILE_COUNT}}` | Number of files |
| `{{LOC}}` | Lines of code |
| `{{LANGUAGES}}` | Programming languages |
| `{{COVERAGE}}` | Test coverage % |

---

## Manual Integration Example

You can manually reference templates in your workflow:

```bash
# Step 1: Reference template in prompt
./codex-research.sh "Research Next.js 15 using the structure from templates/research-report.md"

# Step 2: Review and adjust output
# Templates provide a reference structure, but scripts don't automatically apply them
```

---

## Contributing Templates

To add a new template:

1. Create `.md` file in `templates/`
2. Follow placeholder conventions
3. Include clear section guidelines
4. Add documentation to this README
5. Test with actual Codex tasks

---

## Tips for Effective Templates

✅ **Do:**
- Use clear, descriptive section names
- Provide content guidelines in `[brackets]`
- Include examples where helpful
- Use tables for structured data
- Add visual separators (`---`)

❌ **Don't:**
- Overcomplicate structure
- Use ambiguous placeholders
- Leave sections without guidance
- Mix different formatting styles

---

*Templates maintained by the Codex community*
