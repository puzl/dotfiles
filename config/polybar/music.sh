#!/bin/bash

# NOTE: You need the "playerctl" pachage in order for this to work!!!

exec 2>/dev/null
pactl list sinks | grep "Mute: yes" 2>&1 > /dev/null 
if [[ $? -eq 0 ]]; then
    VOLUME="Muted"
else
    VOLUME=$(pactl list sinks | grep Volume:\ front | awk '{print $5}')
fi
if [ "$(playerctl status)" = "Playing" ]; then
  title=`exec playerctl metadata xesam:title`
  artist=`exec playerctl metadata xesam:artist`
  echo "$VOLUME [$artist] $title"
else
  echo "$VOLUME :: No song currently playing"
fi
