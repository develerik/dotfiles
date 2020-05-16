#!usr/bin/env zsh

# make directory and change into it
function mcd() {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}
