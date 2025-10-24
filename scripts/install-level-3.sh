#!/usr/bin/env bash
#==============================================================================
# Mahiro Lab - Level 3 (Full) Installer
# Installs Level 2 + git commit automation and slash commands
#==============================================================================

set -e  # Exit on error

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHARED_DIR="${SCRIPT_DIR}/shared"
TEMPLATES_DIR="${SHARED_DIR}/templates"

# Source helpers
if [ -f "${SHARED_DIR}/helpers.sh" ]; then
    source "${SHARED_DIR}/helpers.sh"
else
    echo "Error: helpers.sh not found"
    exit 1
fi

#------------------------------------------------------------------------------
# Configuration
#------------------------------------------------------------------------------

LEVEL=3
LEVEL_NAME="Full"
INSTALL_DIR="${INSTALL_DIR:-.}"  # Can be overridden by environment variable
VERSION=$(get_version)
INSTALL_DATE=$(date +"%Y-%m-%d %H:%M:%S")

#------------------------------------------------------------------------------
# Installation function
#------------------------------------------------------------------------------

install_level_3() {
    print_header "Level 3 (Full) Installation"

    print_info "Installing to: ${BOLD}${INSTALL_DIR}${RESET}"
    print_info "Version: ${BOLD}${VERSION}${RESET}"
    echo ""

    local file_count=0

    # Step 1: Run Level 2 installer first (reuse)
    print_step "Installing Level 2 (Standard) components..."

    # Set environment variable for Level 2 installer
    export INSTALL_DIR="${INSTALL_DIR}"

    # Run Level 2 installer
    if [ -f "${SCRIPT_DIR}/install-level-2.sh" ]; then
        # Source Level 2 installer and run its installation function
        source "${SCRIPT_DIR}/install-level-2.sh"

        # Call Level 2's install function directly
        install_level_2() {
            # Simplified Level 2 installation without post-install message
            local l2_file_count=0

            # Install CLAUDE.md (will be replaced by Level 3)
            substitute_variables \
                "${TEMPLATES_DIR}/claude-level-2.md" \
                "${INSTALL_DIR}/CLAUDE.md" \
                "DATE=${INSTALL_DATE}" \
                "VERSION=${VERSION}"
            ((l2_file_count++))

            # Create .mahirolab directory structure
            local dirs=(
                ".mahirolab"
                ".mahirolab/bin"
                ".mahirolab/docs"
                ".mahirolab/templates"
                ".mahirolab/research"
                ".mahirolab/workers"
                ".mahirolab/state"
                ".mahirolab/state/context_history"
                ".mahirolab/state/plans"
                ".mahirolab/state/retrospectives"
                ".mahirolab/state/archive"
                ".mahirolab/state/archive/contexts"
                ".mahirolab/state/archive/plans"
                ".mahirolab/state/archive/retrospectives"
            )

            for dir in "${dirs[@]}"; do
                create_dir_safe "${INSTALL_DIR}/${dir}"
            done

            # Install bin scripts from source
            local bin_scripts=(
                "codex-exec.sh"
                "codex-research.sh"
                "codex-worker-launcher.sh"
                "codex-status.sh"
                "codex-cleanup.sh"
            )

            # Try multiple possible locations for bin directory
            local source_bin_dir=""
            if [ -d "${SCRIPT_DIR}/../.mahirolab/bin" ]; then
                source_bin_dir="${SCRIPT_DIR}/../.mahirolab/bin"
            elif [ -d "${SCRIPT_DIR}/.mahirolab/bin" ]; then
                source_bin_dir="${SCRIPT_DIR}/.mahirolab/bin"
            elif [ -d ".mahirolab/bin" ]; then
                source_bin_dir=".mahirolab/bin"
            else
                exit_with_error "Source .mahirolab/bin directory not found"
            fi

            for script in "${bin_scripts[@]}"; do
                copy_file_safe \
                    "${source_bin_dir}/${script}" \
                    "${INSTALL_DIR}/.mahirolab/bin/${script}" \
                    true
                ((l2_file_count++))
            done

            # Install documentation from source
            local doc_files=(
                "SHORTCODES.md"
                "STATE_MANAGEMENT.md"
                "PROJECT_STRUCTURE.md"
                "COMMIT_GUIDE.md"
            )

            # Try multiple possible locations for docs directory
            local source_docs_dir=""
            if [ -d "${SCRIPT_DIR}/../.mahirolab/docs" ]; then
                source_docs_dir="${SCRIPT_DIR}/../.mahirolab/docs"
            elif [ -d "${SCRIPT_DIR}/.mahirolab/docs" ]; then
                source_docs_dir="${SCRIPT_DIR}/.mahirolab/docs"
            elif [ -d ".mahirolab/docs" ]; then
                source_docs_dir=".mahirolab/docs"
            else
                exit_with_error "Source .mahirolab/docs directory not found"
            fi

            for doc in "${doc_files[@]}"; do
                copy_file_safe \
                    "${source_docs_dir}/${doc}" \
                    "${INSTALL_DIR}/.mahirolab/docs/${doc}"
                ((l2_file_count++))
            done

            # Install templates from source
            local template_files=(
                "research-report.md"
                "worker-task.md"
                "code-review.md"
            )

            # Try multiple possible locations for templates directory
            local source_templates_dir=""
            if [ -d "${SCRIPT_DIR}/../.mahirolab/templates" ]; then
                source_templates_dir="${SCRIPT_DIR}/../.mahirolab/templates"
            elif [ -d "${SCRIPT_DIR}/.mahirolab/templates" ]; then
                source_templates_dir="${SCRIPT_DIR}/.mahirolab/templates"
            elif [ -d ".mahirolab/templates" ]; then
                source_templates_dir=".mahirolab/templates"
            else
                exit_with_error "Source .mahirolab/templates directory not found"
            fi

            for template in "${template_files[@]}"; do
                copy_file_safe \
                    "${source_templates_dir}/${template}" \
                    "${INSTALL_DIR}/.mahirolab/templates/${template}"
                ((l2_file_count++))
            done

            # Create initial state files
            cat > "${INSTALL_DIR}/.mahirolab/state/context.md" << 'EOF'
# Session Context

Run `ccc` shortcode to create your first session context.

For more information, see `.mahirolab/docs/SHORTCODES.md`
EOF
            ((l2_file_count++))

            return 0
        }

        install_level_2
        print_success "Level 2 components installed"
    else
        exit_with_error "install-level-2.sh not found"
    fi

    # Step 2: Replace CLAUDE.md with Level 3 version
    print_step "Upgrading CLAUDE.md to Level 3..."
    substitute_variables \
        "${TEMPLATES_DIR}/claude-level-3.md" \
        "${INSTALL_DIR}/CLAUDE.md" \
        "DATE=${INSTALL_DATE}" \
        "VERSION=${VERSION}"
    if [ $? -eq 0 ]; then
        print_success "CLAUDE.md upgraded to Level 3"
        ((file_count++))
    else
        exit_with_error "Failed to upgrade CLAUDE.md"
    fi

    # Step 3: Create .claude/commands directory structure
    print_step "Creating .claude/commands structure..."

    local claude_dirs=(
        ".claude"
        ".claude/commands"
        ".claude/commands/git"
    )

    for dir in "${claude_dirs[@]}"; do
        create_dir_safe "${INSTALL_DIR}/${dir}"
    done
    print_success ".claude/commands structure created"

    # Step 4: Install git slash commands from source
    print_step "Installing git slash commands..."

    local git_commands=(
        "commit.md"
        "commit-push.md"
    )

    # Try multiple possible locations for git commands
    local source_git_dir=""
    if [ -d "${SCRIPT_DIR}/../.claude/commands/git" ]; then
        source_git_dir="${SCRIPT_DIR}/../.claude/commands/git"
    elif [ -d "${SCRIPT_DIR}/.claude/commands/git" ]; then
        source_git_dir="${SCRIPT_DIR}/.claude/commands/git"
    elif [ -d ".claude/commands/git" ]; then
        source_git_dir=".claude/commands/git"
    else
        exit_with_error "Source .claude/commands/git directory not found"
    fi

    for cmd_file in "${git_commands[@]}"; do
        copy_file_safe \
            "${source_git_dir}/${cmd_file}" \
            "${INSTALL_DIR}/.claude/commands/git/${cmd_file}"
        if [ $? -eq 0 ]; then
            ((file_count++))
        else
            exit_with_error "Failed to install ${cmd_file}"
        fi
    done
    print_success "Git slash commands installed"

    # Step 5: Copy README.md for Level 3
    print_step "Installing README.md..."
    copy_file_safe \
        "${TEMPLATES_DIR}/readme-level-3.md" \
        "${INSTALL_DIR}/README.md"
    if [ $? -eq 0 ]; then
        print_success "README.md installed"
        ((file_count++))
    else
        print_warning "Failed to install README.md (non-fatal)"
    fi

    # Step 6: Update .gitignore
    print_step "Updating .gitignore..."
    update_gitignore "${INSTALL_DIR}" "${TEMPLATES_DIR}/gitignore-patterns.txt"
    if [ $? -eq 0 ]; then
        ((file_count++))
    fi

    echo ""
    print_subsection "Installation Validation"

    # Validate installation
    local validation_passed=true

    # Check core files
    local core_files=(
        "CLAUDE.md"
        "README.md"
        ".mahirolab/docs/COMMIT_GUIDE.md"
        ".claude/commands/git/commit.md"
        ".claude/commands/git/commit-push.md"
    )

    for file in "${core_files[@]}"; do
        if validate_file_exists "${INSTALL_DIR}/${file}"; then
            print_success "✓ ${file}"
        else
            print_error "✗ ${file} missing"
            validation_passed=false
        fi
    done

    # Check directory structure
    if [ -d "${INSTALL_DIR}/.claude/commands/git" ]; then
        print_success "✓ .claude/commands/git structure"
    else
        print_error "✗ .claude/commands/git structure incomplete"
        validation_passed=false
    fi

    echo ""

    if [ "$validation_passed" = true ]; then
        print_installation_summary "$LEVEL_NAME" "$INSTALL_DIR" "$file_count"
        show_post_install_message
        return 0
    else
        exit_with_error "Installation validation failed"
    fi
}

