# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for shell, editors, git, and terminal tools. The repository is designed to be symlinked to the home directory using the included rakefile.

## Setup Commands

```bash
# Install dotfiles by creating symlinks to home directory
rake
```

`rake` also runs one setup step that is not a symlink (`rake bat_theme` runs it on
its own):

- delta's syntax theme is copied, not symlinked, because bat only reads themes from
  its own cache -- so the copy is followed by `bat cache --build`. The theme ships
  with the tokyonight.nvim plugin, which keeps it in step with the editor
  colorscheme; bat identifies it by *filename* (`tokyonight_night`), not by the
  `TokyoNight` name inside the file. On a brand-new machine lazy.nvim has not
  cloned the plugin yet, so this step skips until nvim has been opened once. It
  compares current state first and no-ops when it already matches.

Everything else the configs shell out to comes from the Brewfile via `rake brew`.

The rakefile symlinks every tracked top-level dotfile (per `git ls-files`, excluding
`.gitignore` and `.claude`) to `~/`, the tracked files under `.claude/` individually,
the `ignore` file to `$XDG_CONFIG_HOME/git/`, and `nvim/` and `ghostty/` to
`$XDG_CONFIG_HOME/`. It prompts before overwriting existing files (options: y/n/a/q),
and a prompt with no tty on stdin declines rather than aborting the run.

## Key Configuration Files

### Shell (zsh)

- `.zshrc` - Main shell configuration
- `.zsh_customizations/shell.zsh` - Completion, history, key bindings and prompt (replaces oh-my-zsh)
- `.zprofile` - Adds Homebrew to PATH
- `.zsh_customizations/themes/kramer.zsh-theme` - Custom prompt with git status and virtualenv indicators

### Editors

**Neovim (primary):**

- `nvim/init.lua` - Main configuration using lazy.nvim plugin manager
- `nvim/lua/plugins/` - Modular plugin configurations (conform, nvim-lint, fzf, treesitter, etc.)
- Requires the `tree-sitter` CLI (`brew install tree-sitter-cli`): nvim-treesitter's `main` branch compiles parsers from grammar, so without the CLI parser builds fail and stale parsers cause query errors at startup.

### Other Tools

- `.gitconfig` - Git aliases and settings
- `.tmux.conf` - Tmux with Ctrl-A prefix and vi-style navigation
- `.gemrc` - RubyGems configuration
- `.psqlrc` - PostgreSQL client configuration
- `.ruby-version` - Ruby version. Nothing reads it since mise was dropped; kept as a
  declaration of intent for tools that look for it
- `.rspec` - RSpec default options

## Key Conventions

**Leader key:** `,` (comma)

**Common mappings:**

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

- **Plugin management:** lazy.nvim
- **LSP:** Neovim 0.12's native `vim.lsp.enable()`; nvim-lspconfig is present only to
  supply the `lsp/` server definitions on the runtimepath. Servers install via Homebrew.
  ts_ls only starts where it can find a `tsserver.js`, which it resolves from the
  workspace copy first and then from whatever `tsc` is on PATH, so JS projects without
  one no longer raise an error. Homebrew's `typescript` is 7.x, which dropped that file
  (native Go compiler), so there is deliberately no global TypeScript: ts_ls works in
  projects that pin their own 5.x and stays quiet elsewhere.
  `lazydev.nvim` feeds lua_ls the Neovim API types when editing this repo.
- **Completion:** blink.cmp (pinned to `1.*` for its prebuilt Rust fuzzy matcher)
- **Color scheme:** Tokyo Night (consistent across tmux, Neovim, and FZF)
- **Formatting:** conform.nvim for auto-format on save (Ruby, Python, JavaScript)
- **Linting:** nvim-lint for async linting (Ruby, Python, JavaScript)
- **Runtime versions:** Unmanaged. Ruby and Node come from Homebrew as dependencies of
  the language servers (ruby <- ruby-lsp, node <- the JS/TS/YAML/Python servers) and
  float with `brew upgrade`. chruby + nvm, then mise, each managed them in turn; mise
  was dropped once it was doing nothing but pinning one npm package.
