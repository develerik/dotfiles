#!/usr/bin/env sh

# make sure we have installed all necessary tools
[ -x "$(which git)" ] || echo "git is not installed"; exit 1
[ -x "$(which stow)" ] || echo "stow is not installed"; exit 1

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# what directories should be installable by all users including the root user
base=""

# folders that should, or only need to be installed for a local user
useronly="git gpg"

# run the stow command for the passed in directory ($1) in location $HOME
stowit() {
  stow -vRt "${HOME}" "${1}"
}

echo ""
echo "Stowing apps for user: $(whoami)"

# install apps available to local users and root
for app in ${base}; do
  stowit "${app}"
done

# install only user space folders
if [ ! "$(whoami)" = "root" ]; then
  for app in ${useronly}; do
    stowit "${app}"
  done
fi

echo ""
echo "##### ALL DONE"
