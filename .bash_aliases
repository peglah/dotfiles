#!/bin/sh

if [ -f /usr/bin/nvim ]; then
  alias vim=nvim
fi

if [ -f /usr/bin/batcat ]; then
  alias cat=batcat
fi

if [ -f /usr/bin/bat ]; then
  alias cat=bat
fi

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
