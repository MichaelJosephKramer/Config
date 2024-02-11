# ******************************************************************************
# oh-my-zsh SETUP
# ******************************************************************************

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customizations
ZSH_THEME="kramer"

COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"

plugins=(bundler chruby git rails tmuxinator rake)

source $ZSH/oh-my-zsh.sh

# ******************************************************************************
# SOURCE FILES
# ******************************************************************************

# chruby
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmuxinator configuration
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# ******************************************************************************
# EXPORTS
# ******************************************************************************

# Export neovim as the editor
export EDITOR=nvim

# Export the fd as the fzf default command
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || fd --type f --hidden --follow --exclude .git)'

# Export the XDG location
export XDG_CONFIG_HOME="$HOME/.config"

# ******************************************************************************
# ALIASES
# ******************************************************************************

# Tmuxinator autocompletion
alias mux=tmuxinator

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/michael/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
