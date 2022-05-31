#!/bin/bash
sink=0
vol=0
muted=0

while read line
do
    if [[ $line =~ .*index:\ ([0-9]+) ]]; then
        current_index=${BASH_REMATCH[1]}
    fi
    if [[ $line =~ .*state:.*RUNNING.* ]]; then
        sink=$current_index
    fi
    if [[ $sink -gt 0 && $sink -eq $current_index ]]; then
        if [[ $line =~ .*volume:.*front-left:.*\ ([0-9]+)%.*front-right.* ]]; then
            vol=${BASH_REMATCH[1]}
        fi
        if [[ $line =~ .*muted:\ yes ]]; then
            muted=1
        fi
    fi
done <<< "$(pacmd list-sinks | grep -e 'index:' -e 'state:' -e 'volume:' -e 'muted:' )"

exec 2>/dev/null

if [[ $muted -eq 1 ]]; then
    VOLUME="$ICON_MUTED Muted"
else
    VOLUME=$vol
fi
if [ "$(playerctl status)" = "Playing" ]; then
  title=`exec playerctl metadata xesam:title`
  artist=`exec playerctl metadata xesam:artist`
  PLAYING="[$artist] $title"
else
  PLAYING="Nothing"
fi

echo "$VOLUME $PLAYING"
