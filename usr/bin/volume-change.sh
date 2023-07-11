#!/usr/bin/env bash


volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')"
volume_percent=$(echo "$volume * 100" | bc | LC_ALL=C xargs /usr/bin/printf "%.*f\n" "$p")



notify-send \
    --app-name sway \
    --expire-time 800 \
    --hint string:x-canonical-private-synchronous:volume \
    --hint "int:value:$volume_percent" \
    --transient \
    "Volume" "$volume_percent"
