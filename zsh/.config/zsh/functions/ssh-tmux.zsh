#!/usr/bin/env zsh

function ssh-tmux() {
  /usr/bin/ssh -t $@ "tmux attach || tmux new -s $(whoami)";
}
