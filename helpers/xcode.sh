# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

alias xcopen="xcfile() { local workspace=$(find *.xcworkspace 2>/dev/null | head -1); local project=$(find *.xcodeproj 2>/dev/null | head -1); \${workspace:-\${project}} ; }; open -a Xcode \"${xcfile}\""
alias codesigndoc="bash -l -c '$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap.sh)'"
alias alphacheck="sips -g all"
alias alphadisable="mogrify -alpha off"
alias fl="fastlane"
