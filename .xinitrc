#!/bin/sh

# More wallpapers at https://www.reddit.com/r/wallpaper/comments/kedqme/1920x1080_all_resolutions_available_dark_light/
if command -v feh &> /dev/null; then
  feh --bg-fill ~/git/Peglah/dotfiles/pictures/wallapper/CjByCrG.png
fi

if command -v synclient &> /dev/null; then
  synclient MaxSpeed=1
  synclient VertEdgeScroll=0
fi

if command -v unclutter &> /dev/null; then
  unclutter &
fi

if command -v dunst &> /dev/null; then
  dunst &
fi

if command -v dwmblocks &> /dev/null; then
  export PATH=$PATH:/home/peglah/.local/bin:/home/peglah/.local/bin/statusbar
  dwmblocks &
elif command -v slstatus &> /dev/null; then
  slstatus &
elif command -v xsetroot &> /dev/null; then
  while xsetroot -name "`date +"%F %R"` `uptime | sed 's/.*,//'`"
  do
    sleep 1
  done &
fi

if [ -f /usr/lib/polkit-kde-authentication-agent-1 ]; then
    /usr/lib/polkit-kde-authentication-agent-1 &
fi

setxkbmap se

# if dwm exits 0, restart -- this allows hot reloading of config.h
while type dwm >/dev/null ; do dwm && continue || break ; done
