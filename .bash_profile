if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi

# use vi mode/keybindings
set -o vi
if command -v nvim &> /dev/null; then
  export EDITOR=nvim
fi

if grep -q "Raspberry Pi" /proc/cpuinfo; then
  PS1="${debian_chroot:+($debian_chroot)}\u@rpi:\w\$ "
fi

if command -v fastfetch &> /dev/null; then
  fastfetch --structure Title:OS:Host:Packages:Memory:Colors --logo-type small
elif command -v afetch &> /dev/null; then
  afetch
fi

if [ -f /usr/share/bash-completion/completions/wtwitch ]; then
  . /usr/share/bash-completion/completions/wtwitch
fi

if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi
