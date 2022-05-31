#!/bin/bash

# NOTE: You need the "playerctl" pachage in order for this to work!!!
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

case $1 in
    up)
        pactl set-sink-volume $sink +5%
        ;;
    down)
        pactl set-sink-volume $sink -5%
        ;;
    toggle)
        exec pactl set-sink-mute $sink toggle
        ;;
esac

