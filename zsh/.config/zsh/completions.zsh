#!/usr/bin/env zsh

_zcompinit() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR:-$HOME}/.zcompdump
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed if dump is newer or
  # missing. Do in background for next time to not affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
    compinit -i -d "$zcd"
    { command rm -f "$zcdc" && zcompile "$zcd" } &!
  else
    compinit -i -C -d "$zcd"
    { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && command rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}

_zcompinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

setopt COMPLETE_ALIASES
