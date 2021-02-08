#!/usr/bin/env sh

ARTIST=$(playerctl -p spotify metadata artist 2> /dev/null)
TITLE=$(playerctl -p spotify metadata title 2> /dev/null)
STATUS=$(playerctl -p spotify status 2> /dev/null)

if [ -n "$TITLE" ]; then
  if [ -z "$ARTIST" ]; then
    INFO="$TITLE"
  else
    INFO="$ARTIST - $TITLE"
  fi
fi

if [ -n "$TITLE" ]; then
  ICON=""
  case $STATUS in
    "Playing") ICON="契" ;;
    "Paused")  ICON="懶" ;;
  esac
  echo "<span color='#D08770'>${ICON}</span> ${INFO}"
fi
