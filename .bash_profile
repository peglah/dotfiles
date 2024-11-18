if [ -f ~/.profile ]; then . ~/.profile; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# Launch tmux if interactice shell
if [ -n "$PS1" ] && [ -z "$TMUX" ] && [ "$TERM" = "alacritty" ]; then
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
fi

set -o vi # use vi mode/keybindings

# Dark theme
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# Grimblast output folder
export XDG_SCREENSHOTS_DIR=$HOME/pictures/screenshots/

# Local display on laptop
if [[ $(hostname) == "tatyana" && -n "$TMUX" ]]; then
    export DISPLAY=:0
fi

if command -v nvim &> /dev/null; then
  export EDITOR=nvim
  export MANPAGER="nvim +Man! -c 'set laststatus=0'"
fi

if command -v batcat &> /dev/null || command -v bat &> /dev/null; then
  export BAT_THEME=gruvbox-dark
fi

if command -v fzf &> /dev/null; then
  FZF_VERSION=$(fzf --version | awk '{print $1}')

  # Set up fzf key bindings and fuzzy completion
  if [[ "$FZF_VERSION" == "0.48" || "$FZF_VERSION" > "0.48" ]]; then
    eval "$(fzf --bash)"
  else
    source /usr/share/doc/fzf/examples/key-bindings.bash
  fi

  # morhetz/gruvbox
  export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

  if command -v tree &> /dev/null; then
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
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
  fastfetch --structure Title:OS:Host:LocalIp:Memory:Colors --logo-type small
elif command -v afetch &> /dev/null; then
  afetch
fi
