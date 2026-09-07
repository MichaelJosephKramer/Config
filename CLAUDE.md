# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for shell, editors, git, and terminal tools. The repository is designed to be symlinked to the home directory using the included rakefile.

## Setup Commands

```bash
# Install dotfiles by creating symlinks to home directory
rake
```

delta's syntax theme is not symlinked, because bat only reads themes from its own
cache. On a new machine, install it once after `brew bundle`:

```bash
mkdir -p ~/.config/bat/themes
cp ~/.local/share/nvim/lazy/tokyonight.nvim/extras/sublime/tokyonight_night.tmTheme \
  ~/.config/bat/themes/
bat cache --build
```

The theme ships with the tokyonight.nvim plugin, so it stays in step with the editor
colorscheme. bat identifies it by *filename* (`tokyonight_night`), not by the `TokyoNight`
name inside the file.

The rakefile symlinks all dotfiles (`.*` excluding `.git*`) to `~/`, the `ignore` file to `$XDG_CONFIG_HOME/git/`, and `nvim/` to `$XDG_CONFIG_HOME/nvim/`. It prompts before overwriting existing files (options: y/n/a/q).

## Key Configuration Files

### Shell (zsh)

- `.zshrc` - Main shell configuration using oh-my-zsh
- `.zprofile` - Adds Homebrew to PATH
- `.zsh_customizations/themes/kramer.zsh-theme` - Custom prompt with git status and virtualenv indicators

### Editors

**Neovim (primary):**

- `nvim/init.lua` - Main configuration using lazy.nvim plugin manager
- `nvim/lua/plugins/` - Modular plugin configurations (conform, nvim-lint, fzf, treesitter, etc.)
- Requires the `tree-sitter` CLI (`brew install tree-sitter-cli`): nvim-treesitter's `main` branch compiles parsers from grammar, so without the CLI parser builds fail and stale parsers cause query errors at startup.

**Vim (legacy):**

- `.vimrc` - Sources modular configs from `.vim/`
- `.vim/plugins.vim` - vim-plug based plugin definitions
- `.vim/general.vim` - Core settings

### Other Tools

- `.gitconfig` - Git aliases and settings
- `.tmux.conf` - Tmux with Ctrl-A prefix and vi-style navigation
- `.gemrc` - RubyGems configuration
- `.psqlrc` - PostgreSQL client configuration
- `.ruby-version` - Ruby version, read by mise
- `.rspec` - RSpec default options

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

**LSP mappings** (active when a server attaches):

- `gd` - Go to definition (fzf-lua)
- `gD` - Go to declaration
- `grr` / `gri` - References / implementations (fzf-lua)
- `grn` / `gra` - Rename / code action (Neovim built-in defaults)
- `K` - Hover docs
- `,s` - Document symbols
- `,h` - Toggle inlay hints

**Completion (blink.cmp):** `<C-space>` open, `<C-n>`/`<C-p>` navigate, `<C-y>` accept,
`<C-e>` dismiss. `<Tab>` is left to copilot.vim for accepting ghost text.

**Tmux prefix:** `Ctrl-A`

- `|` - Vertical split
- `-` - Horizontal split
- `hjkl` - Navigate panes

## Architecture Notes

- **Plugin management:** Neovim uses lazy.nvim; Vim uses vim-plug
- **LSP:** Neovim 0.12's native `vim.lsp.enable()`; nvim-lspconfig is present only to
  supply the `lsp/` server definitions on the runtimepath. Servers install via Homebrew.
  ts_ls only starts where it can find a `tsserver.js` (workspace copy first, then the
  mise-global `typescript@5`), so JS projects without one no longer raise an error.
  `lazydev.nvim` feeds lua_ls the Neovim API types when editing this repo.
- **Completion:** blink.cmp (pinned to `1.*` for its prebuilt Rust fuzzy matcher)
- **Color scheme:** Tokyo Night (consistent across tmux, Neovim, and FZF)
- **Formatting:** conform.nvim for auto-format on save (Ruby, Python, JavaScript)
- **Linting:** nvim-lint for async linting (Ruby, Python, JavaScript); Vim still uses ALE
- **Runtime versions:** Managed via mise, which reads `.ruby-version` and `.nvmrc`
  directly (the chruby-style `ruby-` prefix is understood). Replaced chruby + nvm
  and the lazy-loading shims they required. Currently Ruby 4.0.6, Node 22.17.1.
