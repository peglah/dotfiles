# OS
Download and install Ubuntu Server LTS
```bash
apt update && apt upgrade
timedatectl set-timezone Europe/Stockholm
systemctl mask systemd-networkd-wait-online.service
chmod +x ~/.xinitrc
```

## Initial setup
```bash
apt install make gcc
cd ~
git clone https://github.com/Peglah/dotfiles.git
```

## Remote desktop

```bash
apt install xrdp
ln -s ~/.xinitrc ~/.xsession
```

## Ignore laptop lid
/etc/systemd/logind.conf
HandleLidSwitch=ignore
sudo service systemd-logind restart

## [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)

## [Touchpad tap-to-click](https://askubuntu.com/questions/971517/synaptics-touchpad-tap-to-click-is-not-working-in-ubuntu-16-04-lts-gnome)
```bash
apt install xserver-xorg-input-synaptics
```

## Change Caps Lock and ESC
```bash
vim /usr/share/X11/xkb/symbols/pc
rm -rf /var/lib/xkb/*
```
Reboot

# Software setup
## Window manager
### [Suckless](https://suckless.org/)
Dependencies:
```bash
apt install libx11-dev libxft-dev libxinerama-dev xinit
```
[feh](https://feh.finalrewind.org/) and [font-manager](https://github.com/FontManager/font-manager)
```bash
apt install feh font-manager
```

Install fonts with `font-manager`

Compile and install dwm, dmenu, st and slstatus
```bash
cd ~/dotfiles/suckless/dwm
make clean install && cd ../dmenu
make clean install && cd ../st
make clean install && cd ../slstatus
make clean install
```
## Programs
### [fastfetch](https://github.com/LinusDierheimer/fastfetch)
Dependencies:
```bash
apt install cmake
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
cp fastfetch /usr/local/bin/
```

### [ly](https://github.com/fairyglade/ly)
Dependencies:
```bash
apt install build-essential libpam0g-dev libxcb-xkb-dev
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
apt install ranger
```
[Ranger preview](https://github.com/ranger/ranger/wiki/Video-Previews)

### [Neovim](https://neovim.io/)
```bash
cd /tmp
curl -L -O https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
apt install ./nvim-linux64.deb
```

### Network Manager
```bash
apt install network-manager
```
networkmanager-dmenu

### [Mosh](https://mosh.org/)
```bash
apt install mosh
```

### [a4term](https://a4term.com/)
https://github.com/martanne/dvtm/issues/10

### [btop++](https://github.com/aristocratos/btop)
```bash
apt install btop
```

# Other
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
