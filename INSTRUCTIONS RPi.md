# Install OS
Download and install [Raspberry Pi OS (64-bit) Lite](https://www.raspberrypi.com/software/operating-systems/)

Boot with a screen

```bash
service NetworkManager start
nmtui
sudo apt update && sudo apt upgrade
timedatectl set-timezone Europe/Stockholm
```

# Initial setup
```bash
sudo apt install make gcc git
mkdir ~/git
cd ~/git
git clone https://github.com/Peglah/dotfiles.git
ln -s ~/git/dotfiles/.config/ ~/
ln -s ~/git/dotfiles/.bash_aliases ~/
rm ~/.bashrc
ln -s ~/git/dotfiles/.bashrc ~/
ln -s ~/git/dotfiles/.xinitrc ~/
chmod +x ~/.xinitrc
```

## Window manager
Dependencies:
```bash
sudo apt install libx11-dev libxft-dev libxinerama-dev xinit
```

[feh](https://feh.finalrewind.org/)
```bash
sudo apt install feh
```

[unclutter-xfixes](https://github.com/Airblader/unclutter-xfixes)
```bash
sudo apt install libev-dev libx11-dev libxi-dev asciidoc
```

Clone, compile and install
```bash
cd /tmp
git clone https://github.com/Airblader/unclutter-xfixes
cd unclutter-xfixes
make
sudo make install
```

### [Suckless](https://suckless.org/)
Compile and install dwm, dmenu, st and slstatus
```bash
cd ~/git/dotfiles/suckless/dwm* && sudo make clean install
cd ~/git/dotfiles/suckless/dmenu* && sudo make clean install
cd ~/git/dotfiles/suckless/st* && sudo make clean install
cd ~/git/dotfiles/suckless/slstatus* && sudo make clean install
```

`reboot` and `startx`
```bash
mkdir ~/.fonts
cd /tmp
curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
mv "Fira Code Medium Nerd Font Complete Mono.ttf" ~/.fonts/
```

## [Mosh](https://mosh.org/) and [abduco](https://github.com/martanne/abduco)
```bash
sudo apt install mosh
cd /tmp
curl -L -O https://www.brain-dump.org/projects/abduco/abduco-0.6.tar.gz
tar -zxvf abduco-0.6.tar.gz
cd abduco-0.6
make
sudo make install
```

## [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)
```bash
systemctl mask sleep.target
systemctl mask suspend.target
systemctl mask hibernate.target
systemctl mask hybrid-sleep.target
```

# Software setup
## Programs
### [fastfetch](https://github.com/LinusDierheimer/fastfetch)
Dependencies:
```bash
sudo apt install cmake
```

Download, compile and install:
```bash
cd /tmp
git clone https://github.com/LinusDierheimer/fastfetch
cd fastfetch
mkdir -p build
cd build
cmake ..
cmake --build . --target fastfetch
sudo cp fastfetch /usr/local/bin/
```

### [ly](https://github.com/fairyglade/ly)
Dependencies:
```bash
sudo apt install build-essential libpam0g-dev libxcb-xkb-dev
```

Download, compile and install:
```bash
cd /tmp
git clone --recurse-submodules https://github.com/nullgemm/ly
cd ly
make
make run
sudo make install installsystemd
systemctl enable ly.service
systemctl disable getty@tty2.service
```

### [Ranger](https://github.com/ranger/ranger)
[Ranger - Syntax for preview](https://unix.stackexchange.com/questions/435696/how-to-enable-syntax-highlighting-in-ranger-preview)

[Ranger - Preview for video](https://github.com/ranger/ranger/wiki/Video-Previews)
```bash
sudo apt install ranger highlight ffmpegthumbnailer
```

### [mpv](https://mpv.io/)
```bash
sudo apt install mpv
```

### [Neovim](https://neovim.io/)
Dependencies:
```bash
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen nodejs

cd /tmp
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo npm install -g neovim
python3 -m pip install --user --upgrade pynvim
```

Download, unzip, configure, compile and install:
```bash
curl -LO https://github.com/neovim/neovim/archive/refs/tags/stable.zip
unzip stable.zip
cd neovim-stable
vi Makefile # CMAKE_BUILD_TYPE ?=RelWithDebInfo
make && sudo make install
nvim --headless "+Lazy! sync" +qa
```

### [a4](https://a4term.com/)
Dependencies:
```bash
sudo apt install bzr libtermkey-dev libunibilium-dev libtool-bin

cd /tmp
bzr branch https://bazaar.leonerd.org.uk/c/libtickit/
bzr branch https://bazaar.leonerd.org.uk/c/libvterm/

cd /tmp/libtickit && make && sudo make install
cd /tmp/libvterm && make && sudo make install
```bash

Download, compile, install and reboot:
```bash
cd /tmp
git clone https://github.com/rpmohn/a4
cd /tmp/a4 && make && sudo make install
sudo reboot
```

### [btop++](https://github.com/aristocratos/btop)
Download, extract and install:
```bash
cd /tmp
wget -qO btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-armv7l-linux-musleabihf.tbz
tar -xf btop.tbz
sudo cp /tmp/btop/bin/btop /usr/local/
```

### [bat](https://github.com/sharkdp/bat)
```bash
sudo apt install bat
```

# **TODO**
music
Install ALSA
$ sudo apt-get install libasound2 libasound2-plugins alsa-utils alsa-oss

Install PulseAudio:
$ sudo apt-get install pulseaudio pulseaudio-utils

Set Group Memberships for PA:
$ sudo usermod -aG pulse,pulse-access <username>

Run the PulseaudioServer:
$ pulseaudio -D

Following command tells us if a sink is recognized by PulseAudio:
$ pacmd list-sinks

Remember sinkname for output below.
This command will play a sound file to a given sink:
$ pacmd play-file <filename> <sinkname>

We may need to unmute audio devices:
for ALSA: use alsamixer
for Pulseaudio: use pacmd set-sink-mute n 0 where n is the sink index (likely 0)
For further CLI commands see also the Pulse Audio Wiki
To configure Pulseaudio Server to our needs we may need to edit /etc/pulse/default.pa and /etc/pulse/daemon.conf that come with self-explanatory. notes.


apt install ncmpcpp mopidy mopidy-mpd mopidy-alsamixer
usermod -a -G audio peglah
make sure aplay can play
curl -O https://www.kozco.com/tech/piano2.wav
mkdir -p ~/.config/ncmpcpp/
cp /usr/share/doc/ncmpcpp/examples/config ~/.config/ncmpcpp/
echo http://fm02-ice.stream.khz.se/fm02_mp3 > ~/banditrock.m3u
sudo mv ~/banditrock.m3u /var/lib/mopidy/m3u/

sudo su
mopidyctl config >> /etc/mopidy/mopidy.conf
exit

fix viz
/etc/mopidy/mopidy.conf
output = tee name=t t. ! queue ! autoaudiosink t. ! queue ! audioresample ! audioconvert ! audio/x-raw,rate=44100,channels=2,format=S16LE ! wavenc ! filesink location=/tmp/mpd.fifo

systemctl enable mopidy
systemctl start mopidy

Keybindings
TODO SXHKD
