# https://github.com/nodenv/nodenv
# nodenv.sh

export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"

if [ -x "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi
