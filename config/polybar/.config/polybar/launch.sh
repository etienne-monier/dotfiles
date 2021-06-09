#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch correct bars
HOSTNAME=`hostname`

case $HOSTNAME in
  'etienne-IRIT') polybar left & polybar right;;
  'etienne-UX32VD') polybar smalllaptop;;
  'etienne-home') polybar homelaptop;;
  'PO20212LXe') polybar cslaptop;;
  *) polybar mainlaptop
esac

echo "Bars launched..."
