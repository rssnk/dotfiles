#!/bin/sh

# audio
pipewire &
# load xrandr monitor profile
autorandr -c
# disable sleep
xset s off -dpms
# wallpaper
feh --no-fehbg --bg-scale $XDG_DATA_HOME/bg
# bar
dwmblocks &
# composer
picom -b
# for qt apps to see my cursor
export XCURSOR_PATH=$HOME/.local/share/icons
# TODO put these in different place maybe
# disable mouse additional buttons
xmodmap -e "pointer = 1 2 3 4 5 6 7 0 0 0 0 0"
# wm
exec dbus-run-session dwm
