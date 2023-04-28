#!/bin/sh

if command -v exa &> /dev/null; then
  alias ls=exa
else
  alias ls='ls --color=auto'
fi

if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

if command -v wtwitch &> /dev/null; then
  alias wt=wtwitch
fi

if command -v batcat &> /dev/null; then
  alias cat=batcat
elif command -v bat &> /dev/null; then
  alias cat=bat
fi

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias curll='curl -L -O'
