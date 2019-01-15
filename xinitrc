#!/usr/bin/env bash
export PATH=/usr/local/bin:$PATH

export XDG_CURRENT_DESKTOP=Gnome

/usr/bin/gnome-keyring-daemon --start --foreground --components=secrets&
/home/hjw/bin/lightdm-resolution.sh
/usr/lib/gnome-settings-daemon/gsd-xsettings&
xrdb -merge .Xresources &
xset dpms 600&
xautolock -time 10 -locker i3lock&
nitrogen --restore &
clipit&
compton&
pasystray&

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

mopidy&
/usr/bin/gnome-keyring-daemon --daemonize --login&
exec i3 2>&1 > /tmp/log 2>&1
