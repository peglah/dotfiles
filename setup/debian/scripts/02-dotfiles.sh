#!/bin/bash

sudo nala install git stow
mkdir -p ~/git/Peglah
git clone https://github.com/Peglah/dotfiles.git ~/git/Peglah/dotfiles

rm ~/.bashrc
rm ~/.bash_profile

cd ~/git/Peglah/dotfiles
stow . -t $HOME
ln -s $HOME/git/Peglah/dotfiles/.local/bin/ $HOME/.local/bin
cd -

source ~/.bash_profile
