#!/usr/bin/env sh

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

REG_AMZ="^Amazon\.de: ([a-zA-Z!\[\]. /üöä'-]+) ansehen \| Prime Video$"

# fix amazon prime video
case $title in
  "Amazon.de"*)
    title="$(echo "${title}" | pcregrep -o1 "$REG_AMZ")"
    ;;
esac

result="${artist}"

[ -n "$artist" ] && [ -n "$title" ] && result="${result} - ${title}"
[ -z "$result" ] && result="${title}"
[ -z "$result" ] && result="Nothing playing"

echo "${result}"
