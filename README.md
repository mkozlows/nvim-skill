# nvim-jump Codex skill

Open files or jump to locations in an existing Neovim instance via `nvr` (neovim-remote). Includes a quickfix helper for multi-result jumps.

## Requirements

- `nvr` available in PATH
- A running Neovim instance with a known server name
  - Example: `nvim --listen /tmp/nvimsocket`
  - Or export `NVIM_SERVER=/path/to/socket`

## Install

Clone this repo, then run the installer:

```bash
./install.sh
```

Manual install (if you prefer):

```bash
mkdir -p ~/.codex/skills
cp -r /path/to/this/repo/.codex/skills/nvim-jump ~/.codex/skills/
```

## Sandbox note

If Codex runs in a sandbox, it may not be able to reach your host Neovim socket (for example `/tmp/nvimsocket`) without approval. You can avoid repeated approvals by running Codex with full filesystem access or by running Neovim inside the same environment as Codex.

## Usage (examples)

- Open a specific location:
  - “Use $nvim-jump to open `/abs/path/file.ts` at 12:5”
- Populate quickfix from multiple results:
  - “Use $nvim-jump to put these 8 matches into quickfix”
