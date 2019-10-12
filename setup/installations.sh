# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

source $df/setup/config.sh
source $df/setup/homebrew.sh

echo ""
echo "[brew] installing command line tools..."
brew install ${cli[@]}

echo ""
echo "[brew] installing apps..."
brew cask install --appdir=$apps_installation_path ${apps[@]}

echo ""
echo "[brew] installing quicklook plugins..."
brew cask install ${qlplugins[@]}

echo ""
echo "[brew] installing fonts..."
brew cask install ${fonts[@]}

echo ""
echo -e "[brew] cleanup...\n"

brew cleanup

echo ""
echo "[mas] installing App Store apps..."
mas install ${appIDs[*]}
