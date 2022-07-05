#!/bin/sh

# More wallpapers at https://www.reddit.com/r/wallpaper/comments/kedqme/1920x1080_all_resolutions_available_dark_light/
if [ -f /usr/bin/feh ]; then
  feh --bg-fill ~/dotfiles/pictures/wallapper/CjByCrG.png
fi

if [ -f /usr/bin/unclutter ]; then
  unclutter &
fi

if [ -f /usr/local/bin/slstatus ]; then
  slstatus &
else
  while xsetroot -name "`date +"%F %R"` `uptime | sed 's/.*,//'`"
  do
    sleep 1
  done &
fi

# if dwm exits 0, restart -- this allows hot reloading of config.h
while type dwm >/dev/null ; do dwm && continue || break ; done
