#!/bin/bash
# Install mydearmentor skill for AI coding agents without marketplace
# Usage: ./install.sh [-a agent] [-s scope] [-p project_path]

set -e

AGENT="all"
SCOPE="global"
PROJECT_PATH="$(pwd)"

while getopts "a:s:p:h" opt; do
    case $opt in
        a) AGENT="$OPTARG" ;;
        s) SCOPE="$OPTARG" ;;
        p) PROJECT_PATH="$OPTARG" ;;
        h)
            echo "Usage: $0 [-a agent] [-s scope] [-p project_path]"
            echo "  -a agent   : claude, codex, gemini, or all (default: all)"
            echo "  -s scope   : global or project (default: global)"
            echo "  -p path    : project path for project scope (default: current dir)"
            echo ""
            echo "Note: For Claude Code, prefer using:"
            echo "  /plugin install mydearmentor@qs3c/my-dear-mentor"
            exit 0
            ;;
        *)
            echo "Invalid option. Use -h for help."
            exit 1
            ;;
    esac
done

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_FILE="$(dirname "$SCRIPT_DIR")/skills/mydearmentor/SKILL.md"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file not found: $SOURCE_FILE"
    exit 1
fi

install_claude() {
    local scope=$1
    local project_path=$2

    if [ "$scope" = "global" ]; then
        target_dir="$HOME/.claude/skills/mydearmentor"
    else
        target_dir="$project_path/.claude/skills/mydearmentor"
    fi

    mkdir -p "$target_dir"
    cp "$SOURCE_FILE" "$target_dir/SKILL.md"
    echo "[Claude Code] Installed to: $target_dir/SKILL.md"
    echo "  Tip: You can also use /plugin install mydearmentor@qs3c/my-dear-mentor"
}

install_codex() {
    local scope=$1
    local project_path=$2

    if [ "$scope" = "global" ]; then
        codex_home="${CODEX_HOME:-$HOME/.codex}"
        target_dir="$codex_home/skills/mydearmentor"
    else
        target_dir="$project_path/.codex/skills/mydearmentor"
    fi

    mkdir -p "$target_dir"
    cp "$SOURCE_FILE" "$target_dir/SKILL.md"
    echo "[Codex] Installed to: $target_dir/SKILL.md"
}

install_gemini() {
    local scope=$1
    local project_path=$2

    if [ "$scope" = "global" ]; then
        target_dir="$HOME/.gemini/skills/mydearmentor"
    else
        target_dir="$project_path/.gemini/skills/mydearmentor"
    fi

    mkdir -p "$target_dir"
    cp "$SOURCE_FILE" "$target_dir/SKILL.md"
    echo "[Gemini CLI] Installed to: $target_dir/SKILL.md"
}

echo "Installing mydearmentor skill..."
echo "Scope: $SCOPE"
[ "$SCOPE" = "project" ] && echo "Project: $PROJECT_PATH"
echo ""

case $AGENT in
    claude) install_claude "$SCOPE" "$PROJECT_PATH" ;;
    codex)  install_codex "$SCOPE" "$PROJECT_PATH" ;;
    gemini) install_gemini "$SCOPE" "$PROJECT_PATH" ;;
    all)
        install_claude "$SCOPE" "$PROJECT_PATH"
        install_codex "$SCOPE" "$PROJECT_PATH"
        install_gemini "$SCOPE" "$PROJECT_PATH"
        ;;
    *)
        echo "Error: Invalid agent '$AGENT'. Use claude, codex, gemini, or all."
        exit 1
        ;;
esac

echo ""
echo "Done!"
