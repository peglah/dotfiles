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
  alias tree='eza --icons --tree'
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
  alias nu='nvim --headless "+Lazy! sync" +qa'
  alias vim=nvim
fi

if command -v fastfetch &> /dev/null; then
  alias cls='clear && fastfetch --structure Title:OS:Host:LocalIp:Memory:Colors --logo-type small'
  alias c='clear && fastfetch --structure Title:OS:Host:LocalIp:Memory:Colors --logo-type small'
else
  alias cls=clear
  alias c=clear
fi

if command -v batcat &> /dev/null; then
  alias cat=batcat
  alias bat=batcat
elif command -v bat &> /dev/null; then
  alias cat=bat
fi

if command -v wtwitch &> /dev/null; then
  wt() {
    for value in "$@"; do
      wtwitch w "$value"
    done
  }

  _wt_completions() {
    # Simulate the command line arguments for wtwitch
    COMP_WORDS=(wtwitch w "${COMP_WORDS[@]:1}")
    COMP_CWORD=$((COMP_CWORD + 1))
    _wtwitch_completions
  }

  complete -F _wt_completions wt
fi

if command -v pacman &> /dev/null && command -v fzf &> /dev/null; then
  # Search and install packages using pacman
  alias fdz="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"

  # Search and remove packages with dependencies using pacman
  alias fdx='pacman -Qq | fzf --multi --preview '\''pacman -Qi {1}'\'' | xargs -ro sudo pacman -Rns'

elif command -v apt &> /dev/null && command -v fzf &> /dev/null; then
  # Search and install packages using apt
  alias fdz='apt-cache pkgnames | fzf --multi --preview "apt-cache show {1}" | xargs -ro sudo apt install'

  # Search and purge packages with configuration files using apt
  alias fdx='dpkg-query -W -f="\${Package}\n" | fzf --multi --preview "apt show {1}" | xargs -ro sudo apt purge && sudo apt autoremove'
fi

alias curll='curl -L -O'
alias diff='diff --color=auto'
alias gp='git --git-dir=$HOME/git/Peglah/dotfiles/.git --work-tree=$HOME/git/Peglah/dotfiles pull'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias tlf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias v=edit_file
