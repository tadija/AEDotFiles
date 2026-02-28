# https://github.com/sharkdp/bat
# bat.sh

if [ -x "$(command -v bat)" ]; then
  alias cat="bat"

  if [ -x "$(command -v fzf)" ]; then
    alias browse="fzf --preview 'bat --color \"always\" {}'"
  fi
fi
