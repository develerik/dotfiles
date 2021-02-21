#!/usr/bin/env sh

set -a

if [ ! "$DEVICE" = "no" ]; then
  case "$BLOCK_BUTTON" in
    2) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
  esac
fi

VOL=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $((SINK + 1)) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
MUTED=$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $((SINK + 1)) | tail -n 1 | cut -c8-)
NAME=$(pactl list sinks | grep '^[[:space:]]Description:' | head -n $((SINK + 1)) | tail -n 1 | cut -c15-)

INFO=""
ICON="奄"

if [ "$DEVICE" = "no" ]; then
  INFO="${VOL}%"
else
  INFO="${VOL}% [${NAME}]"
fi

if [ "$VOL" -gt 49 ]; then
  ICON="奔"
fi

if [ "$VOL" -gt 74 ]; then
  ICON=""
fi

if [ "$MUTED" = "yes" ]; then
  ICON="婢"
  INFO="<span color='#BF616A'>${INFO}</span>"
fi

echo "<span color='#EBCB8B'>${ICON}</span> ${INFO}"
