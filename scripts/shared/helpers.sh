#!/usr/bin/env bash
#==============================================================================
# Mahiro Lab - Shared Helper Functions
# Common utilities for installation scripts
#==============================================================================

VERSION="1.0.0"

#------------------------------------------------------------------------------
# Colors and formatting
#------------------------------------------------------------------------------
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export CYAN='\033[0;36m'
export MAGENTA='\033[0;35m'
export BOLD='\033[1m'
export RESET='\033[0m'
export NC='\033[0m'  # No Color

#------------------------------------------------------------------------------
# Print functions
#------------------------------------------------------------------------------

print_header() {
    local title="${1:-Mahiro Lab Installer}"
    echo -e "${CYAN}${BOLD}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    printf "║  %-60s║\n" "$title"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

print_success() {
    echo -e "${GREEN}✓${RESET} $1"
}

print_error() {
    echo -e "${RED}✗${RESET} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${RESET} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${RESET} $1"
}

print_step() {
    echo -e "${CYAN}▶${RESET} $1"
}

print_subsection() {
    echo -e "\n${BOLD}$1${RESET}"
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
# File size formatting
#------------------------------------------------------------------------------

format_size() {
    local size=$1
    if [ $size -lt 1024 ]; then
        echo "${size}B"
    elif [ $size -lt 1048576 ]; then
        echo "$((size / 1024))KB"
    else
        echo "$((size / 1048576))MB"
    fi
}

#------------------------------------------------------------------------------
# Download utilities
#------------------------------------------------------------------------------

detect_download_tool() {
    if command -v curl &> /dev/null; then
        echo "curl"
    elif command -v wget &> /dev/null; then
        echo "wget"
    else
        print_error "Neither curl nor wget found. Please install one of them."
        exit 1
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

#------------------------------------------------------------------------------
# Validation functions
#------------------------------------------------------------------------------

validate_file_exists() {
    local file="$1"
    if [ ! -f "$file" ]; then
        print_error "File not found: $file"
        return 1
    fi
    return 0
}

validate_dir_exists() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        print_error "Directory not found: $dir"
        return 1
    fi
    return 0
}

validate_executable() {
    local file="$1"
    if [ ! -x "$file" ]; then
        print_error "File is not executable: $file"
        return 1
    fi
    return 0
}

check_file_permissions() {
    local file="$1"
    local expected="$2"
    local actual=$(stat -f "%Lp" "$file" 2>/dev/null || stat -c "%a" "$file" 2>/dev/null)

    if [ "$actual" = "$expected" ]; then
        return 0
    else
        print_warning "File $file has permissions $actual, expected $expected"
        return 1
    fi
}

#------------------------------------------------------------------------------
# Directory creation helpers
#------------------------------------------------------------------------------

create_dir_safe() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        if [ $? -eq 0 ]; then
            print_success "Created directory: $dir"
        else
            print_error "Failed to create directory: $dir"
            return 1
        fi
    fi
    return 0
}

#------------------------------------------------------------------------------
# File copying with validation
#------------------------------------------------------------------------------

copy_file_safe() {
    local src="$1"
    local dest="$2"
    local make_executable="${3:-false}"

    if [ ! -f "$src" ]; then
        print_error "Source file not found: $src"
        return 1
    fi

    # Create destination directory if needed
    local dest_dir=$(dirname "$dest")
    create_dir_safe "$dest_dir" || return 1

    # Copy file
    cp "$src" "$dest"
    if [ $? -ne 0 ]; then
        print_error "Failed to copy $src to $dest"
        return 1
    fi

    # Set executable if requested
    if [ "$make_executable" = "true" ]; then
        chmod +x "$dest"
        if [ $? -ne 0 ]; then
            print_error "Failed to make $dest executable"
            return 1
        fi
    fi

    return 0
}

#------------------------------------------------------------------------------
# Template variable substitution
#------------------------------------------------------------------------------

substitute_variables() {
    local template_file="$1"
    local output_file="$2"
    shift 2
    local variables=("$@")

    if [ ! -f "$template_file" ]; then
        print_error "Template not found: $template_file"
        return 1
    fi

    # Create destination directory if needed
    local dest_dir=$(dirname "$output_file")
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir" || return 1
    fi

    # Copy template to output
    cp "$template_file" "$output_file"

    # Substitute each variable one at a time
    # Use a temp file to avoid issues with in-place sed
    for var in "${variables[@]}"; do
        local key=$(echo "$var" | cut -d'=' -f1)
        local value="${var#*=}"

        # Create a temp file with the value
        local tmp_value_file=$(mktemp)
        printf '%s' "$value" > "$tmp_value_file"

        # Use awk for safe multiline substitution
        awk -v key="{{${key}}}" -v val_file="$tmp_value_file" '
        BEGIN {
            # Read the value from file
            while ((getline line < val_file) > 0) {
                if (val == "") val = line
                else val = val "\n" line
            }
            close(val_file)
        }
        {
            # Simple string replacement
            gsub(key, val)
            print
        }
        ' "$output_file" > "${output_file}.tmp"

        mv "${output_file}.tmp" "$output_file"
        rm -f "$tmp_value_file"
    done

    if [ -f "$output_file" ]; then
        return 0
    else
        print_error "Failed to write output file: $output_file"
        return 1
    fi
}

#------------------------------------------------------------------------------
# Installation summary
#------------------------------------------------------------------------------

print_installation_summary() {
    local level="$1"
    local install_dir="$2"
    local file_count="$3"

    echo ""
    print_subsection "Installation Summary"
    echo -e "  ${BOLD}Level:${RESET}     $level"
    echo -e "  ${BOLD}Location:${RESET}  $install_dir"
    echo -e "  ${BOLD}Files:${RESET}     $file_count created"
    echo ""
}

#------------------------------------------------------------------------------
# Progress indicators
#------------------------------------------------------------------------------

show_progress() {
    local current="$1"
    local total="$2"
    local description="$3"

    local percentage=$((current * 100 / total))
    local filled=$((current * 20 / total))
    local empty=$((20 - filled))

    printf "\r${CYAN}Progress:${RESET} ["
    printf "%${filled}s" | tr ' ' '█'
    printf "%${empty}s" | tr ' ' '░'
    printf "] %3d%% - %s" $percentage "$description"

    if [ $current -eq $total ]; then
        echo ""  # New line when complete
    fi
}

#------------------------------------------------------------------------------
# Error handling
#------------------------------------------------------------------------------

exit_with_error() {
    local message="$1"
    local exit_code="${2:-1}"

    print_error "$message"
    echo ""
    print_info "Installation failed. Check the error messages above."
    exit $exit_code
}

#------------------------------------------------------------------------------
# Cleanup functions
#------------------------------------------------------------------------------

cleanup_temp_files() {
    local files=("$@")

    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            rm -f "$file"
        fi
    done
}

#------------------------------------------------------------------------------
# Version comparison
#------------------------------------------------------------------------------

version_compare() {
    # Returns 0 if versions are equal
    # Returns 1 if $1 > $2
    # Returns 2 if $1 < $2

    if [ "$1" = "$2" ]; then
        return 0
    fi

    local IFS=.
    local i ver1=($1) ver2=($2)

    for ((i=0; i<${#ver1[@]} || i<${#ver2[@]}; i++)); do
        if [ ${ver1[i]:-0} -gt ${ver2[i]:-0} ]; then
            return 1
        elif [ ${ver1[i]:-0} -lt ${ver2[i]:-0} ]; then
            return 2
        fi
    done

    return 0
}

#------------------------------------------------------------------------------
# .gitignore update function
#------------------------------------------------------------------------------

update_gitignore() {
    local install_dir="$1"
    local patterns_file="${2:-${TEMPLATES_DIR}/gitignore-patterns.txt}"
    local gitignore_file="${install_dir}/.gitignore"

    # Check if patterns file exists
    if [ ! -f "$patterns_file" ]; then
        print_warning ".gitignore patterns file not found: $patterns_file"
        return 1
    fi

    # Create .gitignore if it doesn't exist
    if [ ! -f "$gitignore_file" ]; then
        print_info "Creating new .gitignore file"
        touch "$gitignore_file"
    fi

    # Check if Mahiro Lab section already exists
    if grep -q "# Mahiro Lab - Codex Integration" "$gitignore_file" 2>/dev/null; then
        print_info ".gitignore already contains Mahiro Lab patterns (skipping)"
        return 0
    fi

    # Add a separator if file is not empty and doesn't end with newline
    if [ -s "$gitignore_file" ]; then
        # Check if file ends with newline
        if [ "$(tail -c 1 "$gitignore_file" | wc -l)" -eq 0 ]; then
            echo "" >> "$gitignore_file"
        fi
        echo "" >> "$gitignore_file"
        echo "###############################################################################" >> "$gitignore_file"
    fi

    # Append Mahiro Lab patterns
    cat "$patterns_file" >> "$gitignore_file"

    if [ $? -eq 0 ]; then
        print_success "Updated .gitignore with Mahiro Lab patterns"
        return 0
    else
        print_error "Failed to update .gitignore"
        return 1
    fi
}

#------------------------------------------------------------------------------
# Export all functions for use in other scripts
#------------------------------------------------------------------------------

export -f print_header
export -f print_success
export -f print_error
export -f print_info
export -f print_warning
export -f print_step
export -f print_subsection
export -f get_version
export -f format_size
export -f detect_download_tool
export -f download_file
export -f validate_file_exists
export -f validate_dir_exists
export -f validate_executable
export -f check_file_permissions
export -f create_dir_safe
export -f copy_file_safe
export -f substitute_variables
export -f print_installation_summary
export -f show_progress
export -f exit_with_error
export -f cleanup_temp_files
export -f version_compare
export -f update_gitignore

#------------------------------------------------------------------------------
# End of helpers.sh
#------------------------------------------------------------------------------
