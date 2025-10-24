#!/usr/bin/env bash
#==============================================================================
# Mahiro Lab - Level 2 (Standard) Installer
# Installs full .mahirolab structure with state management and shortcodes
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

LEVEL=2
LEVEL_NAME="Standard"
INSTALL_DIR="${INSTALL_DIR:-.}"  # Can be overridden by environment variable
VERSION=$(get_version)
INSTALL_DATE=$(date +"%Y-%m-%d %H:%M:%S")

#------------------------------------------------------------------------------
# Installation function
#------------------------------------------------------------------------------

install_level_2() {
    print_header "Level 2 (Standard) Installation"

    print_info "Installing to: ${BOLD}${INSTALL_DIR}${RESET}"
    print_info "Version: ${BOLD}${VERSION}${RESET}"
    echo ""

    local file_count=0

    # Step 1: Install CLAUDE.md
    print_step "Installing CLAUDE.md..."
    substitute_variables \
        "${TEMPLATES_DIR}/claude-level-2.md" \
        "${INSTALL_DIR}/CLAUDE.md" \
        "DATE=${INSTALL_DATE}" \
        "VERSION=${VERSION}"
    if [ $? -eq 0 ]; then
        print_success "CLAUDE.md created"
        ((file_count++))
    else
        exit_with_error "Failed to create CLAUDE.md"
    fi

    # Step 2: Create .mahirolab directory structure
    print_step "Creating .mahirolab directory structure..."

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
    print_success ".mahirolab structure created"

    # Step 3: Install bin scripts (5 scripts) from source
    print_step "Installing bin scripts..."

    local bin_scripts=(
        "codex-exec.sh"
        "codex-research.sh"
        "codex-worker-launcher.sh"
        "codex-status.sh"
        "codex-cleanup.sh"
    )

    # Determine source directory (local or from parent during remote install)
    local source_bin_dir
    if [ -d "${SCRIPT_DIR}/../.mahirolab/bin" ]; then
        source_bin_dir="${SCRIPT_DIR}/../.mahirolab/bin"
    elif [ -d ".mahirolab/bin" ]; then
        source_bin_dir=".mahirolab/bin"
    else
        exit_with_error "Source .mahirolab/bin directory not found"
    fi

    for script in "${bin_scripts[@]}"; do
        copy_file_safe \
            "${source_bin_dir}/${script}" \
            "${INSTALL_DIR}/.mahirolab/bin/${script}" \
            true  # Make executable
        if [ $? -eq 0 ]; then
            ((file_count++))
        else
            exit_with_error "Failed to install ${script}"
        fi
    done
    print_success "5 bin scripts installed"

    # Step 4: Install documentation files from source
    print_step "Installing documentation..."

    local doc_files=(
        "SHORTCODES.md"
        "STATE_MANAGEMENT.md"
        "PROJECT_STRUCTURE.md"
        "COMMIT_GUIDE.md"
    )

    local source_docs_dir
    if [ -d "${SCRIPT_DIR}/../.mahirolab/docs" ]; then
        source_docs_dir="${SCRIPT_DIR}/../.mahirolab/docs"
    elif [ -d ".mahirolab/docs" ]; then
        source_docs_dir=".mahirolab/docs"
    else
        exit_with_error "Source .mahirolab/docs directory not found"
    fi

    for doc in "${doc_files[@]}"; do
        copy_file_safe \
            "${source_docs_dir}/${doc}" \
            "${INSTALL_DIR}/.mahirolab/docs/${doc}"
        if [ $? -eq 0 ]; then
            ((file_count++))
        else
            print_warning "Failed to install ${doc} (non-fatal)"
        fi
    done
    print_success "Documentation installed"

    # Step 5: Install template files from source
    print_step "Installing templates..."

    local template_files=(
        "research-report.md"
        "worker-task.md"
        "code-review.md"
    )

    local source_templates_dir
    if [ -d "${SCRIPT_DIR}/../.mahirolab/templates" ]; then
        source_templates_dir="${SCRIPT_DIR}/../.mahirolab/templates"
    elif [ -d ".mahirolab/templates" ]; then
        source_templates_dir=".mahirolab/templates"
    else
        exit_with_error "Source .mahirolab/templates directory not found"
    fi

    for template in "${template_files[@]}"; do
        copy_file_safe \
            "${source_templates_dir}/${template}" \
            "${INSTALL_DIR}/.mahirolab/templates/${template}"
        if [ $? -eq 0 ]; then
            ((file_count++))
        else
            print_warning "Failed to install ${template} (non-fatal)"
        fi
    done
    print_success "Templates installed"

    # Step 6: Create initial state files
    print_step "Creating initial state files..."

    # Create context.md placeholder
    cat > "${INSTALL_DIR}/.mahirolab/state/context.md" << 'EOF'
# Session Context

Run `ccc` shortcode to create your first session context.

For more information, see `.mahirolab/docs/SHORTCODES.md`
EOF
    print_success "Initial state files created"
    ((file_count++))

    # Step 7: Copy README.md
    print_step "Installing README.md..."
    copy_file_safe \
        "${TEMPLATES_DIR}/readme-level-2.md" \
        "${INSTALL_DIR}/README.md"
    if [ $? -eq 0 ]; then
        print_success "README.md installed"
        ((file_count++))
    else
        print_warning "Failed to install README.md (non-fatal)"
    fi

    # Step 8: Update .gitignore
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
        ".mahirolab/docs/SHORTCODES.md"
        ".mahirolab/docs/STATE_MANAGEMENT.md"
    )

    for file in "${core_files[@]}"; do
        if validate_file_exists "${INSTALL_DIR}/${file}"; then
            print_success "✓ ${file}"
        else
            print_error "✗ ${file} missing"
            validation_passed=false
        fi
    done

    # Check executables
    for script in "${bin_scripts[@]}"; do
        if validate_executable "${INSTALL_DIR}/.mahirolab/bin/${script}"; then
            print_success "✓ .mahirolab/bin/${script} is executable"
        else
            print_error "✗ .mahirolab/bin/${script} not executable"
            validation_passed=false
        fi
    done

    # Check directory structure
    if [ -d "${INSTALL_DIR}/.mahirolab/state" ] && \
       [ -d "${INSTALL_DIR}/.mahirolab/state/context_history" ]; then
        print_success "✓ State directory structure"
    else
        print_error "✗ State directory structure incomplete"
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
    echo -e "${BOLD}Quick Start with Shortcodes:${RESET}"
    echo ""
    echo -e "  ${CYAN}1.${RESET} Check project status:"
    echo -e "     ${GREEN}lll${RESET} (in Claude Code chat)"
    echo ""
    echo -e "  ${CYAN}2.${RESET} Create session context:"
    echo -e "     ${GREEN}ccc${RESET} (in Claude Code chat)"
    echo ""
    echo -e "  ${CYAN}3.${RESET} Create implementation plan:"
    echo -e "     ${GREEN}nnn${RESET} (in Claude Code chat)"
    echo ""
    echo -e "  ${CYAN}4.${RESET} Execute the plan:"
    echo -e "     ${GREEN}gogogo${RESET} (in Claude Code chat)"
    echo ""
    echo -e "${BOLD}Documentation:${RESET}"
    echo -e "  • Read ${CYAN}CLAUDE.md${RESET} for complete usage guide"
    echo -e "  • Read ${CYAN}.mahirolab/docs/SHORTCODES.md${RESET} for shortcode reference"
    echo -e "  • Read ${CYAN}.mahirolab/docs/STATE_MANAGEMENT.md${RESET} for state system"
    echo ""
    echo -e "${BOLD}Key Features:${RESET}"
    echo -e "  • Shortcode protocol for efficient workflows"
    echo -e "  • State management with session continuity"
    echo -e "  • Background workers with Claude monitoring"
    echo -e "  • Progress tracking and retrospectives"
    echo ""
    echo -e "${YELLOW}⚠️  Safety Reminder:${RESET}"
    echo -e "  Scripts use ${RED}danger-full-access${RESET} mode"
    echo -e "  Run only in isolated development environments"
    echo ""
    print_success "Ready to use! 🚀"
    echo ""
}

#------------------------------------------------------------------------------
# Main execution
#------------------------------------------------------------------------------

main() {
    install_level_2
    exit $?
}

# Run main if executed directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    main
fi
