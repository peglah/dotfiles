# Install OS
Download and install [Raspberry Pi OS (64-bit) Lite](https://www.raspberrypi.com/software/operating-systems/)

Boot with a screen

```bash
service NetworkManager start
nmtui
sudo apt update && sudo apt upgrade -y
timedatectl set-timezone Europe/Stockholm
```

