#!/bin/bash

killall -q picom

while pgrep -u $UID -x picom >/dev/null; do sleep 0.2; done

picom --config ~/.config/picom/picom.conf -b &