#------------------------------------------------------------------------------
# Post-install message
#------------------------------------------------------------------------------

show_post_install_message() {
    echo ""
    print_subsection "🎉 Installation Complete!"
    echo ""
    echo -e "${BOLD}Complete Workflow:${RESET}"
    echo ""
    echo -e "  ${CYAN}1.${RESET} Check status:"
    echo -e "     ${GREEN}lll${RESET} (in Claude Code chat)"
    echo ""
    echo -e "  ${CYAN}2.${RESET} Create context → plan → execute:"
    echo -e "     ${GREEN}ccc → nnn → gogogo${RESET}"
    echo ""
    echo -e "  ${CYAN}3.${RESET} Commit changes with automation:"
    echo -e "     ${GREEN}/git:commit${RESET} or ${GREEN}/git:commit-push${RESET}"
    echo ""
    echo -e "${BOLD}Git Features:${RESET}"
    echo -e "  • ${CYAN}/git:commit${RESET} - Stage all and create conventional commit"
    echo -e "  • ${CYAN}/git:commit-push${RESET} - Commit and push to remote"
    echo -e "  • Automatic commit message generation"
    echo -e "  • Conventional commit format with emojis"
    echo -e "  • Claude co-author attribution"
    echo ""
    echo -e "${BOLD}Documentation:${RESET}"
    echo -e "  • Read ${CYAN}CLAUDE.md${RESET} for complete guide"
    echo -e "  • Read ${CYAN}.mahirolab/docs/COMMIT_GUIDE.md${RESET} for git standards"
    echo -e "  • Read ${CYAN}.mahirolab/docs/SHORTCODES.md${RESET} for shortcode reference"
    echo ""
    echo -e "${BOLD}You have:${RESET}"
    echo -e "  ✅ Full shortcode protocol"
    echo -e "  ✅ State management & session continuity"
    echo -e "  ✅ Background workers with monitoring"
    echo -e "  ✅ Git automation with commit standards"
    echo ""
    echo -e "${YELLOW}⚠️  Safety Reminder:${RESET}"
    echo -e "  Scripts use ${RED}danger-full-access${RESET} mode"
    echo -e "  Run only in isolated development environments"
    echo ""
    print_success "Ready to use with full features! 🚀"
    echo ""
}

#------------------------------------------------------------------------------
# Main execution
#------------------------------------------------------------------------------

main() {
    install_level_3
    exit $?
}

# Run main if executed directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    main
fi
