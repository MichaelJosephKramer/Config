ZSH_THEME_PREFIX='🥃'

function my_git_prompt() {
  local INDEX
  INDEX=$(git status --branch --porcelain 2>/dev/null) || return

  local STATUS=""

  # parse branch name from header: "## branch...origin/branch [ahead N]"
  local BRANCH="${INDEX%%$'\n'*}"  # first line only
  BRANCH="${BRANCH#\#\# }"         # strip "## "
  BRANCH="${BRANCH%%...*}"         # strip "...origin/branch"
  BRANCH="${BRANCH%%\ \[*}"        # strip " [ahead N]"

  # is branch ahead? (parsed from --branch porcelain header)
  if [[ "$INDEX" =~ '\[ahead' ]]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if [[ "$INDEX" =~ $'\n'[DMARC][\ MD]\ ' ' ]]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if [[ "$INDEX" =~ $'\n'[\ MARC][MD]\ ' ' ]]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if [[ "$INDEX" =~ $'\n''\\?\\? ' ]]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if [[ "$INDEX" =~ $'\n'[ADU][ADU]\ ' ' ]]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  # is anything stashed? (fast path for standard repos, --git-common-dir for worktrees)
  if [[ -f ".git/refs/stash" ]] || [[ -f "$(git rev-parse --git-common-dir 2>/dev/null)/refs/stash" ]]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${BRANCH:-'(no branch)'}$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo "%{$fg[red]%}*`basename $VIRTUAL_ENV` ${reset_color%}"
}

if [[ -z $SSH_CLIENT ]]; then
    PROMPT_HOST=''
else
    PROMPT_HOST=" %{$fg_bold[black]%}%M"
fi

PROMPT='$ZSH_THEME_PREFIX ${PROMPT_HOST}%{$fg[green]%} %c $(virtualenv_info)$(my_git_prompt)%{$fg[green]%}|> %{$reset_color%}'

GIT_SYMBOL=" "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}( %{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[white]%} ) %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[magenta]%}○"
