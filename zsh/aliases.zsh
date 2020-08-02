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
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# clear
alias cls='clear'

# files
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='trash'

# neovim
alias vimdiff='nvim -d'
alias vim='nvim'
alias vi='nvim'

# 1password
alias op-login='eval $(op signin my)'

# noglob
alias rsync='noglob rsync'
alias git='noglob git'
alias scp='noglob scp'

# kittens
ssh() {
  kitty +kitten ssh "$@"
}

# rsync actions
function cpr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
}
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}

# archives
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
      (*) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function mcd() {
  [[ -n "$1" ]] && mkdir -p -p "$1" && builtin cd "$1"
}

# openvpn
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

# ssh + tmux
function ssh-tmux() {
  ssh -t $@ "tmux attach || tmux new -s $(whoami)"
}

# youtube-dl
function youtube-mp4() {
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $1
}

# lazy load nvm
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
