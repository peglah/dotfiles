#OS
Download and install Ubuntu Server LTS
update & upgrade
timedatectl set-timezone Europe/Stockholm
systemctl mask systemd-networkd-wait-online.service
Deps for all
make gcc

#Software setup
##Terminal management
git clone https://github.com/Peglah/dotfiles.git

abduco
wget, tar -xf, make, make install
dvtm
Deps: libncurses5-dev
wget, tar -xf, make, make install

##Window manager
Suckless
Suckless deps: libx11-dev libxft-dev libxinerama-dev xinit feh font-manager
Install fonts with font-manager
dwm
make clean install
dmenu
make clean install
st
make clean install
slstatus
make clean install

#Other
##change caps lock and esc
edit /usr/share/X11/xkb/symbols/pc
rm -rf /var/lib/xkb/* in your terminal.
Reboot

##Remote desktop
apt install xrdp
ln -s .xinitrc .xsession

[fastfetch](https://github.com/LinusDierheimer/fastfetch)

[ly](https://github.com/fairyglade/ly)
chmod +x .xinitrc

[Ranger](https://github.com/ranger/ranger)
apt install ranger
[Ranger preview](https://github.com/ranger/ranger/wiki/Video-Previews)

[Neovim](https://neovim.io/)

Network Manager
networkmanager-dmenu

Fix NetworkManager-wait-online.service

mosh

Ignore laptop lid
/etc/systemd/logind.conf
HandleLidSwitch=ignore
sudo service systemd-logind restart

[a4term](https://a4term.com/)
https://github.com/martanne/dvtm/issues/10

[Ubuntu server disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)

Touchpad tap to click

btop++



#**TODO**
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
