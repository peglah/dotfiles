# [Ignore laptop lid](https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed)

```bash

sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
service systemd-logind restart
```

# [Fix tearing](https://wiki.archlinux.org/title/intel_graphics#Tearing)

# [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)
```bash
systemctl mask sleep.target
systemctl mask suspend.target
systemctl mask hibernate.target
systemctl mask hybrid-sleep.target
```

# Change Caps Lock and ESC
```bash
sed -i '0,/Caps_Lock/s//Escape/' /usr/share/X11/xkb/symbols/pc
sed -i '0,/Escape/s//Caps_Lock/' /usr/share/X11/xkb/symbols/pc
rm -rf /var/lib/xkb/*
reboot
```

