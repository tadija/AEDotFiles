# https://github.com/rbenv/rbenv
# rbenv.sh

function setup-rbenv() {
  # rbenv install --list
  rbenv install 2.7.2
  rbenv global 2.7.2
  rbenv rehash
}

if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi
