#!/bin/bash

# Set the terminal type for tput command used by wtwitch.
export TERM=xterm

# Get the list of live channels you are following on Twitch.
wtwitch c | \
# Filters out the section of the output between "Live channels:" and "Settings:".
sed -n '/Live channels:/,/Settings:/p' | \
# Splits each line at the colon character `:` and prints the first part.
# This effectively extracts the streamer's name from each line.
awk -F':' 'NF>1{print $1}' | \
# Removes all spaces.
sed 's/ //g' | \
# Excludes lines containing 'Livechannels' or 'Settings'.
grep -v -e 'Livechannels' -e 'Settings' | \
# Removes any ANSI escape sequences, which are often used to colorize terminal output.
sed 's/\x1b\[[0-9;]*m//g' | \
# Passes the processed list of streamer names to dmenu.
dmenu -fn 'FiraCode Nerd Font Mono:style=Retina,Regular:pixelsize=16:antialias=true:autohint=true' -nb "#282828" -nf "#ebdbb2" -sb "#3c3836" -sf "#ebdbb2" -l 6 -bw 2 -c | \
# Takes the streamer name chosen in dmenu and passes it to `wtwitch w`.
xargs -r wtwitch w
