#!/bin/bash
kill -s SIGUSR1 "$(pgrep -f sway-blur.py)"
grim -g "$(slurp)" - | wl-copy -t image/png
