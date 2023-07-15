#!/usr/bin/env bash

CHOICE=$(printf "󰾆 Power Saver\n󰾅 Balanced\n󰓅 Performance" | fuzzel --dmenu --prompt " Select Power Profile:  " | awk '{print $2}')

case "$CHOICE" in
    Power)
        powerprofilesctl set power-saver
        ;;
    Balanced)
        powerprofilesctl set balanced
        ;;
    Performance)
        powerprofilesctl set performance
        ;;
esac
