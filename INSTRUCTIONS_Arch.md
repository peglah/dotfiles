# Install OS
## Fix layout
```bash
loadkeys sv-latin1
```

## iwctl
```bash
device list
station device scan
station device get-networks
station device connect SSID
```

## fdisk
```bash
lsblk
cfdisk /dev/sda
#sda1 EFI system partition  +550M
#sda2 Linux swap            +2G
#sda3 Ext4
```

## Make filesystem
```bash
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
```

## Fix pacman
```bash
vim /etc/pacman.conf  # IgnorePkg = sudo
                      # Color
                      # ParallelDownloads = 5
```

## Base Install
```bash
pacstrap -K /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
```

## Chroot
```bash
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
hwclock --systohc
pacman -S --noconfirm neovim
nvim /etc/locale.gen # en_US-UTF8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=sv-latin1" > /etc/vconsole.conf
```

## Users
```bash
passwd
useradd -m username
passwd username
usermod -aG wheel,audio,video,storage username
```

## Sudo
```bash
pacman -S opendoas
nvim /etc/doas.conf # permit persist :wheel
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf
ln -s /usr/bin/doas /usr/bin/sudo
```

## GRUB
```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Networking
```bash
pacman -S networkmanager 
systemctl enable NetworkManager
```

## Reboot
```bash
exit
umount -l /mnt
shutdown now
# Detach the ISO
```

# First boot
## Fix layout again
```bash
localectl set-keymap --no-convert sv-latin1
```

## Setup git
```bash
systemctl enable systemd-networkd
nmtui
mkdir ~/git
pacman -S git
git config --global user.name "username"
git config --global user.email "usern@name.com"
git config --global credential.helper cache
```

## Fix pacman again
```bash
nvim /etc/pacman.conf # ParallelDownloads = 5
                      # Color
                      # IgnorePkg = sudo
```

## Update
```bash
pacman -Syu
```

# Install programs
```bash
pacman -S bat eza feh unclutter mosh ranger highlight w3m ffmpegthumbnailer mpv btop openssh firefox qutebrowser alsa-utils pulseaudio fakeroot pkg-config make patch autoconf automake
```

## Paru AUR helper
```bash
git clone https://aur.archlinux.org/paru.git ~/git/paru
cd ~/git/paru
makepkg -si
```

```bash
paru -S fastfetch ly ncpamixer
```

## Ly
```bash
systemctl enable ly.service
systemctl disable getty@tty2.service
```

## SSH
```bash
systemctl enable sshd.service
systemctl start sshd.service
```

## Dotfiles
```bash
git clone --recurse-submodules -j8 https://github.com/Peglah/dotfiles.git ~/git/dotfiles

ln -s ~/git/dotfiles/.bash_aliases ~/.bash_aliases
rm ~/.bashrc
ln -s ~/git/dotfiles/.bashrc ~/.bashrc
ln -s ~/git/dotfiles/.config ~/.config
ln -s ~/git/dotfiles/.xinitrc ~/.xinitrc
ln -s ~/git/dotfiles/.config/nvim/.editorconfig ~/.editorconfig
rm ~/.gitconfig
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig

chmod +x ~/.xinitrc

nvim --headless "+Lazy! sync" +qa
```

## Video driver
```bash
lspci -v | grep -A1 -e VGA -e 3D
pacman -Ss xf86-video
# Install correct driver
```

## Xorg
```bash
pacman -S xorg xorg-xinit ttf-firacode-nerd
```

## Suckless
```bash
cd ~/git/dotfiles/bin/suckless/dmenu* && makepkg -sifc
cd ~/git/dotfiles/bin/suckless/slstatus && makepkg -sifc
cd ~/git/dotfiles/bin/suckless/st* && makepkg -sifc
cd ~/git/dotfiles/bin/suckless/dwm* && makepkg -sifc
```

## xrdp
```bash
pacman -S sbc
paru -S xrdp pulseaudio-module-xrdp
mkdir /etc/systemd/system/pulseaudio.service.d
nvim /etc/systemd/system/pulseaudio.service.d/xrdp.conf
  [Service]
  Environment="PULSE_SCRIPT=/etc/xrdp/pulse/default.pa"
ln -s ~/.xinitrc ~/.xsession
```

# Fixes
## Disable sleep when lid is closed
```bash
sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
```


Fix tearing
https://wiki.archlinux.org/title/intel_graphics#Tearing

TODO
enable media buttons
fix screen flicker
tap to click
Notifications
Tab completion, git
Change Caps Lock and ESC







## [Ignore laptop lid](https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed)
```bash
#sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
#service systemd-logind restart
```

## [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)
```bash
systemctl mask sleep.target
systemctl mask suspend.target
systemctl mask hibernate.target
systemctl mask hybrid-sleep.target
```

## Change Caps Lock and ESC
```bash
#sed -i '0,/Caps_Lock/s//Escape/' /usr/share/X11/xkb/symbols/pc
#sed -i '0,/Escape/s//Caps_Lock/' /usr/share/X11/xkb/symbols/pc
#rm -rf /var/lib/xkb/*
#reboot
```

### [a4term](https://a4term.com/)
https://github.com/martanne/dvtm/issues/10

# **TODO**
apt install ncmpcpp mopidy mopidy-mpd mopidy-alsamixer
mkdir -p ~/.config/ncmpcpp/
cp /usr/share/doc/ncmpcpp/examples/config ~/.config/ncmpcpp/
echo http://fm02-ice.stream.khz.se/fm02_mp3 > ~/banditrock.m3u
sudo mv ~/banditrock.m3u /var/lib/mopidy/m3u/

mopidyctl config >> /etc/mopidy/mopidy.conf

fix viz
/etc/mopidy/mopidy.conf
output = tee name=t t. ! queue ! autoaudiosink t. ! queue ! audioresample ! audioconvert ! audio/x-raw,rate=44100,channels=2,format=S16LE ! wavenc ! filesink location=/tmp/mpd.fifo

systemctl enable mopidy
systemctl start mopidy
