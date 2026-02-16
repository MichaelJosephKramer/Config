# ******************************************************************************
# oh-my-zsh SETUP
# ******************************************************************************

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customizations
ZSH_THEME="kramer"

COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"

plugins=(bundler chruby git rails rake virtualenv)

source $ZSH/oh-my-zsh.sh

# ******************************************************************************
# EXPORTS
# ******************************************************************************

# Export neovim as the editor
export EDITOR=nvim

# Export the XDG location
export XDG_CONFIG_HOME="$HOME/.config"

# ******************************************************************************
# TOOLS
# ******************************************************************************

# chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a --border --layout=reverse'

# tmuxinator configuration
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
alias mux=tmuxinator

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/michael/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

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

export PATH="$HOME/.local/bin:$PATH"
