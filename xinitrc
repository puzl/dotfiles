#!/usr/bin/env bash
export PATH=/usr/local/bin:$PATH

#xrandr --output VGA1 --pos 0x0 --left-of DP2
#xrandr --output DP2 --pos 1920x0 --left-of DP1 --right-of VGA1 --primary
#xrandr --output DP1 --pos 3840x0 --right-of DP2

xrdb -merge .Xresources &
xset dpms 600&
xautolock -time 10 -locker i3lock&
gnome-settings-daemon&
nitrogen --restore &
parcellite&
compton&
 
exec /usr/local/bin/i3
