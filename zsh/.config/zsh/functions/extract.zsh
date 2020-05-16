#!/usr/bin/env zsh

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
