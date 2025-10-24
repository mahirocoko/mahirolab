#!/usr/bin/env bash
#==============================================================================
# Mahiro Lab - Level 1 (Minimal) Installer
# Installs basic codex-exec and codex-research scripts
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

LEVEL=1
LEVEL_NAME="Minimal"
INSTALL_DIR="${INSTALL_DIR:-.}"  # Can be overridden by environment variable
VERSION=$(get_version)
INSTALL_DATE=$(date +"%Y-%m-%d %H:%M:%S")

#------------------------------------------------------------------------------
# Installation function
#------------------------------------------------------------------------------

install_level_1() {
    print_header "Level 1 (Minimal) Installation"

    print_info "Installing to: ${BOLD}${INSTALL_DIR}${RESET}"
    print_info "Version: ${BOLD}${VERSION}${RESET}"
    echo ""

    local file_count=0

    # Step 1: Install CLAUDE.md
    print_step "Installing CLAUDE.md..."
    substitute_variables \
        "${TEMPLATES_DIR}/claude-level-1.md" \
        "${INSTALL_DIR}/CLAUDE.md" \
        "DATE=${INSTALL_DATE}" \
        "VERSION=${VERSION}"
    if [ $? -eq 0 ]; then
        print_success "CLAUDE.md created"
        ((file_count++))
    else
        exit_with_error "Failed to create CLAUDE.md"
    fi

    # Step 2: Install codex-exec.sh from source
    print_step "Installing codex-exec.sh..."

    # Try multiple possible locations for source bin directory
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

    copy_file_safe \
        "${source_bin_dir}/codex-exec.sh" \
        "${INSTALL_DIR}/codex-exec.sh" \
        true  # Make executable
    if [ $? -eq 0 ]; then
        print_success "codex-exec.sh installed"
        ((file_count++))
    else
        exit_with_error "Failed to install codex-exec.sh"
    fi

    # Step 3: Install codex-research.sh from source
    print_step "Installing codex-research.sh..."

    # Copy from source and modify paths for Level 1 simplicity
    cat "${source_bin_dir}/codex-research.sh" | \
        sed 's|\.mahirolab/research|codex_output|g' | \
        sed 's|\.mahirolab/templates/research-report\.md||g' \
        > "${INSTALL_DIR}/codex-research.sh"

    chmod +x "${INSTALL_DIR}/codex-research.sh"

    if [ $? -eq 0 ]; then
        print_success "codex-research.sh installed"
        ((file_count++))
    else
        exit_with_error "Failed to install codex-research.sh"
    fi

    # Step 4: Create codex_output directory
    print_step "Creating codex_output directory..."
    create_dir_safe "${INSTALL_DIR}/codex_output"
    if [ $? -eq 0 ]; then
        print_success "codex_output directory created"
    fi

    # Step 5: Copy README.md
    print_step "Installing README.md..."
    copy_file_safe \
        "${TEMPLATES_DIR}/readme-level-1.md" \
        "${INSTALL_DIR}/README.md"
    if [ $? -eq 0 ]; then
        print_success "README.md installed"
        ((file_count++))
    else
        print_warning "Failed to install README.md (non-fatal)"
    fi

    echo ""
    print_subsection "Installation Validation"

    # Validate installation
    local validation_passed=true

    # Check files exist
    for file in "CLAUDE.md" "README.md" "codex-exec.sh" "codex-research.sh"; do
        if validate_file_exists "${INSTALL_DIR}/${file}"; then
            print_success "✓ ${file}"
        else
            print_error "✗ ${file} missing"
            validation_passed=false
        fi
    done

    # Check executables
    for script in "codex-exec.sh" "codex-research.sh"; do
        if validate_executable "${INSTALL_DIR}/${script}"; then
            print_success "✓ ${script} is executable"
        else
            print_error "✗ ${script} not executable"
            validation_passed=false
        fi
    done

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
    echo -e "${BOLD}Quick Start Commands:${RESET}"
    echo ""
    echo -e "  ${CYAN}1.${RESET} Run a quick task:"
    echo -e "     ${GREEN}./codex-exec.sh \"List all TypeScript files\"${RESET}"
    echo ""
    echo -e "  ${CYAN}2.${RESET} Research a topic (with web search):"
    echo -e "     ${GREEN}./codex-research.sh \"Next.js 15 new features\"${RESET}"
    echo ""
    echo -e "  ${CYAN}3.${RESET} Get help:"
    echo -e "     ${GREEN}./codex-exec.sh --help${RESET}"
    echo ""
    echo -e "${BOLD}Documentation:${RESET}"
    echo -e "  • Read ${CYAN}CLAUDE.md${RESET} for complete usage guide"
    echo -e "  • Check ${CYAN}README.md${RESET} for installation details"
    echo ""
    echo -e "${BOLD}Output Location:${RESET}"
    echo -e "  • Research reports saved to ${CYAN}codex_output/${RESET}"
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
    install_level_1
    exit $?
}

# Run main if executed directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    main
fi
