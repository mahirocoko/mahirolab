# Git Commit Guide

This guide follows the project's commitlint configuration and conventional commit standards.

## Commit Message Format

```
<type>: <subject>

<optional body>

<optional footer>
```

**Note**: While commitlint validates the standard format above, this project **REQUIRES emojis** for better visual representation and team consistency.

**Important**: This project uses **NO SCOPE** - scopes are disabled in the commitlint config.

## Commit Types

The following commit types are enforced by commitlint:

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to our CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

## Subject Line Rules

The commitlint configuration enforces these rules:

### Length Requirements
- **Minimum**: 8 characters
- **Maximum**: 60 characters

### Format Requirements
- **No scope**: Don't use `type(scope):` format
- **No period**: Don't end with a period
- **Case sensitivity**: Any case is allowed (subject-case is disabled)

## Valid Examples

```bash
# ✅ Good examples (with required emojis)
feat: 🎉 add user authentication system
fix: 🐛 resolve cart calculation error
docs: 📝 update installation instructions
style: 💄 format code with prettier
refactor: ♻️ simplify product filter logic
perf: ⚡ optimize image loading performance
test: ✅ add unit tests for auth service
build: 📦 update webpack configuration
ci: 👷 add automated deployment workflow
chore: 🔧 update dependencies
revert: ⏪ revert authentication changes

# ❌ Invalid examples
feat: short                           # Too short (< 8 characters) + missing emoji
feat: this is a very long commit message that exceeds the maximum allowed length # Too long (> 60 characters)
feat(auth): add login                 # Scope not allowed
feat: 🎉 Add login.                   # Period not allowed
feat: add user login                  # Missing required emoji (passes commitlint but violates team standards)
🎉 feat: add user login               # Emoji in wrong position (should be after colon)
```

## Body and Footer (Optional)

### Body Guidelines
- Use the body to explain **what** and **why** vs. how
- Wrap lines at 72 characters
- Use bullet points for multiple changes
- Separate from subject with a blank line
- **Do NOT include AI attribution** (no bot signatures, co-author credits, or AI-generated mentions)

### Footer Guidelines
- Reference issues and pull requests
- Note breaking changes
- **Do NOT include AI attribution** in any part of the footer

## Complete Examples

### Simple Commit
```
feat: 🎉 add product search functionality
```

### Commit with Body
```
fix: 🐛 resolve infinite scroll loading issue

The infinite scroll was triggering multiple API calls
when reaching the bottom of the product list. Added
debouncing to prevent duplicate requests.
```

### Commit with Body and Footer
```
feat: 🎉 implement shopping cart persistence

- Add cart state to localStorage
- Restore cart contents on page refresh
- Handle cart migration for logged-in users
- Add error handling for storage failures

Closes #123
```

### Breaking Change
```
refactor: ♻️ restructure authentication API

BREAKING CHANGE: The authentication endpoints have been
restructured. Update your API calls from /auth/login
to /api/v2/auth/signin
```

## Emoji Usage (Required)

This project **REQUIRES** emojis in all commit messages for better readability and visual consistency:

- 🎉 **feat**: New feature
- 🐛 **fix**: Bug fix
- 📚 **docs**: Documentation
- 💄 **style**: Styling
- ♻️ **refactor**: Refactoring
- ⚡ **perf**: Performance
- ✅ **test**: Tests
- 📦 **build**: Build system
- 👷 **ci**: CI/CD
- 🔧 **chore**: Maintenance
- ⏪ **revert**: Revert

**Required format with emoji:**
```
feat: 🎉 add user authentication system
```

## Important: Commitlint vs Team Standards

**Commitlint Configuration**: The project's commitlint only validates the basic conventional commit format (`type: subject`) and will accept commits without emojis.

**Team Requirement**: However, this project **mandates emoji usage** in all commits for:
- Better visual scanning in git history
- Consistent team practices
- Improved readability in pull requests

**What this means**:
- Commits like `feat: add login` will pass commitlint validation
- But team members should always use `feat: 🎉 add login` format
- Code review process should catch and request emoji additions

## VSCode Integration

For easier commit message creation, install the [Conventional Commits](https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits) extension.

### Configuration
The extension should work with the project's commitlint configuration automatically. If needed, add this to your VSCode settings:

```json
{
  "conventionalCommits.scopes": [],
  "conventionalCommits.emojiFormat": "emoji",
  "conventionalCommits.showEditor": true
}
```

## Pre-commit Hooks

The project uses Husky to run commitlint on every commit:

```json
{
  "husky": {
    "hooks": {
      "commit-msg": "commitlint -E HUSKY_GIT_PARAMS"
    }
  }
}
```

If your commit message doesn't follow the rules, the commit will be rejected with an error message explaining what needs to be fixed.

## Common Mistakes to Avoid

1. **Using scopes**: `feat(auth): 🎉 add login` ❌
2. **Too short subject**: `fix: 🐛 bug` ❌
3. **Too long subject**: `feat: 🎉 implement a very comprehensive user authentication system with all features` ❌
4. **Wrong type**: `add: new feature` ❌ (use `feat: 🎉`)
5. **Missing emoji**: `feat: add login` ❌ (passes commitlint but violates team standards)
6. **Emoji in wrong position**: `🎉 feat: add login` ❌ (emoji should be after colon)
7. **Capital first letter** (optional but consistent): `Feat: 🎉 add login` (inconsistent casing)
8. **Including AI attribution**: Adding AI-generated content mentions, bot signatures, or co-author credits ❌

## Tips for Good Commits

1. **Atomic commits**: One logical change per commit
2. **Present tense**: "add feature" not "added feature"
3. **Imperative mood**: "fix bug" not "fixes bug"
4. **Clear and concise**: Explain what the commit does
5. **Group related changes**: Don't mix feature and fix in one commit

## Checking Your Commits

You can manually check your commit messages against the rules:

```bash
# Check the last commit
npx commitlint --from HEAD~1 --to HEAD --verbose

# Check a specific commit message
echo "feat: 🎉 add user login" | npx commitlint
```

This ensures your commits follow the project's standards before pushing to the repository.
