# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

echo "[brew] checking..."

# install homebrew if needed
if ! [ -x "$(command -v brew)" ]; then
  echo "[brew] installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "[brew] updating..."

brew update
brew upgrade

echo "[brew] cleanup..."

brew cleanup
