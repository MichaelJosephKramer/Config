ZSH_THEME_PREFIX='🥃'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}(  %{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[white]%} ) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[magenta]%}↓"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[magenta]%}○"

function my_git_prompt() {
  local output
  output=$(git status --branch --porcelain 2>/dev/null) || return

  # parse header: "## branch...origin/branch [ahead N]"
  local header="${output%%$'\n'*}"
  local branch="${header#\#\# }"
  branch="${branch%%...*}"
  branch="${branch%%\ \[*}"

  local indicators=""
  [[ "$header" == *'[ahead'* ]] && indicators+="$ZSH_THEME_GIT_PROMPT_AHEAD"
  [[ "$header" == *'behind'* ]] && indicators+="$ZSH_THEME_GIT_PROMPT_BEHIND"

  # git status --porcelain shows each file as: XY PATH
  #   X = staged status    (D=deleted, M=modified, A=added, R=renamed, C=copied)
  #   Y = unstaged status  (M=modified, D=deleted)
  #   ?? = untracked       [ADU][ADU] = unmerged
  local nl=$'\n'

  [[ "$output" =~ ${nl}[DMARC] ]]         && indicators+="$ZSH_THEME_GIT_PROMPT_STAGED"
  [[ "$output" =~ ${nl}[\ MARC][MD] ]]    && indicators+="$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  [[ "$output" =~ ${nl}[?][?] ]]          && indicators+="$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  [[ "$output" =~ ${nl}[ADU][ADU] ]]      && indicators+="$ZSH_THEME_GIT_PROMPT_UNMERGED"

  git rev-parse --verify refs/stash &>/dev/null && indicators+="$ZSH_THEME_GIT_PROMPT_STASHED"

  [[ -n "$indicators" ]] && indicators=" $indicators"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${branch:-'(no branch)'}$indicators$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function virtualenv_info {
  [ "$VIRTUAL_ENV" ] && echo "%{$fg[red]%}*$(basename "$VIRTUAL_ENV")%{$reset_color%}"
}

if [[ -z $SSH_CLIENT ]]; then
    PROMPT_HOST=''
else
    PROMPT_HOST=" %{$fg_bold[black]%}%M"
fi

PROMPT='$ZSH_THEME_PREFIX ${PROMPT_HOST}%{$fg[green]%} %c $(virtualenv_info)$(my_git_prompt)%{$fg[green]%}|> %{$reset_color%}'
