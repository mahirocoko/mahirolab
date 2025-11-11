#!/bin/bash
#
# Git Hooks Installation Script
# Automatically installs commit-msg hook to prevent AI attribution
#
# Usage: ./install-git-hooks.sh [--force] [--backup]
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
HOOKS_DIR="$PROJECT_ROOT/.git/hooks"
COMMIT_MSG_HOOK="$HOOKS_DIR/commit-msg"
SOURCE_HOOK="$PROJECT_ROOT/.mahirolab/templates/git-hooks/commit-msg"
FORCE_INSTALL=false
CREATE_BACKUP=true

# Help function
show_help() {
    cat << EOF
Git Hooks Installation Script

DESCRIPTION:
    Installs commit-msg hook to prevent AI attribution in commit messages.

USAGE:
    ./install-git-hooks.sh [OPTIONS]

OPTIONS:
    -f, --force      Force overwrite existing hook
    -b, --backup     Create backup of existing hook (default)
    --no-backup      Skip backup creation
    -h, --help       Show this help message

EXAMPLES:
    ./install-git-hooks.sh              # Install with backup
    ./install-git-hooks.sh --force      # Force install without prompt
    ./install-git-hooks.sh --no-backup  # Install without backup

EOF
}

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in a git repository
check_git_repo() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        log_error "Not in a git repository!"
        log_info "Run this script from within a git repository."
        exit 1
    fi
}

# Create hooks directory if it doesn't exist
ensure_hooks_dir() {
    if [[ ! -d "$HOOKS_DIR" ]]; then
        log_info "Creating hooks directory: $HOOKS_DIR"
        mkdir -p "$HOOKS_DIR"
    fi
}

# Check if source hook file exists
check_source_hook() {
    if [[ ! -f "$SOURCE_HOOK" ]]; then
        log_error "Source hook file not found: $SOURCE_HOOK"
        log_info "Make sure the .mahirolab/templates/git-hooks directory exists."
        exit 1
    fi
}

# Create backup of existing hook
create_backup() {
    if [[ -f "$COMMIT_MSG_HOOK" ]]; then
        local backup_file="${COMMIT_MSG_HOOK}.backup.$(date +%Y%m%d_%H%M%S)"
        log_info "Creating backup: $backup_file"
        cp "$COMMIT_MSG_HOOK" "$backup_file"
        log_success "Backup created successfully"
    fi
}

# Install the hook
install_hook() {
    log_info "Installing commit-msg hook..."

    # Copy the hook file
    cp "$SOURCE_HOOK" "$COMMIT_MSG_HOOK"

    # Make it executable
    chmod +x "$COMMIT_MSG_HOOK"

    log_success "commit-msg hook installed successfully!"
}

# Verify installation
verify_installation() {
    if [[ -f "$COMMIT_MSG_HOOK" ]] && [[ -x "$COMMIT_MSG_HOOK" ]]; then
        log_success "Hook is installed and executable"

        # Test the hook with a test message containing AI attribution
        echo "🤖 Generated with Claude" > /tmp/test_commit_msg

        if "$COMMIT_MSG_HOOK" /tmp/test_commit_msg 2>/dev/null; then
            log_warning "Hook validation failed - it should reject AI attribution"
        else
            log_success "Hook validation works correctly - rejects AI attribution"
        fi

        rm -f /tmp/test_commit_msg
    else
        log_error "Hook installation verification failed"
        return 1
    fi
}

# Show hook information
show_hook_info() {
    cat << EOF

${GREEN}=== Git Hook Installation Complete ===${NC}

Hook Location: $COMMIT_MSG_HOOK
Source File:   $SOURCE_HOOK

${BLUE}What this hook does:${NC}
✓ Blocks commit messages containing AI attribution
✓ Prevents patterns like "Generated with Claude"
✓ Blocks "Co-Authored-By: Claude"
✓ Maintains clean commit history per your COMMIT_GUIDE.md

${BLUE}Blocked Patterns:${NC}
  - "Generated with.*Claude"
  - "Co-Authored-By:.*Claude"
  - "🤖.*Generated"
  - "claude.com", "anthropic.com"
  - "AI generated", "Assisted by"
  - And more...

${YELLOW}To test:${NC}
  git commit -m "🤖 Generated with Claude: test message"

This should be REJECTED with an error message.

EOF
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -f|--force)
                FORCE_INSTALL=true
                shift
                ;;
            -b|--backup)
                CREATE_BACKUP=true
                shift
                ;;
            --no-backup)
                CREATE_BACKUP=false
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

# Main execution
main() {
    parse_args "$@"

    log_info "Starting git hooks installation..."

    check_git_repo
    check_source_hook
    ensure_hooks_dir

    # Check if hook already exists
    if [[ -f "$COMMIT_MSG_HOOK" ]] && [[ "$FORCE_INSTALL" != true ]]; then
        log_warning "commit-msg hook already exists!"
        echo "Options:"
        echo "  1) Backup and replace (recommended)"
        echo "  2) Skip installation"
        echo "  3) Force replace (no backup)"

        read -p "Choose an option (1-3): " -n 1 -r
        echo

        case $REPLY in
            1)
                create_backup
                ;;
            2)
                log_info "Installation skipped."
                exit 0
                ;;
            3)
                CREATE_BACKUP=false
                ;;
            *)
                log_error "Invalid option. Installation skipped."
                exit 1
                ;;
        esac
    else
        if [[ "$CREATE_BACKUP" == true ]]; then
            create_backup
        fi
    fi

    install_hook
    verify_installation
    show_hook_info
}

# Run main function with all arguments
main "$@"