#!/usr/bin/env zsh

################################################################################
# ls                                                                           #
################################################################################

alias ls='exa'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'

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
[[ -f "/usr/bin/trash" ]] && alias rm='trash'

# move nodes with interactive mode and extra verbosity
alias mv='mv -iv'

# copy nodes with interactive mode and extra verbosity
alias cp='cp -iv'

# link nodes with interactive mode and extra verbosity
alias ln='ln -iv'

# make missing parent directories when creating folders
alias mkdir='mkdir -p'

# make directory and cd
function mcd() {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# display size of files and folders under current directory
alias du='du --max-depth=1 --si'

# display all disk usage statistics with SI units and FS types
alias df='df --all --si --print-type' 

################################################################################
# misc                                                                         #
################################################################################

alias g='git'

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
function youtube-mp4() {
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $1
}

################################################################################
# rsync                                                                        #
################################################################################

function cpr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
}
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}

################################################################################
# archives                                                                     #
################################################################################

function compress() {
  tar cvzf $1.tar.gz $1
}
function extract() {
  if [ -f $1 ]; then
    case $1 in
      (*.7z) 7z e $1 ;;
      (*.bz2) bunzip2 $1 ;;
      (*.gz) gunzip $1 ;;
      (*.pkg.tar.xz) tar xf $1 ;;
      (*.rar) unrar x $1 ;;
      (*.tar) tar xf $1 ;;
      (*.tar.bz2) tar xjf $1 ;;
      (*.tar.gz) tar xzf $1 ;;
      (*.tbz2) tar xjf $1 ;;
      (*.tgz) tar xzf $1 ;;
      (*.zip) unzip $1 ;;
      (*.Z) uncompress $1 ;;
      (*.exe) cabextract $1 ;;
      (*) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

################################################################################
# openvpn                                                                      #
################################################################################

function ovpn-start() {
  if [[ ! -f /etc/openvpn/client/$1.conf ]]; then
    echo "Configuration not found"
    return
  fi
  sudo systemctl start "openvpn-client@${1}"
}
function ovpn-stop() {
  if [[ ! -f /etc/openvpn/client/$1.conf ]]; then
    echo "Configuration not found"
    return
  fi
  sudo systemctl stop "openvpn-client@${1}"
}

################################################################################
# ssh                                                                          #
################################################################################

function ssh() {
  kitty +kitten ssh "$@"
}

function ssh-tmux() {
  ssh -t $@ "tmux attach || tmux new -s $(whoami)"
}

################################################################################
# nvm                                                                          #
################################################################################

function nvm() {
  if [[ -d "${HOME}/.nvm" ]]; then
    NVM_DIR="${HOME}/.nvm"
    export NVM_DIR
    . "${NVM_DIR}/nvm.sh"
    if [[ -e $HOME/.nvm/alias/default ]]; then
      PATH="${PATH}:${NVM_DIR}/versions/node/$(cat $NVM_DIR/alias/default)/bin"
    fi
    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}
