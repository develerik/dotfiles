# dotfiles

Managed by dotbot

## Table of Contents

1. [Prerequisites](#Prerequisites)
2. [Installation](#Installation)
3. [License](#License)

## Prerequisites

Assumes that you have already installed [git](https://git-scm.com) (with lfs).

## Installation

```sh
git clone --recursive https://github.com/develerik/dotfiles.git ~/.dotfiles

# Install single configurations
./.dotfiles/install-standalone <configs...>

# Install a whole profile (and additional configurations)
./.dotfiles/install-profile <profile> [<configs...>]
```

If necessary, special installation instructions are available in the `README.md` file in the package (will be updated soon).

## License

This repository is available under the [ISC license](LICENSE). Feel free to fork and modify the dotfiles as you please.
