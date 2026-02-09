# https://hub.github.com
# hub.sh

if [ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi
