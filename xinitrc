#!/usr/bin/env bash
export PATH=/usr/local/bin:$PATH

/home/hjw/bin/lightdm-resolution.sh
xrdb -merge .Xresources &
xset dpms 600&
xautolock -time 10 -locker i3lock&
gnome-settings-daemon&
nitrogen --restore &
parcellite&
compton&
 
exec /usr/local/bin/i3
