# https://github.com/tadija/AEDotFiles
# config.sh

# Default Path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Default Editor
export EDITOR="nano"

# Git User 
# plugins/git-user.sh

typeset -Ag git_user
git_user[home]="Marko Tadic;tadija@me.com"
git_user[work]="Marko Tadic;marko.tadic@appculture.com"

# Shell Plugins
# plugins/*.sh

## "system/init.sh" will source each file (included on this list) from "plugins" dir
## any file can be overriden by making a new file with the same name in "custom" dir
dfplugins=(
  my
  bat
  brew
  colors
  defaults
  fastlane
  fzf
  general
  git-user
  git
  hub
  prompt
  random
  rbenv
  subl
  swift
  swiftenv
  xcode
  zsh
)

# Quicklook Plugins
# ~/Library/QuickLook

qlplugins=(
  provisioning
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-json
)

# Command Line Tools
# /usr/local/Cellar

cli=(
  bat # https://github.com/sharkdp/bat
  carthage # https://github.com/Carthage/Carthage
  cloc # https://github.com/AlDanial/cloc
  fd # https://github.com/sharkdp/fd
  fzf # https://github.com/junegunn/fzf
  git # https://git-scm.com
  git-lfs # https://git-lfs.github.com
  git-flow # https://github.com/nvie/gitflow
  graphicsmagick # http://www.graphicsmagick.org
  heroku/brew/heroku # https://cli.heroku.com
  hub # https://hub.github.com
  jq # https://stedolan.github.io/jq
  mas # https://github.com/mas-cli/mas
  mysql # https://dev.mysql.com
  npm # https://www.npmjs.com
  ranger # https://github.com/ranger/ranger
  rbenv # https://github.com/rbenv/rbenv
  ripgrep # https://github.com/BurntSushi/ripgrep
  kylef/formulae/swiftenv # https://github.com/kylef/swiftenv
  speedtest-cli # https://github.com/sivel/speedtest-cli
  swiftlint # https://github.com/realm/SwiftLint
  tig # https://github.com/jonas/tig
  tldr # https://tldr.sh
  tmux # http://tmux.github.io
  tree # http://mama.indstate.edu/users/ice/tree
  vapor/tap/vapor # https://vapor.codes
)

# Homebrew Apps
# /Applications

apps_installation_path="/Applications"

apps=(
  alfred
  appcleaner
  calibre
  charles
  db-browser-for-sqlite
  firefox
  fork
  google-chrome
  macdown
  paw
  red-eye
  sequel-pro
  sf-symbols
  sherlock
  simsim
  sketch
  sublime-text
  teacode
  teamviewer
  visual-studio-code
  wwdc
  xscope
  zoom
)
