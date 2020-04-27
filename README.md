# dotfiles

Managed by stow

## Table of Contents

1. [Prerequisites](#Prerequisites)
2. [Installation](#Installation)

## Prerequisites

Assumes that you have already installed `git` and `stow`.

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
   stow -vRt "${HOME}" <package>
   ```

If necessary, special installation instructions are available in the `README.md` file in the package.
