# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://bash-completion.alioth.debian.org
if test $(which brew); then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  fi
fi

# https://swiftenv.fuller.li
if test $(which swiftenv); then
  export PATH="$HOME/.swiftenv/bin:$PATH"
  eval "$(swiftenv init -)"
fi

# http://fastlane.tools
if test $(which fastlane); then
  export PATH="$HOME/.fastlane/bin:$PATH"
fi

# https://hub.github.com
eval "$(hub alias -s)"
