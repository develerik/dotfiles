#!/usr/bin/env zsh

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

setopt complete_in_word # Complete from both ends of a word.
setopt always_to_end    # Move cursor to the end of a completed word.
setopt path_dirs        # Perform path search even on command names with slashes.
setopt auto_menu        # Show completion menu on a succesive tab press.
setopt auto_list        # Automatically list choices on ambiguous completion.
setopt auto_param_slash # If completed parameter is a directory, add a trailing slash.
unsetopt menu_complete  # Do not autoselect the first completion entry.
unsetopt flow_control   # Disable start/stop characters in shell editor.

zstyle ':completion::complete:*' use-cache 1

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# menu if nb items > 2
zstyle ':completion:*' menu select=2
