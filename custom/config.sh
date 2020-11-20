# https://github.com/tadija/AEDotFiles
# config.sh

# Git User

typeset -Ag git_user
git_user[home]="Marko Tadic;tadija@me.com"
git_user[work]="Marko Tadic;marko.tadic@appculture.com"

# AEDotFiles Plugins

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

qlplugins=(
  provisioning
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-json
)

# Command Line Tools

cli=(
  bat # https://github.com/sharkdp/bat
  carthage # https://github.com/Carthage/Carthage
  cloc # https://github.com/AlDanial/cloc
  fd # https://github.com/sharkdp/fd
  fzf # https://github.com/junegunn/fzf
  git # https://git-scm.com
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
  sherlock
  simsim
  sip
  sketch
  skype
  sublime-text
  teacode
  visual-studio-code
  wwdc
  xscope
)

apps_installation_path="/Applications"
