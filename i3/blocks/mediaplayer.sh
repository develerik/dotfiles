#!/usr/bin/env sh

ARTIST=$(playerctl metadata artist 2> /dev/null)
TITLE=$(playerctl metadata title 2> /dev/null)

if [ -n "$TITLE" ]; then
  if [ -z "$ARTIST" ]; then
    INFO="$TITLE"
  else
    INFO="$ARTIST - $TITLE"
  fi
fi

# beautify amazon prime
if [ ! "${INFO##*": Amazon.de"*}" ]; then
  INFO=$(echo $INFO | sed -r 's/^(.*): .*: Amazon.de.*$/\1/')
fi


if [ -n "$TITLE" ]; then
  echo $INFO
else
  echo "No playback"
fi
