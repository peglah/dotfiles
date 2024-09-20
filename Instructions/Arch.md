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

## Enable network
```bash
systemctl enable systemd-networkd
nmtui
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

## SSH
```bash
systemctl enable --now sshd.service
```

## Video driver
```bash
lspci -v | grep -A1 -e VGA -e 3D
pacman -Ss xf86-video
# Install correct driver
```

