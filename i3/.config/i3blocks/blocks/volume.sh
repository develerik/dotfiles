#!/usr/bin/env bash

set -a

SCONTROL=$(amixer -D pulse scontrols | sed -n "s/Simple mixer control '\([^']*\)',0/\1/p" | head -n1)
CAPABILITY=$(amixer -D pulse get "$SCONTROL" | sed -n "s/  Capabilities:.*cvolume.*/Capture/p")

move_sinks_to_new_default() {
  DEFAULT_SINK=$1
  pacmd list-sink-inputs | grep index: | grep -o '[0-9]\+' | while read -r SINK
  do
    pacmd move-sink-input "$SINK" "$DEFAULT_SINK"
  done
}

set_default_playback_device_next() {
  inc=${1:-1}
  num_devices=$(pacmd list-sinks | grep -c index:)
  mapfile -t sink_arr < <(pacmd list-sinks | grep index: | grep -o '[0-9]\+')
  default_sink_index=$(( $(pacmd list-sinks | grep index: | grep -no '*' | grep -o '^[0-9]\+') - 1 ))
  default_sink_index=$(( (default_sink_index + num_devices + inc) % num_devices ))
  default_sink=${sink_arr[$default_sink_index]}
  pacmd set-default-sink "$default_sink"
  move_sinks_to_new_default "$default_sink"
}

case "$BLOCK_BUTTON" in
  1) set_default_playback_device_next ;;
  2) amixer -q -D pulse sset "$SCONTROL" "$CAPABILITY" toggle ;;
  3) set_default_playback_device_next -1 ;;
  4) amixer -q -D pulse sset "$SCONTROL" "$CAPABILITY" 5%+ ;;
  5) amixer -q -D pulse sset "$SCONTROL" "$CAPABILITY" 5%- ;;
esac

ACTIVE=$(pacmd list-sinks | grep "state\: RUNNING" -B4 -A7 | grep "index:\|name:\|volume: \(front\|mono\)\|muted:")
[ -z "$ACTIVE" ] && ACTIVE=$(pacmd list-sinks | grep "index:\|name:\|volume: \(front\|mono\)\|muted:" | grep -A3 '.*')
for name in INDEX NAME VOL MUTED; do
  read -r ${name?}
done < <(echo "$ACTIVE")
VOL=$(echo "$VOL" | grep -o "[0-9]*%" | head -1 )
VOL="${VOL%?}"

NAME=$(pacmd list-sinks |\
awk '/^\s*\*/{f=1}/^\s*index:/{f=0}f' |\
grep "device.description" |\
head -n1 |\
sed 's/.*= "\(.*\)".*/\1/')

[ "$MUTED" = "muted: no" ] && echo "${VOL}% [${NAME}]" || echo "muted"

