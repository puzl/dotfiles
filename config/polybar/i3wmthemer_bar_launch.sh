#!/bin/env sh

pkill polybar
MONITOR=DP2 polybar i3wmthemer_bar &
sleep 1
MONITOR=DP1 polybar i3wmthemer_bar &
MONITOR=VGA1 polybar i3wmthemer_bar &
