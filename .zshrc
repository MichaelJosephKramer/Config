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

# chruby (lazy-loaded). Ruby is used only occasionally, so we don't source it at
# startup. It loads on the first `chruby` call, or the first time we cd into a
# directory with a .ruby-version; auto.sh then takes over auto-switching.
lazy_load_chruby() {
  unset -f chruby chruby_auto
  add-zsh-hook -d chpwd _chruby_on_ruby_dir
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby_auto
}
chruby() { lazy_load_chruby && chruby "$@"; }
chruby_auto() { lazy_load_chruby; }
_chruby_on_ruby_dir() { [[ $PWD != $HOME && -f .ruby-version ]] && lazy_load_chruby; }
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _chruby_on_ruby_dir

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--color=fg:#c0caf5,bg:-1,hl:#ff9e64 --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a --border --layout=reverse'

# tmuxinator
alias mux=tmuxinator

# nvm Config (lazy-loaded for faster shell startup)
export NVM_DIR="$HOME/.config/nvm"
lazy_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}
nvm() { lazy_load_nvm && nvm "$@"; }
node() { lazy_load_nvm && node "$@"; }
npm() { lazy_load_nvm && npm "$@"; }
npx() { lazy_load_nvm && npx "$@"; }

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
