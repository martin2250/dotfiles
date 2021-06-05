#!/bin/bash

killall -q compton

while pgrep -u $UID -x compton >/dev/null; do sleep 0.2; done

picom --config ~/.config/picom/picom.conf -b &