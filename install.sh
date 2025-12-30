#!/usr/bin/env bash
set -euo pipefail

force="no"

for arg in "$@"; do
  case "$arg" in
    --force) force="yes" ;;
    -h|--help)
      cat <<'EOF'
Usage: ./install.sh [--force]

Install the nvim-jump skill into ~/.codex/skills (or $CODEX_HOME/skills).

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

cp -r "$src" "$dest"

echo "installed nvim-jump to $dest"
