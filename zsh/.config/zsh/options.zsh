#!/usr/bin/env zsh

# history
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt extended_history
unsetopt hist_beep

# navigation
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home

# general
setopt extended_glob
setopt no_beep
unsetopt beep
unsetopt list_beep
unsetopt rm_star_silent
