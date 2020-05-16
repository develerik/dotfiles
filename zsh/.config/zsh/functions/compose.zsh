#!/usr/bin/env zsh

function compose() {
  docker-compose -f "${HOME}/Projects/docker/${1}.yml" -p "${1}" "${@:2}"
}
