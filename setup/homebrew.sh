# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

echo "[brew] checking..."

# install homebrew if needed
if test ! $(which brew); then
  echo "[brew] installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "[brew] updating..."

brew update
brew upgrade

brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

echo "[brew] cleanup..."

brew cleanup
