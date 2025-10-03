---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git log:*)
description: Stage all changes and create a commit with proper format
---

## Context
- Current git status: !`git status`
- Recent commits for style reference: !`git log --oneline -5`
- Commit standards: @.mahirolab/docs/COMMIT_GUIDE.md

## Your task
1. Analyze the changes from git status and git diff
2. Determine the appropriate commit type and emoji from the commitlint-approved types:
   - feat: ✨ A new feature
   - fix: 🐛 A bug fix
   - docs: 📝 Documentation only changes
   - style: 💄 Code style changes (formatting, missing semicolons, etc)
   - refactor: ♻️ Code refactoring without changing functionality
   - perf: ⚡ Performance improvements
   - test: ✅ Adding or updating tests
   - build: 📦 Build system or external dependencies changes
   - ci: 👷 CI configuration changes
   - chore: 🔧 Other changes that don't modify src or test files
   - revert: ⏪ Reverts a previous commit
3. Stage all changes with `git add -A`
4. Create a commit following the project's commitlint rules from @.mahirolab/docs/COMMIT_GUIDE.md:
   - Format: `<type>: <emoji> <subject>` (8-60 chars for subject, NO SCOPE, no period at end)
   - REQUIRED: Must include emoji after colon for team consistency
   - Include descriptive body with bullet points explaining the changes
   - Do NOT include AI attribution in commit messages
5. Show the commit result