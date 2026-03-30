#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# # Launch correct bars
# HOSTNAME=$(hostname)

# case $HOSTNAME in
# *) polybar ;;
# esac

# echo "Bars launched..."


# Launch one bar per monitor
for monitor in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$monitor polybar --reload default &
done

echo "Polybar launched on all monitors"