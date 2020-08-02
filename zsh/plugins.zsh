#!usr/bin/env zsh

# check if zinit is installed
if [[ ! -d ~/.zinit ]]; then
  git clone https://github.com/zdharma/zinit.git ~/.zinit
  source ~/.zinit/zinit.zsh && zinit self-update
fi

# essential
source ~/.zinit/zinit.zsh

# zsh-autosuggestions
zinit ice wait lucid atload'!_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# tab completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# fast-syntax-highlighting
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting
