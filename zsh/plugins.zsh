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

