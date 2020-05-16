#!/usr/bin/env zsh

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

setopt COMPLETE_ALIASES
