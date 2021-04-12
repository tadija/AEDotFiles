# https://swiftenv.fuller.li
# swiftenv.sh

export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"

if [ -x "$(command -v swiftenv)" ]; then
  eval "$(swiftenv init -)"
fi
