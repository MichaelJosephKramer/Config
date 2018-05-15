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

# Export the custom term
export TERM="xterm-256color"

# Tmuxinator configuration
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Tmuxinator autocompletion
alias mux=tmuxinator

# fzf configuration
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Custom aliases
alias lsa="ls -al"

# Editor
export EDITOR="/usr/local/bin/nvim"

#IEx
export ERL_AFLAGS="-kernel shell_history enabled"
