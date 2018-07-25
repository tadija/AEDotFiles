# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://swiftenv.fuller.li
if test $(which swiftenv); then
  eval "$(swiftenv init -)"
fi

# https://github.com/rbenv/rbenv
if test $(which rbenv); then
  eval "$(rbenv init -)"
fi

# http://fastlane.tools
if test $(which fastlane); then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi
