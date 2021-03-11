#!/usr/bin/env sh

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

if [ ! "$DEVICE" = "no" ]; then
  case "$BLOCK_BUTTON" in
    1) set_default_playback_device_next ;;
    2) amixer -q -D pulse sset "$SCONTROL" "$CAPABILITY" toggle ;;
    3) set_default_playback_device_next -1 ;;
    4) amixer -q -D pulse sset "$SCONTROL" "$CAPABILITY" 5%+ ;;
    5) amixer -q -D pulse sset "$SCONTROL" "$CAPABILITY" 5%- ;;
  esac
fi

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

INFO=""
ICON="奄"

if [ "$DEVICE" = "no" ]; then
  INFO="${VOL}%"
else
  if [ ! "${NAME##*"Analog Stereo"*}" ]; then
    NAME=$(echo $NAME | sed -r 's/^(.*) Analog Stereo$/\1/')
  fi

  INFO="${VOL}% [${NAME}]"
fi

if [ "$VOL" -gt 49 ]; then
  ICON="奔"
fi

if [ "$VOL" -gt 74 ]; then
  ICON=""
fi

if [ "$MUTED" = "muted: yes" ]; then
  ICON="婢"
  INFO="<span color='#BF616A'>${INFO}</span>"
fi

ACTIVE=$(pacmd list-sources | grep "* index" -B4 -A11 | grep "index:\|name:\|volume: \(front\)\|muted:")
for name in INDEX NAME VOL MUTED; do
  read -r ${name?}
done < <(echo "$ACTIVE")

VOL=$(echo "$VOL" | grep -o "[0-9]*%" | head -1)
VOL="${VOL%?}"

NAME=$(pacmd list-sources |\
awk '/^\s*\*/{f=1}/^\s*index:/{f=0}f' |\
grep "device.description" |\
head -n1 |\
sed 's/.*= "\(.*\)".*/\1/')

if [ ! "${NAME##*"Analog Stereo"*}" ]; then
  NAME=$(echo $NAME | sed -r 's/^(.*) Analog Stereo$/\1/')
fi

if [ "$DEVICE" = "no" ]; then
  MIC="<span color='#EBCB8B'></span> ${VOL}%"

  if [ "$MUTED" = "muted: yes" ]; then
    MIC="<span color='#EBCB8B'></span> ${VOL}%"
  fi
else
  MIC="<span color='#EBCB8B'></span> ${VOL}% [${NAME}]"

  if [ "$MUTED" = "muted: yes" ]; then
    MIC="<span color='#EBCB8B'></span> ${VOL}% [${NAME}]"
  fi
fi

echo "${MIC} <span color='#EBCB8B'>${ICON}</span> ${INFO}"

# TODO: correctly setup
