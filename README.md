# dotfiles

Managed by stow

## Table of Contents

1. [Prerequisites](#Prerequisites)
2. [Installation](#Installation)
3. [License](#License)

## Prerequisites

Assumes that you have already installed [git](https://git-scm.com) and [stow](https://www.gnu.org/software/stow).

## Installation

1. Clone this repository

   ```sh
   git clone https://github.com/develerik/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Install packages

   ```sh
   # install the whole collection
   ./setup.sh

   # install a single package
   git submodule init
   git submodule update
   stow -vRt "${HOME}" <package>
   ```

If necessary, special installation instructions are available in the `README.md` file in the package.

## License

This repository is available under the [ISC license](LICENSE). Feel free to fork and modify the dotfiles as you please.
