#!/usr/bin/env sh

################################################################################
# ls                                                                           #
################################################################################

alias ls='exa'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'

################################################################################
# grep                                                                         #
################################################################################

# grep with colors and ignore common directories
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"'
alias fgrep='fgrep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"'
alias egrep='egrep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"'

################################################################################
# editor                                                                       #
################################################################################

alias vimdiff='nvim -d'
alias vim='nvim'
alias vi='nvim'

################################################################################
# core                                                                         #
################################################################################

# use `trash` program instead of built-in irrecoverable way to delete nodes
alias rm='trash'

# move nodes with interactive mode and extra verbosity
alias mv='mv -iv'

# copy nodes with interactive mode and extra verbosity
alias cp='cp -iv'

# link nodes with interactive mode and extra verbosity
alias ln='ln -iv'

# make missing parent directories when creating folders
alias mkdir='mkdir -p'

# display size of files and folders under current directory
alias du='du --max-depth=1 --si'

# display all disk usage statistics with SI units and FS types
alias df='df --all --si --print-type'

################################################################################
# misc                                                                         #
################################################################################

alias nvm='fnm'

# package management
alias pm='pikaur'

# clear
alias cls="printf '\033[2J\033[3J\033[1;1H'"

# 1password
alias op-login='eval $(op signin my)'

# noglob
alias rsync='noglob rsync'
alias git='noglob git'
alias scp='noglob scp'

# youtube-dl
alias ytd='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

# rsync
alias mvr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files'
alias cpr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1'

################################################################################
# ssh + vpn                                                                    #
################################################################################

alias kssh='kitty +kitten ssh'
alias oc='sudo openconnect'

################################################################################
# misc                                                                         #
################################################################################

alias javactl='sudo archlinux-java'

function mcd() {
  [ -n "$1" ] && mkdir -p -- "$1" && cd -P -- "$1"
}
