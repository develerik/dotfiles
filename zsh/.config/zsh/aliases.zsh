#!/usr/bin/env zsh

# better ls
alias ls='exa'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'

# package management
alias pm='pikaur'

# directories
alias mkdir='mkdir -p'

# grep
alias grep='rg'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# diff
alias diff='diff-so-fancy'

# find
alias find='fd'

# clear
alias cls='clear'

# files
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='trash'

# neovim
alias vim='nvim'
alias vi='nvim'

# fzf
alias explore='fzf --preview "bat {-1} --color=always"'

# 1password
alias op-login='eval $(op signin my)'
