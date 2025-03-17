#!/bin/bash

set -euo pipefail

# Dependencies
sudo nala install -y \
feh \
libimlib2-dev \
libx11-dev \
libxcb-util-dev \
libxft-dev \
libxinerama-dev \
libxrandr-dev \
unclutter-xfixes \
xinit

# Fonts
mkdir -p ~/.fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
cp Fira* ~/.fonts/
rm /tmp/FiraCode* LICENSE README.md
cd -
fc-cache -fv

# dwm
if [[ -d ~/git/Peglah/dwm/.git ]]; then
    echo "Repository already cloned. Pulling latest changes..."
    cd ~/git/Peglah/dwm && git pull origin master
else
    git clone https://github.com/Peglah/dwm ~/git/Peglah/dwm
    cd ~/git/Peglah/dwm
fi

git checkout custom
make
sudo make install
cd -

# dmenu
if [[ -d ~/git/Peglah/dmenu/.git ]]; then
    echo "Repository already cloned. Pulling latest changes..."
    cd ~/git/Peglah/dmenu && git pull origin master
else
    git clone https://github.com/Peglah/dmenu ~/git/Peglah/dmenu
    cd ~/git/Peglah/dmenu
fi

git checkout custom
make
sudo make install
cd -

# slock
if [[ -d ~/git/Peglah/slock/.git ]]; then
    echo "Repository already cloned. Pulling latest changes..."
    cd ~/git/Peglah/slock && git pull origin master
else
    git clone https://github.com/Peglah/slock ~/git/Peglah/slock
    cd ~/git/Peglah/slock
fi

git checkout custom
make
sudo make install
cd -

# dwmblocks
if [[ -d ~/git/Peglah/dwmblocks-async/.git ]]; then
    echo "Repository already cloned. Pulling latest changes..."
    cd ~/git/Peglah/dwmblocks-async && git pull origin main
else
    git clone https://github.com/Peglah/dwmblocks-async ~/git/Peglah/dwmblocks-async
    cd ~/git/Peglah/dwmblocks-async
fi

git checkout custom
make
sudo make install
cd -

sudo cp $HOME/git/Peglah/dotfiles/setup/debian/scripts/build/dwm.desktop /usr/share/xsessions/
