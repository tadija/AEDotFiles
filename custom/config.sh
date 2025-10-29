# https://github.com/tadija/AEDotFiles
# config.sh

# Default Path
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/snap/bin

# Default Editor
export EDITOR="nvim"
export PAGER="less"

# Git User
# plugins/git-user.sh

typeset -Ag git_user
git_user[my]="Marko Tadic;tadija@me.com"

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
  mise
  prompt
  random
  rbenv
  subl
  swift
  swiftenv
  vscode
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
  ast-grep # https://github.com/ast-grep/ast-grep
  bat # https://github.com/sharkdp/bat
  cloc # https://github.com/AlDanial/cloc
  fd # https://github.com/sharkdp/fd
  font-roboto-mono-nerd-font # https://www.nerdfonts.com
  fzf # https://github.com/junegunn/fzf
  gh # https://cli.github.com
  git # https://git-scm.com
  git-lfs # https://git-lfs.github.com
  git-flow # https://github.com/nvie/gitflow
  graphicsmagick # http://www.graphicsmagick.org
  heroku/brew/heroku # https://cli.heroku.com
  htop # https://htop.dev/
  hub # https://hub.github.com
  jq # https://stedolan.github.io/jq
  lazygit # https://github.com/jesseduffield/lazygit
  mas # https://github.com/mas-cli/mas
  mise # https://mise.jdx.dev
  mysql # https://dev.mysql.com
  npm # https://www.npmjs.com
  nvim # https://neovim.io
  ranger # https://github.com/ranger/ranger
  rbenv # https://github.com/rbenv/rbenv
  ripgrep # https://github.com/BurntSushi/ripgrep
  swiftly # https://github.com/swiftlang/swiftly
  speedtest-cli # https://github.com/sivel/speedtest-cli
  swiftformat # https://github.com/nicklockwood/SwiftFormat
  swiftgen # https://github.com/SwiftGen/SwiftGen
  swiftlint # https://github.com/realm/SwiftLint
  tig # https://github.com/jonas/tig
  tldr # https://tldr.sh
  tmux # http://tmux.github.io
  tree # http://oldmanprogrammer.net/source.php?dir=projects/tree
  vapor # https://vapor.codes
  wget # https://www.gnu.org/software/wget
  xcbeautify # https://github.com/cpisciotta/xcbeautify
  xcode-build-server # https://github.com/SolaWing/xcode-build-server
)

# Homebrew Apps
# /Applications

apps_installation_path="/Applications"

apps=(
  alfred
  appcleaner
  db-browser-for-sqlite
  docker
  fork
  macdown
  rapidapi
  red-eye
  sequel-ace
  sf-symbols
  sherlock
  simsim
  sketch
  sublime-text
  textmate
  visual-studio-code
  xcodes
  xscope
  zoom
  zed
)
