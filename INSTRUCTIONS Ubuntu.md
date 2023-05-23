# Install OS
Download and install [Ubuntu Server LTS](https://ubuntu.com/download/server)
```bash
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y
timedatectl set-timezone Europe/Stockholm
systemctl mask systemd-networkd-wait-online.service
```

# Initial setup
```bash
sudo apt install -y make gcc
mkdir ~/git
cd ~/git
git clone --recurse-submodules -j8 https://github.com/Peglah/dotfiles.git
ln -s ~/git/dotfiles/.config/ ~/
sudo ln -s ~/git/dotfiles/.config/ /root/
ln -s ~/git/dotfiles/.bash_aliases ~/
rm ~/.bashrc
ln -s ~/git/dotfiles/.bashrc ~/
ln -s ~/git/dotfiles/.xinitrc ~/
ln -s ~/git/dotfiles/.config/nvim/.editorconfig ~/.editorconfig
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
chmod +x ~/.xinitrc
```

## [Suckless](https://suckless.org/)
Dependencies:
```bash
sudo apt install -y libx11-dev libxft-dev libxinerama-dev xinit
```

[feh](https://feh.finalrewind.org/) and [font-manager](https://github.com/FontManager/font-manager)
```bash
sudo apt install -y feh unclutter-xfixes
```

Compile and install dwm, dmenu, st and slstatus
```bash
cd ~/git/dotfiles/suckless

./dmenu-dl.sh
./dwm-dl.sh
./st-dl.sh

git apply dmenu-*.patch
git apply dwm-*.patch
git apply st-*.patch
git apply slstatus.patch

cd dmenu-*/ && make && sudo make install && cd ..
cd dwm-*/ && make && sudo make install && cd ..
cd st-*/ && make && sudo make install && cd ..
cd slstatus/ && make && sudo make install && cd ..
```

`reboot` and `startx`
```bash
mkdir ~/.fonts
cd /tmp
curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
mv FiraCodeNerdFontMono-Medium.ttf ~/.fonts/
fc-cache -fv
```

## [Remote desktop](http://xrdp.org/)
```bash
sudo apt install -y xrdp
ln -s ~/.xinitrc ~/.xsession
```

## [Mosh](https://mosh.org/) and [abduco](https://github.com/martanne/abduco)
```bash
cd ~/git/dotfiles/bin/mosh/
./autogen.sh && ./configure
make && sudo make install

cd ~/git/dotfiles/bin/abduco/
./configure && make && sudo make install
```

## [Ignore laptop lid](https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed)
```bash
sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
service systemd-logind restart
```

## [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)
```bash
systemctl mask sleep.target
systemctl mask suspend.target
systemctl mask hibernate.target
systemctl mask hybrid-sleep.target
```

## [Touchpad tap-to-click](https://linux.die.net/man/1/synclient)
```bash
sudo apt install -y xserver-xorg-input-synaptics
synclient MaxSpeed=1
synclient VertEdgeScroll=0
```

## Change Caps Lock and ESC
```bash
sed -i '0,/Caps_Lock/s//Escape/' /usr/share/X11/xkb/symbols/pc
sed -i '0,/Escape/s//Caps_Lock/' /usr/share/X11/xkb/symbols/pc
rm -rf /var/lib/xkb/*
reboot
```

## [Power management](https://pm-utils.freedesktop.org/wiki/)
```bash
sudo apt install -y pm-utils
```

# Software setup
## Programs
### [fastfetch](https://github.com/LinusDierheimer/fastfetch)
Dependencies:
```bash
sudo apt install -y cmake
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
sudo apt install -y build-essential libpam0g-dev libxcb-xkb-dev
```

Download, compile and install:
```bash
cd /tmp
git clone --recurse-submodules https://github.com/nullgemm/ly
cd ly
make
make run
make install
systemctl enable ly.service
systemctl disable getty@tty2.service
```

### [Ranger](https://github.com/ranger/ranger)
```bash
sudo apt install -y ranger
```

[Ranger - Syntax for preview](https://unix.stackexchange.com/questions/435696/how-to-enable-syntax-highlighting-in-ranger-preview)
```bash
sudo apt install -y highlight
```

[Ranger - Preview for video](https://github.com/ranger/ranger/wiki/Video-Previews)
```bash
sudo apt install -y ffmpegthumbnailer
```

### [Mplayer](http://www.mplayerhq.hu/)
```bash
sudo apt install -y mplayer
```

### [Neovim](https://neovim.io/)
Dependencies:
```bash
sudo apt-get install ninja-build gettext cmake unzip curl
```

Clone, checkout branch, compile and install:
```bash
git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
nvim --headless "+Lazy! sync" +qa
sudo ln -s ~/.local/share/nvim /root/.local/share/
sudo ln -s ~/.local/state/nvim /root/.local/state/
```

### Network Manager
```bash
sudo apt install -y network-manager
```

### [a4term](https://a4term.com/)
Dependencies:
```bash
sudo apt install -y bzr libtermkey-dev libunibilium-dev libtool-bin

cd /tmp
bzr branch https://bazaar.leonerd.org.uk/c/libtickit/
bzr branch https://bazaar.leonerd.org.uk/c/libvterm/

cd /tmp/libtickit && make && sudo make install
cd /tmp/libvterm && make && sudo make install
```

Download, compile, install and reboot:
```bash
cd /tmp
git clone https://github.com/rpmohn/a4
cd /tmp/a4 && make && sudo make install
sudo reboot
```

### [btop++](https://github.com/aristocratos/btop)
```bash
sudo apt install -y btop
```

### [bat](https://github.com/sharkdp/bat)
```bash
sudo apt install -y bat
```

### [exa]()
```bash
sudo apt install -y exa
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


sudo apt install -y ncmpcpp mopidy mopidy-mpd mopidy-alsamixer
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
