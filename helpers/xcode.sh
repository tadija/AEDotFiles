# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

alias xcopen="xcfile() { local workspace=$(find *.xcworkspace 2>/dev/null | head -1); local project=$(find *.xcodeproj 2>/dev/null | head -1); \${workspace:-\${project}} ; }; open -a Xcode \"${xcfile}\""
alias xcwhich="xcode-select --print-path"
alias cartupdate="carthage update --platform iOS --no-use-binaries"
alias codesigndoc="bash -l -c '$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap.sh)'"
alias fl="bundle exec fastlane"
alias alphacheck="sips -g all"
alias alphadisable="mogrify -alpha off"

# usage: $ simrec recording.mp4
simrec() {
  xcrun simctl io booted recordVideo "$1"
}
# usage: $ simurl http://apple.com
simurl() {
  xcrun simctl openurl booted "$1"
}
# usage: $ xcswitch /Applications/Xcode-beta.app
xcswitch() {
  sudo xcode-select --switch "$1"
}
