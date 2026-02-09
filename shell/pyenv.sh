# https://github.com/pyenv/pyenv
# pyenv.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi
