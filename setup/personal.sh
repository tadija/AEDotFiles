# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

# me

export GIT_HOME_NAME="Marko Tadic"
export GIT_HOME_EMAIL="tadija@me.com"

export GIT_WORK_NAME="Marko Tadic"
export GIT_WORK_EMAIL="marko.tadic@appculture.com"

# my paths

dev=~/Developer
gh=$dev/GitHub
ac=$dev/appculture
as=$dev/AppStore
web=$dev/Web
lab=$dev/Lab
local=$dev:$gh:$ac:$as:$web:$lab

cldocs=~/Cloud/Documents
cldev=$cldocs/Developer
clgh=$cldev/GitHub
clac=$cldev/appculture
clas=$cldev/AppStore
cloud=$cldocs:$cldev:$clgh:$clac:$clas

export CDPATH=.:$local:$cloud

# my helpers

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"

function setup-defaults() {
  echo "> setup defaults..."

  alias defaults-cursor="defaults write -g NSTextInsertionPointBlinkPeriod -float 60000"
  echo "• disable cursor blinking globally"

  alias defaults-xcsimfs="defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES"
  echo "• enable simulator beside Xcode in full screen mode"

  alias defaults-xcindx="defaults write com.apple.dtXcode IDEIndexerActivityShowNumericProgress -bool true"
  echo "• show number of remaining files when indexing a project in xcode"

  alias defaults-fdpath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"
  echo "• display full POSIX path as Finder window title"

  alias defaults-dsstore="defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
  echo "• disable creating .DS_Store file on network volumes"

  echo "> defaults are set!"
}

function setup-fzf() {
  $(brew --prefix)/opt/fzf/install
}
