#!/usr/bin/env sh

# make sure we have installed all necessary tools
if [ ! -x "$(which git)" ]; then
  echo "git is not installed"
  exit 1
fi

if [ ! -x "$(which stow)" ]; then
  echo "stow is not installed"
  exit 1
fi

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# what directories should be installable
packages="gnupg ssh tmux kitty chromium rofi dunst i3 nvim zsh k9s fonts tools pulse"

echo ""
echo "Stowing apps for user: $(whoami)"

# install available packages
for package in ${packages}; do
  stow -vRt "${HOME}" "${package}"
done

echo ""
echo "##### ALL DONE"
