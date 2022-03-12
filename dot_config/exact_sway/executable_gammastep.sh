#!/bin/bash
sleep 0.2
pkill gammastep
sleep 0.2
pkill gammastep
sleep 0.5
gammastep & disown
