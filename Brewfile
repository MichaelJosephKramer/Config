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
cask "ghostty"                   # terminal emulator (ghostty/config)
cask "font-fantasque-sans-mono-nerd-font" # font both ghostty/config and iTerm2 use

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
brew "git-delta"                 # syntax-highlighted diff pager (.gitconfig)

# --- Runtime versions ---
brew "mise"                      # manages Ruby + Node; reads .ruby-version / .nvmrc

# --- Language servers (nvim/lua/plugins/lsp.lua) ---
brew "lua-language-server"       # lua_ls
brew "ruby-lsp"                  # ruby_lsp
brew "typescript-language-server" # ts_ls (javascript + typescript)
brew "basedpyright"              # basedpyright — types only; ruff owns lint/format
brew "yaml-language-server"      # yamlls

# --- Formatters & linters (conform.nvim + nvim-lint) ---
brew "stylua"                    # Lua formatter
brew "ruff"                      # Python format + lint
brew "luacheck"                  # Lua lint
brew "yamllint"                  # YAML lint
brew "markdownlint-cli"          # Markdown lint

# --- Misc CLI ---
brew "jq"                        # JSON wrangling

# Tools referenced by the configs but NOT installed via Homebrew.
# These are managed by mise so they survive a Node/Ruby upgrade instead of
# vanishing with the runtime they were installed under:
#   mise use -g npm:eslint_d gem:rubocop npm:typescript@5
# typescript@5 is what ts_ls falls back to for projects with no local copy;
# it must stay on 5.x because TypeScript 7 no longer ships tsserver.js.
# prettierd is still a plain global npm install under Homebrew's node prefix.
