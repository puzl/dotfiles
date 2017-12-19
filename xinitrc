#!/usr/bin/env bash
export PATH=/usr/local/bin:$PATH
xrdb -merge .Xresources &
xrandr --output DP1 --primary&
xset dpms 600&
xautolock -time 10 -locker i3lock&
gnome-settings-daemon&
nitrogen --restore &
 
exec /usr/local/bin/i3
