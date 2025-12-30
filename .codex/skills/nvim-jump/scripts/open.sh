#!/usr/bin/env bash
set -euo pipefail

file="${1:?path required}"
line="${2:-1}"
col="${3:-1}"
server="${NVIM_SERVER:-/tmp/nvimsocket}"

# Requires: nvr (neovim-remote)
if ! nvr --servername "$server" +"call cursor(${line},${col})" "$file"; then
  # Fall back to a new tab to avoid "no write since last change" errors.
  nvr --servername "$server" --remote-tab +"call cursor(${line},${col})" "$file"
fi
