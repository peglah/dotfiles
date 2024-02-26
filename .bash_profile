if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# use vi mode/keybindings
set -o vi

if command -v nvim &> /dev/null; then
  export EDITOR=nvim
fi

if [ -n "$TMUX" ]; then
    PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\]'
elif grep -q "Raspberry Pi" /proc/cpuinfo; then
    PS1="${debian_chroot:+($debian_chroot)}\u@rpi:\w\$ "
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
