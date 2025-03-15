#!/bin/bash

set -euo pipefail

sudo nala install -y stow

shopt -s dotglob
mv $HOME/.config/* $HOME/git/Peglah/dotfiles/.config/
rmdir $HOME/.config

cd $HOME/git/Peglah/dotfiles
stow . -t $HOME
ln -s $HOME/git/Peglah/dotfiles/.local/bin/ $HOME/.local/bin
cd -

mv $HOME/.bash_profile $HOME/.bashrc
source $HOME/.profile
