# Instructions
```bash
sudo apt install ansible -y
ssh-copy-id user@host
ansible all -m ping
ansible-playbook run.yml
```
# run.yml

## Basics
Check if snap is installed
Remove snaps
Stop snapd service
Disable snapd service
Mask snapd service
Uninstall snapd package
Mark snapd package as hold
Create APT preferences for nosnap
Insert APT preferences for nosnap
Remove snap directories
Attempt to remove /snap directory
Reboot and wait for system to come back online
Attempt to remove /snap directory again after reboot
Update and upgrade packages
Install packages
Set timezone to Europe/Stockholm
Mask systemd targets
Clone dotfiles repository
Creating symlinks
Install Mosh dependencies
Clone Mosh repository
Compile and Install Mosh
Install Fastfetch dependencies
Clone fastfetch repository
Create build directory
Configure fastfetch
Build fastfetch
Install fastfetch
Install Neovim dependencies
Clone Neovim repository
Build Neovim
Install Neovim
Run Neovim headlessly for plugin installation

## GUI
Install X Server and dependencies
Create "{{ ansible_env.HOME }}/.fonts directory
Unzip Nerd Fonts
Update font cache
Compile dmenu
Install dmenu
Compile dwm
Install dwm
Compile slstatus
Install slstatus
Compile st
Install st
Install unclutter-xfixes dependencies
Clone unclutter-xfixes repository
Build unclutter-xfixes
Install unclutter-xfixes

## Laptop
Install laptop stuff
Update HandleLidSwitch setting in logind.conf
Create Synaptics Touchpad config file
Configure Synaptics Touchpad
Modify XKB Symbols - Swap Caps Lock and Escape
Modify XKB Symbols - Swap Escape and Caps Lock
Remove xkb cache
Install ly dependencies
Clone ly repository with submodules
Build ly
Install ly
Enable ly.service
Disable getty@tty2.service
