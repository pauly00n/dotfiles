#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
transcript=$(echo "$input" | jq -r '.transcript_path // empty')
mode=$(echo "$input" | jq -r '.output_style.name // empty')

# Context %: use native context_window.used_percentage (harness pre-computes with correct window size)
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
if [ -n "$used" ] && [ "$used" != "null" ]; then
  used=$(awk -v p="$used" 'BEGIN{printf "%.0f", p}')
fi

# Username
username=$(whoami)

# Directory display
home="$HOME"
if [ "$cwd" = "$home" ]; then
  display_dir="~"
else
  display_dir=$(basename "$cwd")
fi

# Git branch (skip optional locks)
git_branch=""
if git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" -c core.hooksPath=/dev/null symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_branch=" $branch"
  fi
fi

# Context percentage
ctx_part=""
if [ -n "$used" ]; then
  ctx_part="ctx:${used}%%"
fi

# Colors
teal='\033[0;36m'
blue='\033[0;34m'
green='\033[0;32m'
purple='\033[0;35m'
yellow='\033[0;33m'
reset='\033[0m'

# Time
time_str=$(date +%H:%M)

# Context indicator (only shown when there is usage)
ctx_display=""
if [ -n "$ctx_part" ]; then
  ctx_display="  ${purple}~${ctx_part}${reset}"
fi

branch_display=""
if [ -n "$git_branch" ]; then
  branch_display=" ${green}${git_branch}${reset}"
fi


# Line 1: username: dir branch [ctx:X%] model HH:MM
printf "${teal}${username}${reset}: ${blue}${display_dir}${reset}${branch_display}${ctx_display}  ${model}  ${yellow}${time_str}${reset}"

# Line 2: mode indicator if non-default
if [ -n "$mode" ] && [ "$mode" != "default" ] && [ "$mode" != "null" ]; then
  printf "\n${mode}"
fi
