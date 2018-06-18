# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://github.com/xcenv/xcenv
if test $(which xcenv); then
  eval "$(xcenv init -)"
fi

# https://swiftenv.fuller.li
if test $(which swiftenv); then
  eval "$(swiftenv init -)"
fi

# https://github.com/rbenv/rbenv
if test $(which rbenv); then
  eval "$(rbenv init -)"
fi

# http://fastlane.tools
if test $(which ~/.fastlane/bin/fastlane); then
  export PATH="$HOME/.fastlane/bin:$PATH"
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi
