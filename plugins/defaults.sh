# https://github.com/tadija/AEDotFiles
# defaults.sh

function setup-defaults {
  echo "> setup defaults..."

  defaults-cursor
  defaults-xcsimfs
  defaults-xcindx
  defaults-fdpath
  defaults-dsstore

  echo "> defaults are set!"
}

function defaults-cursor {
  # disable cursor blinking globally
  cmd="defaults write -g NSTextInsertionPointBlinkPeriod -float 60000"
  eval $cmd
  echo "• $cmd"
}

function defaults-xcsimfs {
  # enable simulator beside Xcode in full screen mode
  cmd="defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES"
  eval $cmd
  echo "• $cmd"
}

function defaults-xcindx {
  # show number of remaining files when indexing a project in xcode
  cmd="defaults write com.apple.dtXcode IDEIndexerActivityShowNumericProgress -bool true"
  eval $cmd
  echo "• $cmd"
}

function defaults-fdpath {
  # display full POSIX path as Finder window title
  cmd="defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"
  eval $cmd
  echo "• $cmd"
}

function defaults-dsstore {
  # disable creating .DS_Store file on network volumes
  cmd="defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
  eval $cmd
  echo "• $cmd"
}
