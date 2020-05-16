#!usr/bin/env zsh

# check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# essential
source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "auscompgeek/fast-syntax-highlighting"

# install packages that have not been installed yet
if ! zplug check --verbose; then
  zplug install
fi

zplug load
