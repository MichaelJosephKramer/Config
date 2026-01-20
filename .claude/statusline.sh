#!/bin/bash
# Claude Code Status Line Script - matching kramer zsh theme

# ANSI Color Codes (matching kramer theme)
GREEN=$'\033[32m'
CYAN=$'\033[36m'
WHITE=$'\033[37m'
MAGENTA=$'\033[35m'
RED=$'\033[31m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

# Additional colors for context/alerts
ORANGE=$'\033[38;5;208m'
YELLOW=$'\033[33m'
PURPLE=$'\033[35m'

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model_name=$(echo "$input" | jq -r '.model.display_name')
session_id=$(echo "$input" | jq -r '.session_id')

# Get directory name
dir_name=$(basename "$current_dir")

# Git information (matching kramer theme colors)
git_info=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null || echo "(no branch)")
    status=""

    INDEX=$(git status --porcelain 2>/dev/null)

    # Check for unpushed commits (bold magenta ↑)
    if git log origin/"$branch"..HEAD 2>/dev/null | grep -q '^commit'; then
        status="${status}${BOLD}${MAGENTA}↑${RESET}"
    fi

    # Check for staged changes (bold green ●)
    if echo "$INDEX" | grep -E '^(D[ M]|[MARC][ MD]) ' >/dev/null 2>&1; then
        status="${status}${BOLD}${GREEN}●${RESET}"
    fi

    # Check for unstaged changes (bold red ●)
    if echo "$INDEX" | grep -E '^[ MARC][MD] ' >/dev/null 2>&1; then
        status="${status}${BOLD}${RED}●${RESET}"
    fi

    # Check for untracked files (bold white ●)
    if echo "$INDEX" | grep '^?? ' >/dev/null 2>&1; then
        status="${status}${BOLD}${WHITE}●${RESET}"
    fi

    # Check for stashed changes (bold magenta ○)
    if [ "$(git stash list 2>/dev/null)" != "" ]; then
        status="${status}${BOLD}${MAGENTA}○${RESET}"
    fi

    if [[ -n $status ]]; then
        status=" ${status}"
    fi

    # Format: bold white ( + cyan branch + status + bold white )
    git_info="${BOLD}${WHITE}( ${RESET}${CYAN}${branch}${status}${BOLD}${WHITE} )${RESET} "
fi

# Context window information
context_info=""
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

if [ -n "$remaining_pct" ]; then
    # Calculate total tokens used
    total_tokens=$((total_input + total_output))

    # Format tokens with K suffix if over 1000
    if [ $total_tokens -ge 1000 ]; then
        tokens_display="$((total_tokens / 1000))K"
    else
        tokens_display="$total_tokens"
    fi

    # Calculate used percentage
    used_pct=$(echo "scale=0; 100 - $remaining_pct" | bc)

    # Choose color based on usage level
    if [ "${used_pct%.*}" -ge 80 ]; then
        context_color="${BOLD}${RED}"
    elif [ "${used_pct%.*}" -ge 60 ]; then
        context_color="${ORANGE}"
    elif [ "${used_pct%.*}" -ge 40 ]; then
        context_color="${YELLOW}"
    else
        context_color="${GREEN}"
    fi

    context_info=" ${GREEN}|>${RESET} ${context_color}${used_pct}%${RESET} ${PURPLE}${tokens_display}tok${RESET}"
fi

# Session duration tracking and alerts
alerts=""
session_file="/tmp/claude-session-${session_id}"

# Initialize session start time if not exists
if [ ! -f "$session_file" ]; then
    date +%s > "$session_file"
fi

# Calculate session duration
start_time=$(cat "$session_file" 2>/dev/null || echo 0)
current_time=$(date +%s)
duration=$((current_time - start_time))
hours=$((duration / 3600))

# Alert for low context (below 20%)
if [ -n "$remaining_pct" ] && [ "${remaining_pct%.*}" -lt 20 ]; then
    alerts="${alerts} ${BOLD}${RED}[LOW CONTEXT]${RESET}"
fi

# Alert for long session (2+ hours)
if [ $hours -ge 2 ]; then
    alerts="${alerts} ${BOLD}${MAGENTA}[${hours}h SESSION]${RESET}"
fi

# Output the status line
# Format: 🥃 [green]dir [git_info] model |> context alerts
printf "🥃 ${GREEN}%s${RESET} %s${WHITE}%s${RESET}%s%s\n" "$dir_name" "$git_info" "$model_name" "$context_info" "$alerts"
