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

# fzf -> source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf -> Export the fd as the fzf default command
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || fd --type f --hidden --follow --exclude .git)'

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

# GCP -> The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mkramer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mkramer/google-cloud-sdk/path.zsh.inc'; fi

# GCP -> The next line enables shell command completion for gcloud.
if [ -f '/Users/mkramer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mkramer/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.local/bin:$PATH"
