#!/usr/bin/env bash
set -euo pipefail

file="${1:?path required}"
line="${2:-1}"
col="${3:-1}"
server="${NVIM_SERVER:-/tmp/nvimsocket}"

# Requires: nvr (neovim-remote)
nvr --servername "$server" +"call cursor(${line},${col})" "$file"
