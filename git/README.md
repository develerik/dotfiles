# Git

## Table of Contents

1. [Features](#Features)
2. [Prerequisites](#Prerequisites)
3. [Identities](#Identities)

## Features

- utilizes `neovim` and `Visual Studio Code`
- adds useful aliases (run `git aliases` to get a list)
- uses rebase for pull
- always gpg signs commits
- caches credentials for 1 day
- automatically prunes branches and tags on fetch
- configures `git-lfs`
- uses short format for `git status`
- uses identities to determine user configuration (see [Identities](#Identities))
- includes local configuration `~/.gitconfig_local`
- better wasm diff

## Prerequisites

This package assumes that you have installed the following tools:

- [neovim](https://neovim.io)
- [Visual Studio Code](https://code.visualstudio.com)
- [git-lfs](https://git-lfs.github.com)

## Identities

1. If you have set up global identities, remove them

   ```sh
   git config --global --unset user.name
   git config --global --unset user.email
   git config --global --unset user.signingkey
   ```

2. *(optional)* Generate GPG keys for each identity

   ```sh
   gpg --full-gen-key
   ```

3. Export public keys

   ```sh
   gpg --list-secret-keys --keyid-format LONG <your email>
   ```

4. Setup identities in `.gitconfig.local`

   ```plain
   [user "<identity name>"]
     name = <your name>
     email = <your email>
     signingkey = <your gpg serial>
   ```
