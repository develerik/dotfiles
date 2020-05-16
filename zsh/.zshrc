#!usr/bin/env zsh

#zmodload zsh/zprof

export GPG_TTY=$TTY

# load plugins
. $HOME/.config/zsh/plugins.zsh

# load configuration
. $HOME/.config/zsh/aliases.zsh
. $HOME/.config/zsh/bindings.zsh
. $HOME/.config/zsh/completions.zsh
. $HOME/.config/zsh/options.zsh
. $HOME/.config/zsh/rehashing.zsh

# load custom executable functions
for f ($HOME/.config/zsh/functions/*.zsh(N.)) . $f

# load local configuration
if [[ -f $HOME/.zshrc_local ]]; then
  . $HOME/.zshrc_local
fi

eval "$(starship init zsh)"
