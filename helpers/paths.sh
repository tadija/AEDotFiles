# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://swiftenv.fuller.li
if test $(which swiftenv); then
  export PATH="$HOME/.swiftenv/bin:$PATH"
  eval "$(swiftenv init -)"
fi

# http://fastlane.tools
if test $(which ~/.fastlane/bin/fastlane); then
  export PATH="$HOME/.fastlane/bin:$PATH"
fi
