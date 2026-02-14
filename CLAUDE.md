# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for shell, editors, git, and terminal tools. The repository is designed to be symlinked to the home directory using the included rakefile.

## Setup Commands

```bash
# Install dotfiles by creating symlinks to home directory
rake
```

The rakefile symlinks all dotfiles (`.*` excluding `.git*`) to `~/` and the `ignore` file to `$XDG_CONFIG_HOME/git/`. It prompts before overwriting existing files (options: y/n/a/q). The `nvim/` directory must be separately symlinked to `~/.config/nvim/`.

## Key Configuration Files

### Shell (zsh)
- `.zshrc` - Main shell configuration using oh-my-zsh
- `.zprofile` - Adds Homebrew to PATH
- `.zsh_customizations/themes/kramer.zsh-theme` - Custom prompt with git status and virtualenv indicators

### Editors
**Neovim (primary):**
- `nvim/init.lua` - Main configuration using lazy.nvim plugin manager
- `nvim/lua/plugins/` - Modular plugin configurations (ale, fzf, treesitter, etc.)

**Vim (legacy):**
- `.vimrc` - Sources modular configs from `.vim/`
- `.vim/plugins.vim` - vim-plug based plugin definitions
- `.vim/general.vim` - Core settings

### Other Tools
- `.gitconfig` - Git aliases and settings
- `.tmux.conf` - Tmux with Ctrl-A prefix and vi-style navigation

## Key Conventions

**Leader key:** `,` (comma)

**Common mappings (Neovim/Vim):**
- `kj` - Exit insert mode
- `,w` - Save all files
- `,t` - FZF git files
- `,f` - FZF all files
- `,r` - Ripgrep search
- `,b` - Switch buffers
- `t<C-n>` - Run nearest test
- `t<C-f>` - Run test file

**Tmux prefix:** `Ctrl-A`
- `|` - Vertical split
- `-` - Horizontal split
- `hjkl` - Navigate panes

## Architecture Notes

- **Plugin management:** Neovim uses lazy.nvim; Vim uses vim-plug
- **Color scheme:** Tokyo Night (consistent across tmux, Neovim, and FZF)
- **Linting:** ALE configured for Elixir, Ruby, Rust, JavaScript, Python with auto-fix on save
- **Ruby version:** Managed via chruby (currently 3.1.2)
- **Node version:** Managed via NVM
