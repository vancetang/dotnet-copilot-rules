#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
SKILLS_SRC="$REPO_ROOT/.github/skills"
TARGET_DIR="$HOME/.copilot/skills"

SKILLS_TO_INSTALL=()

usage() {
    echo "Install Copilot skills to ~/.copilot/skills"
    echo ""
    echo "Usage: $0 [OPTIONS] [SKILL_NAMES...]"
    echo ""
    echo "Options:"
    echo "  -l, --list   List available skills"
    echo "  -a, --all    Install all skills"
    echo "  -h, --help   Show this help"
    echo ""
    echo "Examples:"
    echo "  $0 --list                           # List available skills"
    echo "  $0 --all                            # Install all skills"
    echo "  $0 dotnet-test dotnet-dependency    # Install specific skills"
}

list_skills() {
    echo "Available skills:"
    echo ""
    for skill_dir in "$SKILLS_SRC"/*/; do
        if [ -f "$skill_dir/SKILL.md" ]; then
            skill_name=$(basename "$skill_dir")
            desc=$(grep -m1 "^description:" "$skill_dir/SKILL.md" | sed 's/^description: *//' | cut -c1-60)
            printf "  %-20s %s\n" "$skill_name" "$desc..."
        fi
    done
}

install_skill() {
    local skill_name="$1"
    local src="$SKILLS_SRC/$skill_name"
    local dest="$TARGET_DIR/$skill_name"

    if [ ! -d "$src" ]; then
        echo "Error: Skill '$skill_name' not found"
        return 1
    fi

    echo "Installing $skill_name -> $dest"
    mkdir -p "$dest"
    cp -r "$src"/* "$dest"/
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -l|--list)
            list_skills
            exit 0
            ;;
        -a|--all)
            for skill_dir in "$SKILLS_SRC"/*/; do
                if [ -f "$skill_dir/SKILL.md" ]; then
                    SKILLS_TO_INSTALL+=("$(basename "$skill_dir")")
                fi
            done
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
        *)
            SKILLS_TO_INSTALL+=("$1")
            shift
            ;;
    esac
done

if [ ${#SKILLS_TO_INSTALL[@]} -eq 0 ]; then
    echo "No skills specified. Use --all or provide skill names."
    echo ""
    usage
    exit 1
fi

mkdir -p "$TARGET_DIR"

echo "Installing to $TARGET_DIR"
echo ""

for skill in "${SKILLS_TO_INSTALL[@]}"; do
    install_skill "$skill"
done

echo ""
echo "Done! Installed ${#SKILLS_TO_INSTALL[@]} skill(s)."
