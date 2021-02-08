#!/usr/bin/env sh

################################################################################
# java apps                                                                    #
################################################################################

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel ${_JAVA_OPTIONS}"

# fix reparenting issue of java apps when using tiling wm
export _JAVA_AWT_WM_NONREPARENTING=1

################################################################################
# compiler                                                                     #
################################################################################

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

################################################################################
# locale                                                                       #
################################################################################

if [[ -z "${LANG}" ]]; then
  export LANG="en_US.UTF-8"
  export LANGUAGE="en_US.UTF-8"
fi

export LC_TIME="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_PAPER="de_DE.UTF-8"
export LC_TELEPHONE="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"

export LESSCHARSET="utf-8"

################################################################################
# paths                                                                        #
################################################################################

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin:$HOME/.dotnet/tools"

################################################################################
# android                                                                      #
################################################################################

export ANDROID_HOME="$HOME/android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

################################################################################
# golang                                                                       #
################################################################################

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export CGO_ENABLED="0"
export GO111MODULE="auto"
export PATH="$PATH:$GOBIN"

################################################################################
# ruby                                                                         #
################################################################################

export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"

################################################################################
# telemetry                                                                    #
################################################################################

export SAM_CLI_TELEMETRY="0"
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

################################################################################
# history                                                                      #
################################################################################

export HISTFILE="$HOME/.zhistory"
export HISTSIZE="20000"
export SAVEHIST="$HISTSIZE"

################################################################################
# pager                                                                        #
################################################################################

export PAGER="/usr/bin/less"

################################################################################
# preferred text editor                                                        #
################################################################################

export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"

################################################################################
# bat                                                                          #
################################################################################

export BAT_THEME="Nord"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

################################################################################
# misc                                                                         #
################################################################################

# the time the shell waits, for another key to be pressed in milliseconds
export KEYTIMEOUT=1

# starship
export STARSHIP_CONFIG="$HOME/.config/shell/starship.toml"

# terminal
export TERM="xterm-256color"

# electron
export ELECTRON_TRASH="/usr/bin/trash"
