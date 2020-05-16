#!/usr/bin/env zsh

function compress() {
  tar cvzf $1.tar.gz $1
}
