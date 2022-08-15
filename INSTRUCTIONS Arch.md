# Install OS
Download and install [Arch](https://archlinux.org/download/)
```bash
pacman -Syu
#timedatectl set-timezone Europe/Stockholm
```

# Initial setup
```bash
git clone https://github.com/Peglah/dotfiles.git
#cp -r ~/dotfiles/.config ~/
#cp ~/dotfiles/.bash_aliases ~/
#cp ~/dotfiles/.bashrc ~/
#cp ~/dotfiles/.xinitrc ~/
#chmod +x ~/.xinitrc
```

## [Suckless](https://suckless.org/)
Dependencies:
```bash
libx11-dev libxft-dev libxinerama-dev xinit
```

[feh](https://feh.finalrewind.org/) and [font-manager](https://github.com/FontManager/font-manager)
```bash
feh unclutter-xfixes
```

Compile and install dwm, dmenu, st and slstatus
```bash
makepkg
```

Install firamono from AUR

`reboot` and `startx`

## [Remote desktop](http://xrdp.org/)
```bash
install xrdp
ln -s ~/.xinitrc ~/.xsession
```

## [Mosh](https://mosh.org/)
```bash
install mosh
```

## [Ignore laptop lid](https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed)
```bash
#sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
#service systemd-logind restart
```

## [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)
```bash
#systemctl mask sleep.target
#systemctl mask suspend.target
#systemctl mask hibernate.target
#systemctl mask hybrid-sleep.target
```

## [Touchpad tap-to-click](https://linux.die.net/man/1/synclient)
```bash
#apt install xserver-xorg-input-synaptics
#synclient MaxSpeed=1
#synclient VertEdgeScroll=0
```

## Change Caps Lock and ESC
```bash
#sed -i '0,/Caps_Lock/s//Escape/' /usr/share/X11/xkb/symbols/pc
#sed -i '0,/Escape/s//Caps_Lock/' /usr/share/X11/xkb/symbols/pc
#rm -rf /var/lib/xkb/*
#reboot
```

## [Power management](https://pm-utils.freedesktop.org/wiki/)
```bash
#install pm-utils
```

# Software setup
## Programs
### [fastfetch](https://github.com/LinusDierheimer/fastfetch)
Dependencies:
```bash
cmake
```

Download, compile and install from AUR:

### [ly](https://github.com/fairyglade/ly)
Dependencies:
```bash
build-essential libpam0g-dev libxcb-xkb-dev
```

Download, compile and install:
```bash
systemctl enable ly.service
systemctl disable getty@tty2.service
```

### [Ranger](https://github.com/ranger/ranger)
```bash
install ranger
```

[Ranger - Syntax for preview](https://unix.stackexchange.com/questions/435696/how-to-enable-syntax-highlighting-in-ranger-preview)
```bash
install highlight w3m
```

[Ranger - Preview for video](https://github.com/ranger/ranger/wiki/Video-Previews)
```bash
install ffmpegthumbnailer
```

### [Mplayer](http://www.mplayerhq.hu/)
```bash
install mplayer
```

### [Neovim](https://neovim.io/)
```bash
install neovim
```

### Network Manager
```bash
#apt install network-manager
```

### [a4term](https://a4term.com/)
https://github.com/martanne/dvtm/issues/10

### [btop++](https://github.com/aristocratos/btop)
```bash
install btop
```

### [bat](https://github.com/sharkdp/bat)
```bash
install bat
```

# **TODO**
music
Install ALSA
$ sudo apt-get install alsa-utils

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
