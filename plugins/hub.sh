# https://hub.github.com

if [ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi
