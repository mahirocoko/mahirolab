#!/usr/bin/env bash

#==============================================================================
# Mahiro Lab - Codex Integration Installer (Orchestrator)
# Downloads and executes level-specific installation scripts
#==============================================================================

set -e  # Exit on error

#------------------------------------------------------------------------------
# Colors and formatting
#------------------------------------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

#------------------------------------------------------------------------------
# Configuration
#------------------------------------------------------------------------------
INSTALL_LEVEL=2  # Default to Standard installation
INSTALL_DIR="."  # Default to current directory
DRY_RUN=false
GITHUB_REPO="mahirocoko/mahirolab"
GITHUB_BRANCH="main"
INSTALL_MODE="${INSTALL_MODE:-remote}"  # Can be overridden to "local" for testing

# Temporary directory for downloaded scripts
TMP_DIR=""

#------------------------------------------------------------------------------
# Helper functions
#------------------------------------------------------------------------------

print_header() {
    echo -e "${CYAN}${BOLD}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║     Mahiro Lab - Codex Integration Installer                 ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

print_success() {
    echo -e "${GREEN}✓${RESET} $1"
}

print_error() {
    echo -e "${RED}✗${RESET} $1" >&2
}

print_info() {
    echo -e "${BLUE}ℹ${RESET} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${RESET} $1"
}

print_step() {
    echo -e "${CYAN}▸${RESET} $1"
}

exit_with_error() {
    print_error "$1"
    cleanup_temp_files
    exit 1
}

show_help() {
    cat << EOF
${BOLD}Mahiro Lab - Codex Integration Installer${RESET}

${BOLD}USAGE:${RESET}
    curl -sSL <URL> | bash -s -- [OPTIONS]

    Or locally:
    ./install.sh [OPTIONS]

${BOLD}OPTIONS:${RESET}
    --level=<1|2|3>     Installation level (default: 2)
                        1 = Minimal (basic scripts only)
                        2 = Standard (full .mahirolab structure)
                        3 = Full (includes git conventions)

    --dir=<path>        Installation directory (default: current directory)

    --dry-run           Preview installation without writing files

    --help              Show this help message

${BOLD}INSTALLATION LEVELS:${RESET}

    ${BOLD}Level 1 - Minimal${RESET}
    ├── CLAUDE.md (simplified)
    ├── README.md (generated)
    ├── codex-exec.sh
    ├── codex-research.sh
    └── codex_output/

    ${BOLD}Level 2 - Standard${RESET} (Recommended)
    ├── CLAUDE.md (standard)
    ├── README.md (generated)
    └── .mahirolab/
        ├── bin/ (5 scripts)
        ├── docs/ (SHORTCODES.md, STATE_MANAGEMENT.md, etc.)
        ├── templates/ (research-report.md, worker-task.md)
        └── state/ (context, plans, progress tracking)

    ${BOLD}Level 3 - Full${RESET}
    ├── All from Level 2, plus:
    ├── .mahirolab/docs/COMMIT_GUIDE.md
    └── .claude/commands/git/ (commit.md, commit-push.md)

${BOLD}EXAMPLES:${RESET}
    # Install Standard (Level 2) in current directory
    curl -sSL <URL> | bash -s -- --level=2

    # Install Minimal (Level 1) in custom directory
    curl -sSL <URL> | bash -s -- --level=1 --dir=~/projects/my-app

    # Preview Full (Level 3) installation
    curl -sSL <URL> | bash -s -- --level=3 --dry-run

${BOLD}REQUIREMENTS:${RESET}
    - Codex CLI installed (https://github.com/anthropics/codex)
    - Bash shell
    - curl or wget

${BOLD}MORE INFO:${RESET}
    https://github.com/${GITHUB_REPO}

EOF
    exit 0
}

#------------------------------------------------------------------------------
# Argument parsing
#------------------------------------------------------------------------------

parse_arguments() {
    for arg in "$@"; do
        case $arg in
            --level=*)
                INSTALL_LEVEL="${arg#*=}"
                if [[ ! "$INSTALL_LEVEL" =~ ^[1-3]$ ]]; then
                    exit_with_error "Invalid level: $INSTALL_LEVEL (must be 1, 2, or 3)"
                fi
                ;;
            --dir=*)
                INSTALL_DIR="${arg#*=}"
                ;;
            --dry-run)
                DRY_RUN=true
                ;;
            --help|-h)
                show_help
                ;;
            *)
                exit_with_error "Unknown option: $arg (use --help for usage information)"
                ;;
        esac
    done
}

#------------------------------------------------------------------------------
# Version detection
#------------------------------------------------------------------------------

get_version() {
    # Try to get version from git
    if command -v git &> /dev/null && [ -d ".git" ]; then
        VERSION=$(git describe --tags --always 2>/dev/null || echo "dev")
    else
        VERSION="dev"
    fi
    echo "$VERSION"
}

#------------------------------------------------------------------------------
# Installation preview (dry-run)
#------------------------------------------------------------------------------

show_dry_run() {
    local version=$(get_version)

    print_header
    echo -e "${BOLD}DRY RUN MODE${RESET} - No files will be created\n"

    print_info "Installation Level: ${BOLD}Level $INSTALL_LEVEL${RESET}"
    print_info "Target Directory: ${BOLD}$INSTALL_DIR${RESET}"
    print_info "Version: ${BOLD}$version${RESET}"
    print_info "Mode: ${BOLD}${INSTALL_MODE}${RESET}"
    echo ""

    echo -e "${BOLD}Files that would be downloaded:${RESET}\n"

    if [ "$INSTALL_MODE" = "local" ]; then
        print_info "Local mode: Using scripts/ directory directly"
    else
        print_info "Remote mode: Downloading from GitHub"
        echo "  📄 scripts/install-level-${INSTALL_LEVEL}.sh"
        echo "  📄 scripts/shared/helpers.sh"
        echo "  📁 scripts/shared/templates/ (multiple files)"
    fi

    echo ""
    echo -e "${BOLD}Files that would be created in ${INSTALL_DIR}:${RESET}\n"

    case $INSTALL_LEVEL in
        1)
            echo "  📄 CLAUDE.md (simplified version)"
            echo "  📄 README.md (generated)"
            echo "  📄 codex-exec.sh (executable)"
            echo "  📄 codex-research.sh (executable)"
            echo "  📁 codex_output/"
            ;;
        2)
            echo "  📄 CLAUDE.md (standard version)"
            echo "  📄 README.md (generated)"
            echo "  📁 .mahirolab/"
            echo "     📁 bin/ (5 scripts)"
            echo "     📁 docs/ (SHORTCODES.md, STATE_MANAGEMENT.md, etc.)"
            echo "     📁 templates/ (research-report.md, worker-task.md)"
            echo "     📁 state/ (context_history, plans, retrospectives)"
            ;;
        3)
            echo "  📄 CLAUDE.md (full version)"
            echo "  📄 README.md (generated)"
            echo "  📁 .mahirolab/ (full structure from Level 2)"
            echo "  📁 .claude/commands/git/"
            echo "     📄 commit.md"
            echo "     📄 commit-push.md"
            ;;
    esac

    echo ""
    print_info "Estimated files: $(count_files_for_level $INSTALL_LEVEL)+"
    echo ""
    print_success "Dry run complete. Run without --dry-run to install."
}

count_files_for_level() {
    case $1 in
        1) echo "4" ;;
        2) echo "15" ;;
        3) echo "18" ;;
    esac
}

#------------------------------------------------------------------------------
# File download functions
#------------------------------------------------------------------------------

detect_download_tool() {
    if command -v curl &> /dev/null; then
        echo "curl"
    elif command -v wget &> /dev/null; then
        echo "wget"
    else
        exit_with_error "Neither curl nor wget found. Please install one of them."
    fi
}

download_file() {
    local url="$1"
    local output="$2"
    local tool=$(detect_download_tool)

    case $tool in
        curl)
            curl -fsSL "$url" -o "$output" 2>/dev/null
            ;;
        wget)
            wget -q "$url" -O "$output" 2>/dev/null
            ;;
    esac

    if [ $? -ne 0 ]; then
        return 1
    fi
    return 0
}

get_raw_url() {
    local file_path="$1"
    echo "https://raw.githubusercontent.com/${GITHUB_REPO}/${GITHUB_BRANCH}/${file_path}"
}

#------------------------------------------------------------------------------
# Temporary directory management
#------------------------------------------------------------------------------

create_temp_dir() {
    TMP_DIR=$(mktemp -d -t mahirolab-install.XXXXXX)
    if [ $? -ne 0 ]; then
        exit_with_error "Failed to create temporary directory"
    fi
    print_info "Created temporary directory: ${TMP_DIR}"
}

