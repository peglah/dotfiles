#!/bin/sh

edit_file() {
  if command -v batcat &> /dev/null; then
    bat="batcat"
  else
    bat="bat"
  fi
  if fd --version >/dev/null 2>&1; then
    fd_cmd="fd --type f --hidden --exclude .git --color=always"
  else
    fd_cmd="find . -type d -name ".git" -prune -o -type f -print"
  fi
  editor="$(command -v nvim || command -v vim || command -v vi)"
  chosen_file=$($fd_cmd | fzf-tmux -p 80%,80% --ansi --preview "$bat --style numbers,changes --color=always {}")
  [ -n "$chosen_file" ] && $editor "$chosen_file"
}

if command -v eza &> /dev/null; then
  alias ls='eza --icons --group-directories-first'
else
  alias ls='ls --color=auto'
fi

if command -v doas &> /dev/null; then
  alias sudo='doas '
else
  alias sudo='sudo '
fi

if command -v nala &> /dev/null; then
  alias apt=nala
fi

if ! command -v reboot &> /dev/null; then
  alias reboot='systemctl reboot'
fi

if ! command -v shutdown &> /dev/null; then
  alias shutdown='systemctl poweroff'
fi

if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

if command -v fastfetch &> /dev/null; then
  alias cls='clear && fastfetch --structure Title:OS:Host:LocalIp:Memory:Colors --logo-type small'
else
  alias cls=clear
fi

if command -v batcat &> /dev/null; then
  alias cat=batcat
elif command -v bat &> /dev/null; then
  alias cat=bat
fi

if command -v tree &> /dev/null; then
  alias tree='tree -C'
fi

if command -v wtwitch &> /dev/null; then
  alias wt=wtwitch
fi

if command -v pacman &> /dev/null; then
  alias fdz="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
elif command -v apt &> /dev/null; then
  alias fdz='apt-cache pkgnames | fzf --multi --cycle --reverse --preview "apt-cache show {1}" --preview-window=:57%:wrap:hidden --bind=space:toggle-preview | xargs -ro sudo apt install'
fi

alias curll='curl -L -O'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias v=edit_file
