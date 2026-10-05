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

# --- Language servers (nvim/lua/plugins/lsp.lua) ---
brew "lua-language-server"       # lua_ls
brew "ruby-lsp"                  # ruby_lsp
brew "typescript-language-server" # ts_ls (javascript + typescript)
brew "pyright"                   # pyright — types only, matches CI's pyright gate; ruff owns lint/format
brew "yaml-language-server"      # yamlls

# --- Formatters & linters (conform.nvim + nvim-lint) ---
brew "stylua"                    # Lua formatter
brew "ruff"                      # Python format + lint
brew "luacheck"                  # Lua lint
brew "yamllint"                  # YAML lint
brew "markdownlint-cli"          # Markdown lint
brew "rubocop"                   # Ruby lint + format
brew "eslint_d"                  # JS/TS lint daemon

# --- Misc CLI ---
brew "jq"                        # JSON wrangling

# Ruby and Node are not listed: they arrive as dependencies of the language servers
# above (ruby <- ruby-lsp, node <- the JS/TS/YAML/Python servers), and nothing here
# pins their versions.
#
# Tools referenced by the configs but NOT installed via Homebrew:
# prettierd is a plain global npm install under Homebrew's node prefix.
#
# TypeScript is deliberately absent. ts_ls needs tsserver.js, which TypeScript 7
# dropped and Homebrew's formula followed, so the only global copy Homebrew can offer
# is one ts_ls cannot use. nvim/lua/plugins/lsp.lua prefers a workspace
# node_modules/typescript and simply does not start the server when there is none.
