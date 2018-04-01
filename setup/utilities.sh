#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

source $DOT_FILES/settings.sh
source $DOT_FILES/scripts/homebrew.sh

echo ""
echo -e "Installing utilities... \n"

# install cask
brew tap caskroom/cask

# install binaries
brew install ${utilities[@]}

echo ""
echo -e "Homebrew cleanup... \n"

# cleanup
brew cleanup
