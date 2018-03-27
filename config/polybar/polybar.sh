#!/bin/bash
pkill -x -9 polybar 
echo launching polybar
polybar top&
polybar left&
polybar right&

