if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

set -o vi # use vi mode/keybindings

if command -v nvim &> /dev/null; then
  export EDITOR=nvim
  export MANPAGER="nvim +Man! -c 'set laststatus=0'"
fi

if command -v batcat &> /dev/null || command -v bat &> /dev/null; then
  export BAT_THEME=gruvbox-dark
fi

# morhetz/gruvbox
if command -v fzf &> /dev/null; then
  export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

  if [ -f /usr/share/bash-completion/completions/fzf ]; then
    . /usr/share/bash-completion/completions/fzf
  elif [ -f /data/data/com.termux/files/usr/share/fzf/completion.bash ]; then
    . /data/data/com.termux/files/usr/share/fzf/completion.bash
  fi

  if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    . /usr/share/doc/fzf/examples/key-bindings.bash
    echo "sourced" > /tmp/kb.txt
  elif [ -f /data/data/com.termux/files/usr/share/fzf/key-bindings.bash ]; then
    . /data/data/com.termux/files/usr/share/fzf/key-bindings.bash
  fi
fi

if [ -n "$TMUX" ]; then
    PS1='\[\e[0;32m\]\w\[\e[0m\]\[\e[0;97m\]\$\[\e[0m\] '
elif grep -q "Raspberry Pi" /proc/cpuinfo; then
    #PS1="${debian_chroot:+($debian_chroot)}\u@rpi:\w\$ "
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@rpi\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

if [ -f /usr/share/bash-completion/completions/wtwitch ]; then
  . /usr/share/bash-completion/completions/wtwitch
fi

if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi

if command -v fastfetch &> /dev/null; then
  fastfetch --structure Title:OS:Host:Packages:Memory:Colors --logo-type small
elif command -v afetch &> /dev/null; then
  afetch
fi
