# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

echo ""
echo "Configuring AE theme..."
echo ""

open ~/.dotfiles/setup/AE.terminal
sleep 1
defaults write com.apple.Terminal "Default Window Settings" -string "AE"
defaults write com.apple.Terminal "Startup Window Settings" -string "AE"
osascript -e 'tell application "Terminal" to quit' & exit
