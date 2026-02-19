#!/bin/bash
# Claude Code Status Line Script - matching kramer zsh theme with Tokyo Night colors

# Tokyo Night Color Palette (using 256-color ANSI codes for better compatibility)
# These match the colors in your FZF_DEFAULT_OPTS and tmux config
GREEN=$'\033[38;5;114m'      # #9ece6a - Tokyo Night green
CYAN=$'\033[38;5;117m'       # #7dcfff - Tokyo Night cyan
WHITE=$'\033[38;5;255m'      # #c0caf5 - Tokyo Night foreground
MAGENTA=$'\033[38;5;170m'    # #bb9af7 - Tokyo Night magenta
RED=$'\033[38;5;203m'        # #f7768e - Tokyo Night red
ORANGE=$'\033[38;5;215m'     # #ff9e64 - Tokyo Night orange
YELLOW=$'\033[38;5;222m'     # #e0af68 - Tokyo Night yellow
BLUE=$'\033[38;5;111m'       # #7aa2f7 - Tokyo Night blue
BOLD=$'\033[1m'
RESET=$'\033[0m'

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model_name=$(echo "$input" | jq -r '.model.display_name')
session_id=$(echo "$input" | jq -r '.session_id')

# Get directory name
dir_name=$(basename "$current_dir")

# Git information (matching kramer theme colors and logic)
git_info=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    # Get branch name
    branch=$(git branch --show-current 2>/dev/null)
    if [ -z "$branch" ]; then
        # Fallback for detached HEAD
        branch=$(git describe --exact-match --tags 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo "(no branch)")
    fi

    status=""

    # Get git status output (matching zsh theme logic)
    INDEX=$(git status --porcelain 2>/dev/null)

    # Check for ahead commits (bold magenta ↑) - more robust check
    upstream=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
    if [ -n "$upstream" ]; then
        ahead=$(git rev-list --count "$upstream"..HEAD 2>/dev/null)
        if [ -n "$ahead" ] && [ "$ahead" -gt 0 ]; then
            status="${status}${BOLD}${MAGENTA}↑${RESET}"
        fi
    fi

    # Check for staged changes (bold green ●) - matches zsh regex [DMARC]
    if echo "$INDEX" | grep -qE '^[DMARC]'; then
        status="${status}${BOLD}${GREEN}●${RESET}"
    fi

    # Check for unstaged changes (bold red ●) - matches zsh regex [ MARC][MD]
    if echo "$INDEX" | grep -qE '^[ MARC][MD]'; then
        status="${status}${BOLD}${RED}●${RESET}"
    fi

    # Check for untracked files (bold white ●)
    if echo "$INDEX" | grep -q '^??'; then
        status="${status}${BOLD}${WHITE}●${RESET}"
    fi

    # Check for unmerged files (bold red ✕) - matches zsh [ADU][ADU]
    if echo "$INDEX" | grep -qE '^[ADU][ADU]'; then
        status="${status}${BOLD}${RED}✕${RESET}"
    fi

    # Check for stashed changes (bold magenta ○)
    if git rev-parse --verify refs/stash &>/dev/null; then
        status="${status}${BOLD}${MAGENTA}○${RESET}"
    fi

    if [[ -n $status ]]; then
        status=" ${status}"
    fi

    # Format: bold white ( + cyan branch + status + bold white )
    git_info="${BOLD}${WHITE}( $(printf '\xee\x82\xa0') ${RESET}${CYAN}${branch}${status}${BOLD}${WHITE} )${RESET} "
fi

# Context window information with Tokyo Night colors
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
    used_pct=$(echo "scale=0; 100 - $remaining_pct" | bc 2>/dev/null || echo $((100 - ${remaining_pct%.*})))

    # Choose Tokyo Night color based on usage level
    if [ "${used_pct%.*}" -ge 80 ]; then
        context_color="${BOLD}${RED}"
    elif [ "${used_pct%.*}" -ge 60 ]; then
        context_color="${ORANGE}"
    elif [ "${used_pct%.*}" -ge 40 ]; then
        context_color="${YELLOW}"
    else
        context_color="${GREEN}"
    fi

    context_info=" ${GREEN}|>${RESET} ${context_color}${used_pct}%${RESET} ${MAGENTA}${tokens_display}tok${RESET}"
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
