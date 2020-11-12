# https://github.com/tadija/AEDotFiles
# init.sh

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
