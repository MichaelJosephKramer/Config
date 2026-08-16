# Brewfile — Homebrew dependencies for these dotfiles.
#
# Install everything with:
#   brew bundle           # uses ./Brewfile by default
#
# This is a curated list of the tools the configs in this repo rely on,
# not a full snapshot of the machine. Run `brew bundle dump --force` if you
# ever want to regenerate it from everything currently installed.

# --- Editor & terminal ---
brew "neovim"                    # primary editor (nvim/)
brew "tree-sitter-cli"           # REQUIRED by nvim-treesitter main branch to compile parsers
brew "tmux"                      # .tmux.conf
brew "reattach-to-user-namespace" # macOS clipboard support for tmux

# --- Search & navigation (fzf-lua + shell) ---
brew "fzf"                       # ,t / ,f / ,b pickers, shell fuzzy-find
brew "fd"                        # fzf-lua file traversal
brew "ripgrep"                   # ,r ripgrep search
brew "bat"                       # syntax-highlighted previews
brew "zoxide"                    # `z <dir>` frecent directory jumping (.zshrc)

# --- Interactive shell (sourced from Homebrew in .zshrc) ---
brew "zsh-autosuggestions"       # fish-style history suggestions (→ to accept)
brew "zsh-syntax-highlighting"   # command-line syntax highlighting (sourced last)

# --- Git ---
brew "git"
brew "gh"                        # GitHub CLI
brew "glab"                      # GitLab CLI

# --- Ruby (chruby, see CLAUDE.md) ---
brew "chruby"
brew "ruby-install"

# --- Formatters & linters (conform.nvim + nvim-lint) ---
brew "stylua"                    # Lua formatter
brew "ruff"                      # Python format + lint
brew "luacheck"                  # Lua lint
brew "yamllint"                  # YAML lint
brew "markdownlint-cli"          # Markdown lint

# --- Misc CLI ---
brew "jq"                        # JSON wrangling

# Tools referenced by the configs but NOT installed via Homebrew:
#   prettierd, eslint_d  -> npm install -g @fsouza/prettierd eslint_d
#   rubocop              -> gem install rubocop (or via bundler)
#   nvm                  -> https://github.com/nvm-sh/nvm (node version manager)
