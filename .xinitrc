#!/bin/sh

# More wallpapers at https://www.reddit.com/r/wallpaper/comments/kedqme/1920x1080_all_resolutions_available_dark_light/
feh --bg-fill ~/dotfiles/wallapper/CjByCrG.png

slstatus &
#while xsetroot -name "`date +"%F %R"` `uptime | sed 's/.*,//'`"
#do
#        sleep 1
#done &

# if dwm exits 0, restart -- this allows hot reloading of config.h
while type dwm >/dev/null ; do dwm && continue || break ; done
