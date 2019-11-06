#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch correct bars
if [ `hostname` = 'etienne-IRIT' ]; then
    polybar left & 
    polybar right;
else
    if [ `hostname` = 'etienne-UX32VD' ]; then
        polybar smalllaptop;
    else
        polybar mainlaptop
    fi
fi

echo "Bars launched..."
