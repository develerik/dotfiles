#!usr/bin/env zsh

# check if zinit is installed
if [[ ! -d ~/.zinit ]]; then
  git clone https://github.com/zdharma/zinit.git ~/.zinit
  source ~/.zinit/zinit.zsh && zinit self-update
fi

# essential
source ~/.zinit/zinit.zsh

################################################################################
# productive tools                                                             #
################################################################################

# fast-syntax-highlighting, zsh-completions, zsh-autosuggestions
zinit wait lucid for \
  atinit="ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  zdharma/fast-syntax-highlighting \
  blockf \
  zsh-users/zsh-completions \
  atload="!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
