# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

echo ""
echo "Get and set Piperita theme for Terminal"
echo ""

# create temp directory
cd /tmp && mkdir piperita && cd piperita
# get 'piperita' theme
git clone https://github.com/jacobtomlinson/terminal-piperita.git
# add it to terminal
open /tmp/piperita/terminal-piperita/schemes/Terminal/Piperita.terminal
sleep 1
# set as default theme
defaults write com.apple.Terminal "Default Window Settings" -string "Piperita"
defaults write com.apple.Terminal "Startup Window Settings" -string "Piperita"
# remove temp directory
rm -rf /tmp/piperita
# quit terminal
osascript -e 'tell application "Terminal" to quit' & exit
