# Dotfiles

Personal configuration files for macOS. Covers zsh, Neovim, Vim, tmux, git, and assorted dev tools. Designed to be symlinked to the home directory.

## Quick Start

```bash
# 1. Install prerequisites
brew install git neovim tmux fzf fd ripgrep chruby ruby-install
ruby-install ruby 3.3.6

# 2. Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Clone and install
git clone https://github.com/MichaelJosephKramer/Config.git ~/Config
cd ~/Config && rake
```

The rakefile symlinks all dotfiles to `~/`, the `ignore` file to `$XDG_CONFIG_HOME/git/`, and `nvim/` to `$XDG_CONFIG_HOME/nvim/`. It prompts before overwriting existing files (y/n/a/q).

## What's Inside

### Shell (zsh)

| File | Purpose |
|------|---------|
| `.zshrc` | Main config with oh-my-zsh, lazy-loaded chruby/nvm, FZF setup |
| `.zprofile` | Homebrew shellenv and PATH |
| `.zsh_customizations/themes/kramer.zsh-theme` | Custom prompt with git status and virtualenv |

### Neovim (primary editor)

| File | Purpose |
|------|---------|
| `nvim/init.lua` | Core settings, diagnostics, keymaps, lazy.nvim bootstrap |
| `nvim/lua/plugins/conform.lua` | Auto-format on save (stylua, prettier, ruff, rubocop, eslint_d) |
| `nvim/lua/plugins/nvim-lint.lua` | Async linting (luacheck, markdownlint, ruff, rubocop, eslint_d, yamllint) |
| `nvim/lua/plugins/fzf.lua` | Fuzzy finder with ripgrep integration |
| `nvim/lua/plugins/nvim-treesitter.lua` | Syntax highlighting and incremental selection |
| `nvim/lua/plugins/gitsigns.lua` | Git diff signs in the gutter |
| `nvim/lua/plugins/lualine.lua` | Statusline with Tokyo Night theme |
| `nvim/lua/plugins/tokyonight.lua` | Color scheme |
| `nvim/lua/plugins/vim-test.lua` | Test runner keymaps |
| `nvim/lua/plugins/init.lua` | Copilot, fugitive, surround, unimpaired, vinegar, tabular |

### Vim (legacy)

| File | Purpose |
|------|---------|
| `.vimrc` | Sources modular configs from `.vim/` |
| `.vim/plugins.vim` | vim-plug plugins with ALE for linting |
| `.vim/general.vim` | Core settings |
| `.vim/mappings.vim` | Key mappings |

### Other Tools

| File | Purpose |
|------|---------|
| `.gitconfig` | Aliases, histogram diffs, zdiff3 merges, auto-prune, autoSetupRemote |
| `.tmux.conf` | Ctrl-A prefix, vi copy-mode with pbcopy, Tokyo Night colors |
| `.gemrc` | RubyGems config (`--no-document`) |
| `.psqlrc` | PostgreSQL client formatting and history |
| `.ruby-version` | Ruby 3.3.6 (chruby) |
| `.rspec` | RSpec defaults (`--format doc --color`) |

## Key Mappings

**Leader key:** `,` (comma)

### Neovim / Vim

| Mapping | Action |
|---------|--------|
| `kj` | Exit insert mode |
| `<C-o>` | Exit terminal mode |
| `,w` | Save all files |
| `,t` | FZF git files |
| `,f` | FZF all files |
| `,r` | Ripgrep search |
| `,b` | Switch buffers |
| `,l` | FZF lines |
| `,m` | FZF marks |
| `,e` | Open diagnostic float |
| `t<C-n>` | Run nearest test |
| `t<C-f>` | Run test file |
| `t<C-s>` | Run test suite |
| `t<C-l>` | Run last test |
| `t<C-g>` | Visit test file |
| `<F8>` | Toggle Tagbar |

### Tmux (prefix: `Ctrl-A`)

| Mapping | Action |
|---------|--------|
| `\|` | Vertical split (preserves path) |
| `-` | Horizontal split (preserves path) |
| `h/j/k/l` | Navigate panes |
| `H/J/K/L` | Resize panes |
| `v` | Begin selection (copy mode) |
| `y` | Copy to clipboard (copy mode) |
| `r` | Reload config |

## Color Scheme

Tokyo Night everywhere: Neovim, tmux, and FZF all use a consistent Tokyo Night palette.

## Dependencies

### Required

```bash
# Core tools
brew install git neovim tmux fzf fd ripgrep

# Ruby
brew install chruby ruby-install
ruby-install ruby 3.3.6

# Node
brew install nvm
nvm install --lts

# Shell framework
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Font (for diagnostic icons)
brew install --cask font-hack-nerd-font

# C compiler (treesitter parsers)
xcode-select --install
```

### Linters & Formatters

```bash
# Lua
brew install stylua luacheck

# Markdown / YAML
brew install markdownlint-cli yamllint
npm install -g prettier

# Python
brew install ruff

# JavaScript
npm install -g eslint_d

# Ruby
gem install rubocop
```

### Language-Specific (as needed)

```bash
# Elixir
brew install elixir

# Rust
brew install rust-analyzer
rustup component add rustfmt

# Ruby extras
gem install ruby-lsp bundler rspec tmuxinator

# Python
brew install python

# PostgreSQL
brew install postgresql
```

### Pre-installed on macOS

`zsh`, `less`, `pbcopy`, `curl`, `sed`, `xargs`, `tr`, `column`
