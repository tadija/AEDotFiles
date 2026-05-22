# https://github.com/tadija/.dotfiles
# macos.sh

# base
source $df/profiles/base.sh

# dot files
dot_files+=(
  config/hammerspoon:.hammerspoon
  config/karabiner:.config/karabiner
  config/linearmouse:.config/linearmouse
)

# shell plugins
shell_plugins+=(
  orbstack # https://orbstack.dev
  xcode # https://developer.apple.com/xcode
)

# command line tools
cli_tools+=(
  mas # https://github.com/mas-cli/mas
  swiftgen # https://github.com/SwiftGen/SwiftGen
  xcbeautify # https://github.com/cpisciotta/xcbeautify
  xcode-build-server # https://github.com/SolaWing/xcode-build-server
  xcp # https://github.com/wojciech-kulik/XcodeProjectCLI
)

# apps
apps_path="/Applications"
apps+=(
  alfred # https://www.alfredapp.com
  appcleaner # https://freemacsoft.net/appcleaner
  arc # https://arc.net
  claude # https://claude.ai
  commander # https://commanderai.app
  db-browser-for-sqlite # https://sqlitebrowser.org
  docker # https://www.docker.com/products/docker-desktop
  fork # https://git-fork.com
  ghostty # https://ghostty.org
  google-drive # https://www.google.com/drive
  hammerspoon # https://www.hammerspoon.org
  karabiner-elements # https://karabiner-elements.pqrs.org
  linearmouse # https://linearmouse.org
  macdown # https://macdown.uranusjr.com
  notepadexe # https://notepadexe.com
  openvpn-connect # https://openvpn.net/client
  rapidapi # https://rapidapi.com
  raycast # https://www.raycast.com
  sequel-ace # https://sequel-ace.com
  sf-symbols # https://developer.apple.com/sf-symbols
  simsim # https://github.com/dsmelov/simsim
  sketch # https://www.sketch.com
  sublime-text # https://www.sublimetext.com
  tailscale-app # https://tailscale.com
  textmate # https://macromates.com
  visual-studio-code # https://code.visualstudio.com
  xcodes # https://github.com/RobotsAndPencils/XcodesApp
  xscope # https://xscopeapp.com
  zoom # https://zoom.us
  zed # https://zed.dev
)
# add only for Apple M-series (ARM) processors
if [[ "$(uname -m)" == "arm64" ]]; then
  apps+=(codex-app) # https://developers.openai.com/codex/app
  apps+=(vibetunnel) # https://vibetunnel.sh
fi
