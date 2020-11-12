# https://github.com/tadija/AEDotFiles
# init.sh

if [ -n "$BASH_VERSION" ]; then
  # https://bash-completion.alioth.debian.org
  if [ -x "$(command -v brew)" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    fi
  fi

  # https://github.com/apple/swift-package-manager
  if [ -x "$(command -v swift)" ]; then
    eval "`swift package completion-tool generate-bash-script`"
  fi
fi

# https://github.com/sharkdp/bat
if [ -x "$(command -v bat)" ]; then
  alias cat="bat"
fi

# https://swiftenv.fuller.li
if [ -x "$(command -v swiftenv)" ]; then
  eval "$(swiftenv init -)"
fi

# https://github.com/rbenv/rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# https://hub.github.com
if [ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi

# http://fastlane.tools
if [ -x "$(command -v fastlane)" ]; then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

# https://github.com/clvv/fasd
if [ -x "$(command -v fasd)" ]; then
  export _FASD_BACKENDS="native spotlight current"
  eval "$(fasd --init auto)"
fi
