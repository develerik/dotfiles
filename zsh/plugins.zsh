#!usr/bin/env zsh

plugins_dir=$HOME/.config/zsh/plugins

source $plugins_dir/zsh-defer/zsh-defer.plugin.zsh
zsh-defer source $plugins_dir/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
zsh-defer source $plugins_dir/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

unset plugins_dir

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  . /usr/share/doc/pkgfile/command-not-found.zsh
fi

if (($+commands[starship])); then
  eval "$(starship init zsh)"
fi

# load nvm alternative fnm
if (($+commands[fnm])); then
  eval "`fnm env --use-on-cd`"
fi
