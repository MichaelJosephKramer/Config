# ******************************************************************************
# oh-my-zsh SETUP
# ******************************************************************************

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customizations
ZSH_THEME="kramer"

COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"

# No oh-my-zsh plugins: git workflow runs through .gitconfig aliases, and the
# kramer theme renders the virtualenv indicator itself (see the
# VIRTUAL_ENV_DISABLE_PROMPT export below).
plugins=()

source $ZSH/oh-my-zsh.sh

# ******************************************************************************
# EXPORTS
# ******************************************************************************

# Export neovim as the editor
export EDITOR=nvim

# Export the XDG location
export XDG_CONFIG_HOME="$HOME/.config"

# Keep a venv's activate script from injecting its own prefix into the prompt
# (the kramer theme shows the virtualenv itself). Replaces the virtualenv plugin.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ******************************************************************************
# TOOLS
# ******************************************************************************

# zsh-autosuggestions — fish-style suggestions from history (→ to accept).
# Sourced from Homebrew and guarded so shells without it still start cleanly.
[ -f "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] &&
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zoxide — smarter cd; `z <dir>` jumps to frecent dirs, `zi` picks interactively
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# mise — manages Ruby and Node (replaces chruby + nvm, and the lazy-loading
# shims both used to need). It reads the existing .ruby-version and .nvmrc
# files directly; the chruby-style `ruby-` prefix is understood and stripped.
command -v mise >/dev/null && eval "$(mise activate zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--color=fg:#c0caf5,bg:-1,hl:#ff9e64 --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a --border --layout=reverse'

# tmuxinator
alias mux=tmuxinator

# Docker CLI completions (portable across machines; oh-my-zsh already ran
# compinit above, so only re-run it here when the completions dir exists)
if [ -d "$HOME/.docker/completions" ]; then
  fpath=("$HOME/.docker/completions" $fpath)
  autoload -Uz compinit && compinit
fi

# Source secrets (not tracked in git)
[ -f ~/.secrets ] && source ~/.secrets

# zsh-syntax-highlighting — MUST be sourced last, after all aliases and widgets
[ -f "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
