#!/bin/sh

if [ -f /usr/bin/nvim ]; then
  alias vim=nvim
fi

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
