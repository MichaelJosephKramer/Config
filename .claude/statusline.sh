#!/bin/bash
# Claude Code Status Line Script - matching kramer zsh theme with Tokyo Night colors
# Updated to mirror kramer prompt structure: 🥃  [green]dir ( branch indicators ) [green]|>

# Tokyo Night Color Palette (using 256-color ANSI codes for better compatibility)
# These match the colors in your FZF_DEFAULT_OPTS and tmux config
GREEN=$'\033[38;5;114m'      # #9ece6a - Tokyo Night green
CYAN=$'\033[38;5;117m'       # #7dcfff - Tokyo Night cyan
WHITE=$'\033[38;5;255m'      # #c0caf5 - Tokyo Night foreground
MAGENTA=$'\033[38;5;170m'    # #bb9af7 - Tokyo Night magenta
RED=$'\033[38;5;203m'        # #f7768e - Tokyo Night red
ORANGE=$'\033[38;5;215m'     # #ff9e64 - Tokyo Night orange
YELLOW=$'\033[38;5;222m'     # #e0af68 - Tokyo Night yellow
BOLD=$'\033[1m'
RESET=$'\033[0m'

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model_name=$(echo "$input" | jq -r '.model.display_name')
session_id=$(echo "$input" | jq -r '.session_id')

# Get directory name (matching %c in kramer theme)
dir_name=$(basename "$current_dir")

# Git information (matching kramer theme colors and logic exactly)
git_info=""
if git -C "$current_dir" rev-parse --git-dir >/dev/null 2>&1; then
    # Get branch name
    branch=$(git -C "$current_dir" branch --show-current 2>/dev/null)
    if [ -z "$branch" ]; then
        branch=$(git -C "$current_dir" describe --exact-match --tags 2>/dev/null \
            || git -C "$current_dir" rev-parse --short HEAD 2>/dev/null \
            || echo "(no branch)")
    fi

    indicators=""

    # Use --branch --porcelain to get ahead/behind in header (matches zsh theme)
    git_status_out=$(git -C "$current_dir" status --branch --porcelain 2>/dev/null)
    header="${git_status_out%%$'\n'*}"

    # ahead (bold magenta ↑) - matches zsh: [[ "$header" == *'[ahead'* ]]
    echo "$header" | grep -q '\[ahead' && indicators="${indicators}${BOLD}${MAGENTA}↑${RESET}"

    # behind (bold magenta ↓) - matches zsh: [[ "$header" == *'behind'* ]]
    echo "$header" | grep -q 'behind' && indicators="${indicators}${BOLD}${MAGENTA}↓${RESET}"

    # staged (bold green ●) - porcelain X column: D/M/A/R/C in first char
    echo "$git_status_out" | grep -qE '^[DMARC]' \
        && indicators="${indicators}${BOLD}${GREEN}●${RESET}"

    # unstaged (bold red ●) - porcelain Y column: M or D in second char
    echo "$git_status_out" | grep -qE '^[ MARC][MD]' \
        && indicators="${indicators}${BOLD}${RED}●${RESET}"

    # untracked (bold white ●)
    echo "$git_status_out" | grep -q '^??' \
        && indicators="${indicators}${BOLD}${WHITE}●${RESET}"

    # unmerged (bold red ✕) - both columns contain A/D/U
    echo "$git_status_out" | grep -qE '^[ADU][ADU]' \
        && indicators="${indicators}${BOLD}${RED}✕${RESET}"

    # stashed (bold magenta ○)
    git -C "$current_dir" rev-parse --verify refs/stash &>/dev/null \
        && indicators="${indicators}${BOLD}${MAGENTA}○${RESET}"

    [ -n "$indicators" ] && indicators=" ${indicators}"

    # Format mirrors kramer exactly:
    #   bold white "( " + git icon + " " + cyan branch + indicators + bold white " ) "
    git_icon=$'\xee\x82\xa0'  # U+E0A0 Powerline branch symbol
    git_info="${BOLD}${WHITE}( ${git_icon} ${RESET}${CYAN}${branch}${indicators}${BOLD}${WHITE} )${RESET} "
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

    context_info="  ${context_color}${used_pct}%${RESET} ${MAGENTA}${tokens_display}tok${RESET}"
fi

# Alert for low context (below 20%)
alerts=""
if [ -n "$remaining_pct" ] && [ "${remaining_pct%.*}" -lt 20 ]; then
    alerts=" ${BOLD}${RED}[LOW CTX]${RESET}"
fi

# Output the status line
# Mirrors kramer prompt: 🥃  [green]dir [git_info][green]|>
# Then appends: model name, context info, alerts
printf "🥃  ${GREEN}%s${RESET} %s${GREEN}|>${RESET}  ${WHITE}%s${RESET}%s%s\n" \
    "$dir_name" "$git_info" "$model_name" "$context_info" "$alerts"
