#!/bin/env sh

pkill polybar
MONITOR=DP1 polybar main &
sleep 1
MONITOR=DP2 polybar side &
MONITOR=VGA1 polybar side &
