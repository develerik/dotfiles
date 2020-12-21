# dotfiles

This repository contains my personal dotfiles I use every day.
If you have a question or advice, feel free to contact me.

## Table of Contents

1. [Features](#features)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Font Configuration](#font-configuration)
5. [Wacom Setup](#wacom-setup)

## Features

- Everything is themed according to the [Nord](https://nordtheme.com) color scheme
- The dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot)

## Prerequisites

Assumes that you have already installed [git](https://git-scm.com).

## Installation

```sh
git clone --recursive https://github.com/develerik/dotfiles.git ~/.dotfiles

# Install a single configuration (or multiple)
~/.dotfiles/install-standalone <config> [<configs>...]

# Install a whole profile (and additional configurations)
~/.dotfiles/install-profile <profile> [<configs...>]
```

If necessary, special installation instructions are available in the `README.md` file in the package (will be updated soon).

## Font Configuration

`/etc/profile.d/freetype2.sh`

```
export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
```
