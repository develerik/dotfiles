#!/usr/bin/env sh

ARTIST=$(playerctl metadata artist)
TITLE=$(playerctl metadata title)

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

echo $INFO
