#!/usr/bin/env sh

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

result="${artist}"

[ -n "$artist" ] && [ -n "$title" ] && result="${result} - ${title}"
[ -z "$result" ] && result="${title}"
[ -z "$result" ] && result="Nothing playing"

echo "${result}"
