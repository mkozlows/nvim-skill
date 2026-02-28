# nvim-jump

Open files or jump to locations in an existing Neovim instance via `nvr` (neovim-remote). Includes a quickfix helper for multi-result jumps.

Works with both **Codex** and **Claude Code**.

## Requirements

- `nvr` available in PATH (`pip install neovim-remote`)
- A running Neovim instance with a known server name
  - Example: `nvim --listen /tmp/nvimsocket`
  - Or export `NVIM_SERVER=/path/to/socket`

## Install

Clone this repo, then run the installer:

```bash
./install.sh
```

This installs:

- Scripts to `~/.local/share/nvim-jump/`
- Codex skill to `~/.codex/skills/nvim-jump/`
- Claude Code command to `~/.claude/commands/nvim-jump.md`

Use `--force` to replace an existing installation.

### Manual install

**Codex:**

```bash
mkdir -p ~/.codex/skills
cp -r .codex/skills/nvim-jump ~/.codex/skills/
```

**Claude Code:**

```bash
mkdir -p ~/.claude/commands ~/.local/share/nvim-jump
cp .claude/commands/nvim-jump.md ~/.claude/commands/
cp -r .codex/skills/nvim-jump/scripts ~/.local/share/nvim-jump/
```

## Sandbox note

If Codex or Claude Code runs in a sandbox, it may not be able to reach your host Neovim socket (for example `/tmp/nvimsocket`) without approval. You can avoid repeated approvals by running with full filesystem access or by running Neovim inside the same environment.

## Usage

### Codex

- "Use $nvim-jump to open `/abs/path/file.ts` at 12:5"
- "Use $nvim-jump to put these 8 matches into quickfix"

### Claude Code

- "/nvim-jump open `/abs/path/file.ts` at 12:5"
- "/nvim-jump put these 8 matches into quickfix"
