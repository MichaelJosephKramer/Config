# --- what oh-my-zsh was providing, hand-rolled ---
autoload -U colors && colors                 # $fg / $reset_color for the theme
[[ -d $HOME/.cache/zsh ]] || mkdir -p $HOME/.cache/zsh
autoload -Uz compinit && compinit -C         # -C skips the slow security audit
setopt PROMPT_SUBST                          # theme uses $(...) in PROMPT

# completion behaviour (from omz lib/completion.zsh)
WORDCHARS=''                    # Ctrl-W deletes one path segment, not the path
unsetopt menu_complete          # do not autoselect the first entry
unsetopt flowcontrol            # frees Ctrl-S / Ctrl-Q
setopt auto_menu                # successive TAB cycles the menu
setopt complete_in_word         # complete from the cursor, mid-word
setopt always_to_end            # cursor to end after an unambiguous completion
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$HOME/.cache/zsh"
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# key bindings (from omz lib/key-bindings.zsh)
# $terminfo values are only valid while the terminal is in application mode, so
# the bindings below silently no-op without this.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init()   { echoti smkx }
  function zle-line-finish() { echoti rmkx }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -e                      # emacs mode; without this EDITOR=nvim implies vi
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# Each terminfo lookup is guarded: on a TERM with no terminfo entry (a remote
# host without xterm-ghostty, say) the value is empty and bindkey errors out.
[[ -n "${terminfo[kcuu1]}" ]] && bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
[[ -n "${terminfo[kcud1]}" ]] && bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
[[ -n "${terminfo[khome]}" ]] && bindkey "${terminfo[khome]}" beginning-of-line
[[ -n "${terminfo[kend]}"  ]] && bindkey "${terminfo[kend]}"  end-of-line
[[ -n "${terminfo[kcbt]}"  ]] && bindkey "${terminfo[kcbt]}"  reverse-menu-complete
bindkey '^[[3~'   delete-char                               # delete
bindkey '^[[1;5C' forward-word                              # ctrl-right
bindkey '^[[1;5D' backward-word                             # ctrl-left

# history (from omz lib/history.zsh)
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000                 # omz defaulted this to 10000, below HISTSIZE
# inc_append_history is deliberately absent: share_history already implies it.
setopt extended_history hist_expire_dups_first hist_ignore_dups \
       hist_ignore_space hist_verify share_history
# zsh's bare `history` shows only the last 16; omz aliased it to show all.
alias history='fc -l 1'

# misc + appearance (omz lib/misc.zsh, lib/theme-and-appearance.zsh, lib/grep.zsh)
# auto_cd deliberately omitted: zoxide's `z` covers directory jumping.
setopt interactivecomments      # allow # comments on the command line
setopt multios                  # zsh multiple redirection
export LSCOLORS="Gxfxcxdxbxegedabagacad"   # BSD ls colors; ls -G is bare without it
export LESS=-R                  # pass ANSI through the pager (delta needs this)
alias ls='ls -G'; alias l='ls -lah'; alias la='ls -lAh'; alias ll='ls -lh'
alias grep='grep --color=auto --exclude-dir={.git,.hg,.svn,node_modules}'
alias diff='diff --color'

source $HOME/.zsh_customizations/themes/kramer.zsh-theme
