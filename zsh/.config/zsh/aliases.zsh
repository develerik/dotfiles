#!/usr/bin/env zsh

# better ls
alias ls='exa'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -T'

# package management
alias pm='pikaur'
alias removeOrphans='pm -Rns $(pm -Qtdq)'
function updatePackages() {
  pm -Syu
  sudo pkgfile -u
  zinit self-update
  zinit update
  nvim +'PlugUpgrade --sync' +qall &> /dev/null
  nvim +'PlugUpdate --sync' +qall &> /dev/null
}
function updateMirrorlist() {
  sudo reflector -c DE -f 5 -p https --ipv4 --sort score --save /etc/pacman.d/mirrorlist
}

# directories
alias mkdir='mkdir -p'
function mkcd() {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# grep
alias grep='ag --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# network
function ovpn() {
  if [[ ! -f /etc/openvpn/client/$1.ovpn ]]; then
    echo "Configuration not found"
    return
  fi
  sudo openvpn /etc/openvpn/client/$1.ovpn
}
function ssh-tmux() {
  /usr/bin/ssh -t $@ "tmux attach || tmux new -s $(whoami)";
}
function socks() {
  /usr/bin/ssh -D 9090 -C -q -N $1
}

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
function cpr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
}
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}

# neovim
alias vim='nvim'
alias vi='nvim'

# archives
function extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.7z)         7z e $1         ;;
      *.tar.bz2)    tar xjf $1      ;;
      *.tar.gz)     tar xzf $1      ;;
      *.pkg.tar.xz) tar xf $1       ;;
      *.bz2)        bunzip2 $1      ;;
      *.rar)        unrar x $1      ;;
      *.gz)         gunzip $1       ;;
      *.tar)        tar xf $1       ;;
      *.tbz2)       tar xjf $1      ;;
      *.tgz)        tar xzf $1      ;;
      *.zip)        unzip $1        ;;
      *.Z)          uncompress $1   ;;
      *)            echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
function compress() {
  tar cvzf $1.tar.gz $1
}

# youtube
function youtube-mp4() {
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $1
}

# docker
function compose() {
  docker-compose -f "${HOME}/Projects/docker/${1}.yml" -p "${1}" "${@:2}"
}
