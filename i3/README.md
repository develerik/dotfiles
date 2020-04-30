# i3

## Table of Contents

1. [Features](#Features)
2. [Prerequisites](#Prerequisites)

## Features

- uses `win` as mod key
- uses vi keys for navigation
- configures 3 DP monitors
- uses nord theme
- disables window borders
- adds shortcuts for screenshots and recordings
- adds applications launcher
- adds terminal shortcut
- uses mod key to move floating windows
- adds a terminal scratchpad (`mod` + `minus`)
- toggle floating (`mod` + `shift` + `space`)
- rename workspaces (`mod` + `shift` + `n`)
- configures media controls
- allows to switch keyboard layout (`mod` + `caps`)
- adds the following modes:
  - resize (`mod` + `r`): resize windows
  - system (`mod` + `End`): controls system
  - passthrough (`mod` + `p`): disables i3 key bindings
- autostarts the following applications:
  - `setxkbmap`: load keyboard layouts
  - `polkit-gnome-authentication-agent`: authenticate users
  - `dunst`: notification service
  - `picom`: composition manager
  - `feh`: wallpapers
- defines two `i3blocks` status bars (for main and secondary monitors)
- uses lightdm to lock the session

## Prerequisites

This package assumes that you have installed the following tools:

- [kitty](https://sw.kovidgoyal.net/kitty)
- [rofi](https://github.com/davatorium/rofi)
- [flameshot](https://flameshot.js.org)
- [peek](https://github.com/phw/peek)
- [playerctl](https://github.com/altdesktop/playerctl)
- [dunst](https://github.com/dunst-project/dunst)
- [picom](https://github.com/yshui/picom)
- [xkb-switch](https://github.com/grwlf/xkb-switch)
- [feh](https://feh.finalrewind.org)
- [i3blocks](https://github.com/vivien/i3blocks)
- [lightdm](https://github.com/canonical/lightdm)
- alsa and pulse audio
