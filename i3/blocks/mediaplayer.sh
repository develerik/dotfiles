#!/usr/bin/env sh

ARTIST=$(playerctl metadata artist)
TITLE=$(playerctl metadata title)

if [ -n "$TITLE" ]; then
  if [ -z "$ARTIST" ]; then
    echo "$TITLE"
  else
    echo "$ARTIST - $TITLE"
  fi
fi
