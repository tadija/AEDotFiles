# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

# me

export GIT_HOME_NAME="Marko Tadic"
export GIT_HOME_EMAIL="tadija@me.com"

export GIT_WORK_NAME="Marko Tadic"
export GIT_WORK_EMAIL="marko.tadic@appculture.com"

# my helpers

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"

function setup-fzf() {
  $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
}

function setup-defaults() {
  echo "> setup defaults..."

  sd-cursor
  sd-xcsimfs
  sd-xcindx
  sd-fdpath
  sd-dsstore

  echo "> defaults are set!"
}

function sd-cursor {
  # disable cursor blinking globally
  cmd="defaults write -g NSTextInsertionPointBlinkPeriod -float 60000"
  eval $cmd
  echo "• $cmd"
}

function sd-xcsimfs {
  # enable simulator beside Xcode in full screen mode
  cmd="defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES"
  eval $cmd
  echo "• $cmd"
}

function sd-xcindx {
  # show number of remaining files when indexing a project in xcode
  cmd="defaults write com.apple.dtXcode IDEIndexerActivityShowNumericProgress -bool true"
  eval $cmd
  echo "• $cmd"
}

function sd-fdpath {
  # display full POSIX path as Finder window title
  cmd="defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"
  eval $cmd
  echo "• $cmd"
}

function sd-dsstore {
  # disable creating .DS_Store file on network volumes
  cmd="defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
  eval $cmd
  echo "• $cmd"
}
