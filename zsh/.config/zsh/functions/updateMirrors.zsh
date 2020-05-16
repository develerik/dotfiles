#!/usr/bin/env zsh

function updateMirrors() {
  sudo reflector -c DE -f 5 -p https --ipv4 --sort score --save /etc/pacman.d/mirrorlist
}
