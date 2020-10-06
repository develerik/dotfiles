#!usr/bin/env zsh

plugins_dir=$HOME/.config/zsh/plugins

zplugins=(
  fast-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
)

for p in $zplugins; do
  p_path=$plugins_dir/$p/$p.plugin.zsh
  if [ -e $p_path ]; then
    source $p_path
  fi
done

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
