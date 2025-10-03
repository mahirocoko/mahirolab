---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git log:*), Bash(git push:*), Bash(git branch:*)
description: Commit all changes and push to remote
---

## Context
- Current git status: !`git status`
- Recent commits: !`git log --oneline -5`
- Current branch: !`git branch --show-current`
- Commit standards: @.mahirolab/docs/COMMIT_GUIDE.md

## Your task
1. First, analyze and commit changes:
   - Review changes with git status and git diff
   - Determine commit type and emoji from the commitlint-approved types:
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
   - Stage all changes with `git add -A`
   - Create commit following project's commitlint rules from @.mahirolab/docs/COMMIT_GUIDE.md:
     - Format: `<type>: <emoji> <subject>` (8-60 chars for subject, NO SCOPE, no period at end)
     - REQUIRED: Must include emoji after colon for team consistency
     - Include descriptive body with bullet points explaining the changes
     - Do NOT include AI attribution in commit messages
   
2. Then push to remote:
   - Push with `git push origin <branch>`
   - Show both commit and push results
   - Handle any warnings or errors