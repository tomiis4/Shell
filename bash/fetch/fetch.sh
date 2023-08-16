#!/bin/bash

# ANSI color codes
c1="\033[0;32m"
c0="\033[0m"

# TODO: add generator for v
# ASCII art
read -r -d '' ascii << "EOF"
⠀⠀⠀⠀⠀⠀⠀⢠⣿⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀
⠀⠀⠀⣼⣿⣿⡟⠛⠁⠛⢛⣿⣿⣧⠀⠀⠀
⠀⠀⣼⣿⣿⣿⠃⢸⣿⣷⠈⢻⣿⣿⣧⠀⠀
⠀⣼⣿⣿⣿⡿⠇⠈⠙⠁⠀⢿⣿⣿⣿⣧⠀
⣼⣿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⢿⣧
EOF

# Function to generate repeated string
repeat() {
    local n="$1"
    local s=""
    for ((i = 0; i < n; i++)); do
        s+=" "
    done
    echo "$s"
}

# Function to round even numbers to even, and odd numbers to the closest even
round() {
    echo $(( $1 - ($1 % 2) ))
}

# Function to center text in a fixed width
center() {
    local inp="$1"
    local len=${#inp}
    local half=$((23 / 2 - len / 2))
    local halfr=$(round $half)
    local spaces=$(repeat $half)
    echo "${spaces}${inp}${spaces}"
}

# Getting user and system info
user_host="${c1}${USER}${c0}@${c1}${HOSTNAME}${c0}"
os=$(grep -oP 'PRETTY_NAME="\K[^"]+' /etc/os-release)
shell=$(basename "$SHELL")
ram=$(free --mega | awk 'NR == 2 { print $3" / "$2" MB" }')

colors=("\033[0;30m" "\033[0;31m" "\033[0;32m" "\033[1;33m" "\033[0;34m" "\033[0;35m" "\033[0;36m" "\033[1;37m")

# Function to generate color row
get_colors() {
    local c=""

    for v in "${colors[@]}"; do
        c+="${v} ${c0}"
    done

    echo "    $c   "
}

# Building data for display
data=(
    "$(center "$user_host")"
    "╭───────────────────────╮"
    "│$os│"
    "│$shell│"
    "│$ram│"
    "╰───────────────────────╯"
    "╭───────────────────────╮"
    "│$(get_colors)"│
    "╰───────────────────────╯"
)

# Display the ASCII art with data
IFS=$'\n'
lineIndex=0
for line in $ascii; do
    echo -e " ${c1}${line}${c0} ${data[lineIndex]}"
    lineIndex=$((lineIndex + 1))
done