cleanup_temp_files() {
    if [ -n "$TMP_DIR" ] && [ -d "$TMP_DIR" ]; then
        rm -rf "$TMP_DIR"
        print_info "Cleaned up temporary files"
    fi
}

#------------------------------------------------------------------------------
# Local mode detection
#------------------------------------------------------------------------------

detect_local_mode() {
    # Check if running from cloned repository
    if [ -f "scripts/install-level-${INSTALL_LEVEL}.sh" ] && \
       [ -f "scripts/shared/helpers.sh" ]; then
        INSTALL_MODE="local"
        print_info "Detected local repository, using local scripts"
        return 0
    fi

    # Check environment variable override
    if [ "$INSTALL_MODE" = "local" ]; then
        if [ ! -f "scripts/install-level-${INSTALL_LEVEL}.sh" ]; then
            exit_with_error "Local mode requested but scripts/ directory not found"
        fi
        return 0
    fi

    INSTALL_MODE="remote"
    return 0
}

#------------------------------------------------------------------------------
# Download installation scripts
#------------------------------------------------------------------------------

download_installation_files() {
    print_step "Downloading installation scripts..."

    create_temp_dir

    # Download main installer script for this level
    local installer="scripts/install-level-${INSTALL_LEVEL}.sh"
    local installer_url=$(get_raw_url "$installer")

    print_info "Downloading ${installer}..."
    if ! download_file "$installer_url" "${TMP_DIR}/install-level-${INSTALL_LEVEL}.sh"; then
        exit_with_error "Failed to download ${installer}"
    fi
    chmod +x "${TMP_DIR}/install-level-${INSTALL_LEVEL}.sh"

    # Level 3 needs Level 2 installer as well
    if [ "$INSTALL_LEVEL" -eq 3 ]; then
        print_info "Downloading install-level-2.sh (required by Level 3)..."
        if ! download_file "$(get_raw_url 'scripts/install-level-2.sh')" "${TMP_DIR}/install-level-2.sh"; then
            exit_with_error "Failed to download install-level-2.sh"
        fi
        chmod +x "${TMP_DIR}/install-level-2.sh"
    fi

    # Download helpers
    print_info "Downloading shared helpers..."
    if ! download_file "$(get_raw_url 'scripts/shared/helpers.sh')" "${TMP_DIR}/helpers.sh"; then
        exit_with_error "Failed to download helpers.sh"
    fi

    # Create shared directory structure in temp
    mkdir -p "${TMP_DIR}/shared"
    mv "${TMP_DIR}/helpers.sh" "${TMP_DIR}/shared/"

    # Download templates based on level
    print_info "Downloading templates..."
    mkdir -p "${TMP_DIR}/shared/templates"
    mkdir -p "${TMP_DIR}/.mahirolab/bin"

    # Download bin scripts first (needed by all levels)
    local bin_scripts=()
    case $INSTALL_LEVEL in
        1)
            bin_scripts=("codex-exec.sh" "codex-research.sh")
            ;;
        2|3)
            bin_scripts=(
                "codex-exec.sh"
                "codex-research.sh"
                "codex-worker-launcher.sh"
                "codex-status.sh"
                "codex-cleanup.sh"
            )
            ;;
    esac

    for script in "${bin_scripts[@]}"; do
        local script_url=$(get_raw_url ".mahirolab/bin/${script}")
        if download_file "$script_url" "${TMP_DIR}/.mahirolab/bin/${script}"; then
            chmod +x "${TMP_DIR}/.mahirolab/bin/${script}"
        else
            print_warning "Failed to download ${script} (non-fatal)"
        fi
    done

    # Download CLAUDE.md and README templates
    local claude_templates=()
    case $INSTALL_LEVEL in
        1)
            claude_templates=("claude-level-1.md" "readme-level-1.md")
            ;;
        2)
            claude_templates=("claude-level-2.md" "readme-level-2.md")
            ;;
        3)
            claude_templates=("claude-level-3.md" "readme-level-3.md")
            ;;
    esac

    for template in "${claude_templates[@]}"; do
        local template_url=$(get_raw_url "scripts/shared/templates/${template}")
        if ! download_file "$template_url" "${TMP_DIR}/shared/templates/${template}"; then
            print_warning "Failed to download ${template} (non-fatal)"
        fi
    done

    # Download docs files for Level 2 and 3
    if [ "$INSTALL_LEVEL" -ge 2 ]; then
        mkdir -p "${TMP_DIR}/.mahirolab/docs"
        local docs_files=("SHORTCODES.md" "STATE_MANAGEMENT.md" "PROJECT_STRUCTURE.md" "COMMIT_GUIDE.md")
        for doc in "${docs_files[@]}"; do
            local doc_url=$(get_raw_url ".mahirolab/docs/${doc}")
            if ! download_file "$doc_url" "${TMP_DIR}/.mahirolab/docs/${doc}"; then
                print_warning "Failed to download ${doc} (non-fatal)"
            fi
        done
    fi

    # Download template files for Level 2 and 3
    if [ "$INSTALL_LEVEL" -ge 2 ]; then
        mkdir -p "${TMP_DIR}/.mahirolab/templates"
        local template_files=("research-report.md" "worker-task.md" "code-review.md")
        for tmpl in "${template_files[@]}"; do
            local tmpl_url=$(get_raw_url ".mahirolab/templates/${tmpl}")
            if ! download_file "$tmpl_url" "${TMP_DIR}/.mahirolab/templates/${tmpl}"; then
                print_warning "Failed to download ${tmpl} (non-fatal)"
            fi
        done
    fi

    # Download git slash commands for Level 3
    if [ "$INSTALL_LEVEL" -eq 3 ]; then
        mkdir -p "${TMP_DIR}/.claude/commands/git"
        local git_commands=("git-commit.md" "git-commit-push.md")
        for cmd in "${git_commands[@]}"; do
            local cmd_url=$(get_raw_url ".claude/commands/git/${cmd}")
            if ! download_file "$cmd_url" "${TMP_DIR}/.claude/commands/git/${cmd}"; then
                print_warning "Failed to download ${cmd} (non-fatal)"
            fi
        done
    fi

    print_success "All files downloaded successfully"
}

