# Packaged
## [sysz](https://github.com/joehillen/sysz)
```bash
git clone https://github.com/joehillen/sysz.git /tmp/sysz
cd /tmp/sysz
sudo make install # /usr/local/bin/sysz
```

## [Yazi](https://github.com/sxyazi/yazi)
```bash
cd /tmp/
wget # https://github.com/sxyazi/yazi/releases/latest
unzip yazi*.zip
sudo cp yazi*/yazi /usr/local/bin/
sudo cp yazi*/completions/yazi.bash /etc/bash_completion.d/
```

# Compiled
## [fastfetch](https://github.com/LinusDierheimer/fastfetch)
Dependencies:
```bash
sudo apt install -y cmake
```

Download, compile and install:
```bash
git clone https://github.com/fastfetch-cli/fastfetch /tmp/fastfetch
mkdir -p /tmp/fastfetch/build
cd /tmp/fastfetch/build
cmake ..
cmake --build . --target fastfetch
sudo cp fastfetch /usr/local/bin/
```

## [Neovim](https://neovim.io/) for Debian
Dependencies:
```bash
sudo apt install -y cmake curl gcc gettext ninja-build npm ripgrep unzip
```

Clone, checkout branch, compile and install:
```bash
git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
nvim --headless "+Lazy! sync" +qa
```
## [sshs](https://github.com/quantumsheep/sshs)

## [unclutter-xfixes](https://github.com/Airblader/unclutter-xfixes) for RPi
Dependencies:
```bash
sudo apt install -y libev-dev libx11-dev libxi-dev asciidoc
```

Clone, compile and install
```bash
cd /tmp
git clone https://github.com/Airblader/unclutter-xfixes
cd unclutter-xfixes
make
sudo make install
```

## [btop++](https://github.com/aristocratos/btop) for RPi
Download, extract and install:
```bash
cd /tmp
wget -qO btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-armv7l-linux-musleabihf.tbz
tar -xf btop.tbz
sudo cp /tmp/btop/bin/btop /usr/local/
```

