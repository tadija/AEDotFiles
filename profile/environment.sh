# bash completion
if test $(which brew); then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  fi
fi

# Swiftenv
if test $(which swiftenv); then
  export PATH="$HOME/.swiftenv/bin:$PATH"
  eval "$(swiftenv init -)"
fi

# fastlane
if test $(which swiftenv); then
  export PATH="$HOME/.fastlane/bin:$PATH"
fi