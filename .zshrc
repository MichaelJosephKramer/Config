# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customizations

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kramer"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler git rails tmuxinator)

source $ZSH/oh-my-zsh.sh

# Tmuxinator configuration
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export EDITOR=vim

# Tmuxinator autocompletion
alias mux=tmuxinator

# Aliases
alias trash='sudo rm -Rf ~/.Trash/*'
alias speedup='sudo rm -rf /private/var/log/asl/*.asl'
alias clean_gems='for i in `gem list --no-versions`; do gem uninstall -aIx $i; done'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Eliminate XCode 5.1 Clang error
export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"

# Load chruby if present
if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  chruby ruby-2.1.1
fi
