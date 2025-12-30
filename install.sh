#!/usr/bin/env bash
set -euo pipefail

mode="link"
force="no"

for arg in "$@"; do
  case "$arg" in
    --copy) mode="copy" ;;
    --link) mode="link" ;;
    --force) force="yes" ;;
    -h|--help)
      cat <<'EOF'
Usage: ./install.sh [--link|--copy] [--force]

Install the nvim-jump skill into ~/.codex/skills (or $CODEX_HOME/skills).

  --link   Create a symlink (default)
  --copy   Copy the skill directory instead of linking
  --force  Replace an existing installation
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
src="${repo_root}/.codex/skills/nvim-jump"
codex_home="${CODEX_HOME:-$HOME/.codex}"
dest_dir="${codex_home}/skills"
dest="${dest_dir}/nvim-jump"

if [[ ! -d "$src" ]]; then
  echo "skill source not found: $src" >&2
  exit 1
fi

mkdir -p "$dest_dir"

if [[ -e "$dest" || -L "$dest" ]]; then
  if [[ "$force" != "yes" ]]; then
    echo "destination exists: $dest (use --force to replace)" >&2
    exit 1
  fi
  rm -rf "$dest"
fi

if [[ "$mode" == "copy" ]]; then
  cp -r "$src" "$dest"
else
  ln -s "$src" "$dest"
fi

echo "installed nvim-jump to $dest"
