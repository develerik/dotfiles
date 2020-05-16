#!/usr/bin/env zsh

function updatePackages() {
  pm -Syu
  sudo pkgfile -u
  zinit self-update
  zinit update
  nvim +'PlugUpgrade --sync' +qall &> /dev/null
  nvim +'PlugUpdate --sync' +qall &> /dev/null
}
