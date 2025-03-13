#!/bin/bash

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
mkdir ~/.fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
mv Fira* ~/.fonts/
cd -
fc-cache -fv

# dwm
git clone https://github.com/Peglah/dwm ~/git/Peglah/dwm
cd ~/git/Peglah/dwm
git checkout custom
make
sudo make install
cd -

# dmenu
git clone https://github.com/Peglah/dmenu ~/git/Peglah/dmenu
cd ~/git/Peglah/dmenu
git checkout custom
make
sudo make install
cd -

# slock
git clone https://github.com/Peglah/slock ~/git/Peglah/slock
cd ~/git/Peglah/slock
git checkout custom
make
sudo make install
cd -

# dwmblocks
git clone https://github.com/Peglah/dwmblocks-async ~/git/Peglah/dwmblocks-async
cd ~/git/Peglah/dwmblocks-async
git checkout custom
make
sudo make install
cd -

sudo cp scripts/build/dwm.session /usr/share/xsessions
