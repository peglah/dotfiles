# Arch
```bash
sudo pacman -S --needed \
xorg \
xorg-xinit \
ttf-firacode-nerd
```

# Debian
```bash
sudo apt install \
feh \
libimlib2-dev \
libx11-dev \
libxft-dev \
libxinerama-dev \
libxrandr-dev \
unclutter-xfixes \
xinit
```

## Fonts
```bash
mkdir ~/.fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
mv Fira* ~/.fonts/
fc-cache -fv
```

# dwm
```bash
git clone https://github.com/Peglah/dwm ~/git/Peglah/dwm
cd ~/git/Peglah/dwm
git checkout custom
make
sudo make install
```

# dmenu
```bash
git clone https://github.com/Peglah/dmenu ~/git/Peglah/dmenu
cd ~/git/Peglah/dmenu
git checkout custom
make
sudo make install
```

# slock
```bash
git clone https://github.com/Peglah/slock ~/git/Peglah/slock
cd ~/git/Peglah/slock
git checkout custom
make
sudo make install
```

# dwmblocks-async
```bash
git clone https://github.com/Peglah/dwmblocks-async ~/git/Peglah/dwmblocks-async
cd ~/git/Peglah/dwmblocks-async
git checkout custom
make
sudo make install
```

