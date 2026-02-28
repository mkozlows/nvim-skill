#!/usr/bin/env bash
set -euo pipefail

force="no"

for arg in "$@"; do
  case "$arg" in
    --force) force="yes" ;;
    -h|--help)
      cat <<'EOF'
Usage: ./install.sh [--force]

Install the nvim-jump skill for Codex and Claude Code.

Installs:
  - Scripts to ~/.local/share/nvim-jump/
  - Codex skill to ~/.codex/skills/nvim-jump/
  - Claude Code command to ~/.claude/commands/nvim-jump.md

  --force  Replace existing installations
EOF
      exit 0
      ;;
    *)
      echo "Unknown option: $arg" >&2
      exit 1
      ;;
  esac
done

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_dir() {
  local src="$1" dest="$2" label="$3"
  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$force" != "yes" ]]; then
      echo "destination exists: $dest (use --force to replace)" >&2
      return 1
    fi
    rm -rf "$dest"
  fi
  mkdir -p "$(dirname "$dest")"
  cp -r "$src" "$dest"
  echo "installed $label to $dest"
}

install_file() {
  local src="$1" dest="$2" label="$3"
  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$force" != "yes" ]]; then
      echo "destination exists: $dest (use --force to replace)" >&2
      return 1
    fi
    rm -f "$dest"
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "installed $label to $dest"
}

# --- shared scripts ---
scripts_src="${repo_root}/.codex/skills/nvim-jump/scripts"
scripts_dest="$HOME/.local/share/nvim-jump/scripts"

if [[ ! -d "$scripts_src" ]]; then
  echo "skill source not found: $scripts_src" >&2
  exit 1
fi

install_dir "$scripts_src" "$scripts_dest" "scripts"

# --- Codex skill ---
codex_src="${repo_root}/.codex/skills/nvim-jump"
codex_home="${CODEX_HOME:-$HOME/.codex}"
codex_dest="${codex_home}/skills/nvim-jump"

install_dir "$codex_src" "$codex_dest" "Codex skill"

# --- Claude Code command ---
claude_src="${repo_root}/.claude/commands/nvim-jump.md"
claude_home="${CLAUDE_HOME:-$HOME/.claude}"
claude_dest="${claude_home}/commands/nvim-jump.md"

install_file "$claude_src" "$claude_dest" "Claude Code command"
