# Add XDG location
export XDG_CONFIG_HOME="$HOME/.config"

source $HOME/.bash/git-completion.bash
source $HOME/.bash/prompt.bash

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Tmuxinator configuration
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Tmuxinator autocompletion
alias mux=tmuxinator

# fzf configuration
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Custom aliases
alias lsa="ls -al"

# Editor
export EDITOR="/usr/local/bin/vim"

# IEx
export ERL_AFLAGS="-kernel shell_history enabled"

# Source Elixir
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/michael/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;