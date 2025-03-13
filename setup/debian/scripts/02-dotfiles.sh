#!/bin/bash

sudo nala install git stow

mv $HOME/.config/* $HOME/git/Peglah/.config/
mv $HOME/.config/.* $HOME/git/Peglah/.config/
rmdir $HOME/.config

rm ~/.bashrc
rm ~/.bash_profile

cd ~/git/Peglah/dotfiles
stow . -t $HOME
ln -s $HOME/git/Peglah/dotfiles/.local/bin/ $HOME/.local/bin
cd -

source ~/.bash_profile
