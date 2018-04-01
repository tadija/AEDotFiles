#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

source $DOT_FILES/settings.sh
source $DOT_FILES/scripts/homebrew.sh

echo ""
echo "Installing apps outside App Store..."
brew cask install --appdir=$app_directory_path ${apps[@]}

echo ""
echo "Installing quicklook plugins..."
brew cask install ${quicklook[@]}

echo ""
echo "Installing fonts..."
brew cask install ${fonts[@]}

echo ""
echo -e "Homebrew cleanup...\n"

# cleanup
brew cleanup

echo ""
echo "Installing apps from App Store..."
mas install ${appIDs[*]}

sudo xcodebuild -license accept
