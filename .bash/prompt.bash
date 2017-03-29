# A good prompt
THEME_PREFIX="🍺"

function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(my_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$THEME_GIT_PROMPT_UNMERGED"
  fi

  # is anything stashed?
  if [ "$(git stash list 2>/dev/null)" != "" ]; then
    STATUS="$STATUS$THEME_GIT_PROMPT_STASHED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$THEME_GIT_PROMPT_PREFIX$(my_current_branch)$STATUS$THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  echo "$branch_name"
}

if [[ -z $SSH_CLIENT ]]; then
    PROMPT_HOST=''
else
    PROMPT_HOST=" \[\e[1m\]\[\e[30m\]\h"
fi

THEME_GIT_PROMPT_PREFIX="\[\e[1m\]\[\e[37m\]( \[\e[m\]\[\e[0m\]\[\e[36m\]"
THEME_GIT_PROMPT_SUFFIX="\[\e[m\]\[\e[1m\]\[\e[37m\] )\[\e[m\]\[\e[0m\] "

THEME_GIT_PROMPT_AHEAD="\[\e[1m\]\[\e[35m\]↑\[\e[m\]\[\e[0m\]"
THEME_GIT_PROMPT_STAGED="\[\e[1m\]\[\e[32m\]●\[\e[m\]\[\e[0m\]"
THEME_GIT_PROMPT_UNSTAGED="\[\e[1m\]\[\e[31m\]●\[\e[m\]\[\e[0m\]"
THEME_GIT_PROMPT_UNTRACKED="\[\e[1m\]\[\e[37m\]●\[\e[m\]\[\e[0m\]"
THEME_GIT_PROMPT_UNMERGED="\[\e[1m\]\[\e[31m\]✕\[\e[m\]\[\e[0m\]"
THEME_GIT_PROMPT_STASHED="\[\e[1m\]\[\e[35m\]○\[\e[m\]\[\e[0m\]"

# Re-evaulate prompt functions each time
set_bash_prompt(){
  PS1="$THEME_PREFIX ${PROMPT_HOST} \[\e[32m\]\W\[\e[m\] $(my_git_prompt)\[\e[33m\]▷ \[\e[m\]"
}
PROMPT_COMMAND=set_bash_prompt
