#!usr/bin/env zsh

plugins_dir=$HOME/.config/zsh/plugins

defer_blacklist=(
  zsh-defer
)

setopt extendedglob

for file ($plugins_dir/(${(~j:|:)defer_blacklist})/*.plugin.zsh); do
  source $file
done

for file ($plugins_dir/^(${(~j:|:)defer_blacklist})/*.plugin.zsh); do
  zsh-defer source $file
done

unset plugins_dir defer_blacklist file

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# load nvm
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -w __init_nvm | awk '{print $2}')" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
