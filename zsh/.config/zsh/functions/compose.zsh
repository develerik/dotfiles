#!/usr/bin/env zsh

function compose() {
  docker-compose -f "/opt/docker/${1}.yml" -p "${1}" "${@:2}"
}
