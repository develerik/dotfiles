#!/usr/bin/env zsh

function ovpn() {
  if [[ ! -f /etc/openvpn/client/$1.ovpn ]]; then
    echo "Configuration not found"
    return
  fi
  sudo openvpn /etc/openvpn/client/$1.ovpn
}
