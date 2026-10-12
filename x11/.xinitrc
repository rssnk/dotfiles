#!/bin/sh

# TODO do i need it
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=dwm

dbus-update-activation-environment DISPLAY

pipewire &

# x11 conf TODO maybe can move somewhere
export XCURSOR_PATH=$HOME/.local/share/icons
xset s off -dpms
xmodmap -e "pointer = 1 2 3 4 5 6 7 0 0 0 0 0"

autorandr -c
feh --no-fehbg --bg-scale $XDG_DATA_HOME/bg &
picom -b
dwmblocks &

while true; do
    dwm
done
