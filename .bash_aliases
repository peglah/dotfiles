#!/bin/sh

if command -v exa &> /dev/null; then
  alias ls='exa --icons --group-directories-first'
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

if command -v fd &> /dev/null; then
  alias v='fd --type f --hidden --exclude .git --color=always | fzf-tmux -p 80%,50% --ansi | xargs -o $(command -v nvim || command -v vim || command -v vi)'
else
  alias v='find . -name .git -prune -o -type f -print | fzf-tmux -p 80%,50% --ansi | xargs -o $(command -v nvim || command -v vim || command -v vi)'
fi
