#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

echo "Checking Homebrew..."

# install homebrew (if it's not already installed)
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew..."

# update
brew update
brew upgrade

# tap versions and fonts
brew tap caskroom/versions
brew tap caskroom/fonts

echo "Homebrew cleanup..."

# cleanup
brew cleanup
