#!/usr/bin/env zsh

function youtube-mp4() {
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $1
}
