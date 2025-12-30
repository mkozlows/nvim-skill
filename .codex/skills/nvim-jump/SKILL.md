---
name: nvim-jump
description: Open or jump to a file location in an existing Neovim instance via nvr. Use when the user asks to open/jump in nvim, when Codex should open a specific file:line:col in Neovim, or when Codex should populate Neovim quickfix with search results.
---

# Nvim Jump

## Quick start

- Run `scripts/open.sh <abs-path> <line> <col>` to open a file in a new tab and jump to a cursor location.
- Run `scripts/quickfix.sh <qf-file>` after writing a quickfix file with `path:line:col: message` lines.

## Inputs and defaults

- Always pass absolute paths.
- If line/col are unknown, use 1/1.
- Use `$NVIM_SERVER` when set; otherwise `/tmp/nvimsocket`.

## Quickfix format

- One entry per line: `/abs/path/to/file:line:col: message`
- Write the file (for example, `/tmp/codex.qf`) then call `scripts/quickfix.sh /tmp/codex.qf`.

## Notes

- Require `nvr` (neovim-remote) available in PATH.
- Ensure Neovim is running with its server name matching `$NVIM_SERVER` (or `/tmp/nvimsocket`).