#------------------------------------------------------------------------------
# Execute installation script
#------------------------------------------------------------------------------

execute_installation() {
    local script_path=""

    if [ "$INSTALL_MODE" = "local" ]; then
        print_step "Executing local installation script..."
        script_path="$(pwd)/scripts/install-level-${INSTALL_LEVEL}.sh"
    else
        print_step "Executing downloaded installation script..."
        script_path="${TMP_DIR}/install-level-${INSTALL_LEVEL}.sh"
    fi

    # Export install directory for the installer script
    export INSTALL_DIR="$(cd "$INSTALL_DIR" && pwd)"

    # Change to temp directory so installer can find helpers
    if [ "$INSTALL_MODE" = "remote" ]; then
        cd "$TMP_DIR" || exit_with_error "Failed to change to temp directory"
    fi

    # Execute the installer
    if [ -f "$script_path" ]; then
        bash "$script_path"
        local exit_code=$?

        if [ $exit_code -eq 0 ]; then
            print_success "Installation completed successfully"
        else
            exit_with_error "Installation failed with exit code ${exit_code}"
        fi

        return $exit_code
    else
        exit_with_error "Installation script not found: ${script_path}"
    fi
}

#------------------------------------------------------------------------------
# Main installation function
#------------------------------------------------------------------------------

main() {
    parse_arguments "$@"

    if [ "$DRY_RUN" = true ]; then
        detect_local_mode
        show_dry_run
        exit 0
    fi

    local version=$(get_version)

    print_header
    print_info "Installation Level: ${BOLD}Level $INSTALL_LEVEL${RESET}"
    print_info "Target Directory: ${BOLD}$INSTALL_DIR${RESET}"
    print_info "Version: ${BOLD}$version${RESET}"
    echo ""

    # Detect if we should use local scripts
    detect_local_mode
    print_info "Installation Mode: ${BOLD}${INSTALL_MODE}${RESET}"
    echo ""

    # Create installation directory if needed
    if [ ! -d "$INSTALL_DIR" ]; then
        mkdir -p "$INSTALL_DIR"
        print_success "Created directory: $INSTALL_DIR"
    fi

    # Resolve absolute path
    INSTALL_DIR="$(cd "$INSTALL_DIR" && pwd)"

    # Download scripts if remote mode
    if [ "$INSTALL_MODE" = "remote" ]; then
        download_installation_files
    fi

    # Execute installation
    execute_installation
    local install_exit_code=$?

    # Cleanup
    cleanup_temp_files

    exit $install_exit_code
}

#------------------------------------------------------------------------------
# Trap cleanup on exit
#------------------------------------------------------------------------------

trap cleanup_temp_files EXIT INT TERM

#------------------------------------------------------------------------------
# Run main function
#------------------------------------------------------------------------------

main "$@"
