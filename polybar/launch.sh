#!/usr/bin/env sh

# Terminate already running bar instances
pkill -x polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch status bar
polybar status &
polybar sec & 
echo "Bars launched..."
