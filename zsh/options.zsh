#!/usr/bin/env zsh

################################################################################
# colors                                                                       #
################################################################################

# makes color constants available
autoload -U colors
colors

################################################################################
# general                                                                      #
################################################################################

setopt no_beep
unsetopt beep list_beep rm_star_silent

################################################################################
# expansion and globbing                                                       #
################################################################################

# treat the `#`, `~` and `^` characters as part of patterns for globbing
setopt extended_glob

unsetopt nomatch # fix some errors

################################################################################
# history                                                                      #
################################################################################

# save each command's epoch timestamps and the duration in seconds
setopt extended_history

# expire duplicate entries first when trimming history
setopt hist_expire_dups_first

# don't display a line previously found
setopt hist_find_no_dups

# delete old recorded entry if new entry is a duplicate
setopt hist_ignore_all_dups

# don't record an entry that was just recorded again
setopt hist_ignore_dups

# don't record an entry starting with a space
setopt hist_ignore_space

# remove superfluous blanks before recording an entry
setopt hist_reduce_blanks

# don't write duplicate entries in the history file
setopt hist_save_no_dups

# don't execute the line directly instead perform history expansion
setopt hist_verify

# write to the history file immediately, not when the shell exits
setopt inc_append_history

# share history between all sessions
setopt share_history

unsetopt hist_beep

################################################################################
# changing directories                                                         #
################################################################################

# if can't execute the directory, perform the cd command to that
setopt auto_cd

# make cd push the old directory onto the directory stack
setopt auto_pushd

# don't push multiple copies of the same directory onto the stack
setopt pushd_ignore_dups

# do not print the directory stack after pushd or popd
setopt pushd_silent

# have pushd with no arguments act like `pushd $HOME`
setopt pushd_to_home
