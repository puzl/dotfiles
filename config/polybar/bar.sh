#!/usr/bin/env bash

pkill polybar
MONITOR=DP-1 polybar main &
sleep 1
MONITOR=DP-2 polybar side &
MONITOR=VGA-1 polybar side &
