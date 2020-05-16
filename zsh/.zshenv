#!/usr/bin/env zsh

export KEYTIMEOUT=1

# locale
export LC_ALL=en_US.UTF-8

# paths
export ANDROID_HOME=$HOME/Android/Sdk
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.local/bin:$HOME/.dotnet/tools:$HOME/bin:$GOPATH/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$HOME/.yarn/bin

# telemetry
export SAM_CLI_TELEMETRY=0
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# pager
export PAGER=/usr/bin/less
export BAT_PAGER="less -RF"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# editor
export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=20000
export SAVEHIST=$HISTSIZE

# terminal
export TERMINAL=/usr/bin/kitty
export TERM="xterm-256color"

# electron
export ELECTRON_TRASH=trash-cli

# gnome-keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
