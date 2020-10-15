#!/usr/bin/env zsh

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit -i

setopt complete_in_word # Complete from both ends of a word.
setopt always_to_end    # Move cursor to the end of a completed word.
setopt path_dirs        # Perform path search even on command names with slashes.
setopt auto_menu        # Show completion menu on a succesive tab press.
setopt auto_list        # Automatically list choices on ambiguous completion.
setopt auto_param_slash # If completed parameter is a directory, add a trailing slash.
unsetopt menu_complete  # Do not autoselect the first completion entry.
unsetopt flow_control   # Disable start/stop characters in shell editor.

# use cache
zstyle ':completion::complete:*' use-cache on

# use completion menu for completion when available and items > 2
zstyle ':completion:*:*:*:*:*' menu select=2

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Load completions from commands
if (($+commands[op])); then
  eval "$(op completion zsh)"; compdef _op op
fi

if (($+commands[pipx])); then
  eval "$(register-python-argcomplete pipx)"
fi

if (($+commands[aws])); then
  . aws_zsh_completer.sh
fi

if (($+commands[pipenv])); then
  eval "$(pipenv --completion)"
fi
