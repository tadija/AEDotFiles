#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

echo -e "\n# Hello $USER!\n"

# backup .bash_profile if it already exists
if [ -f ~/.bash_profile ]; then
mv ~/.bash_profile ~/.bash_profile.backup
echo -e "# Your current .bash_profile is copied to .bash_profile.backup"
fi

# configure and load new .bash_profile
cp ~/.dotfiles/profile/template.sh ~/.bash_profile
source ~/.bash_profile

# print stuff
echo -e "# This is how you new .bash_profile looks: \n"
cat ~/.bash_profile

echo -e "\n# You can now begin with the setup by running these commands:\n"
echo "setup-terminal"
echo "setup-homebrew"
echo "setup-binaries"
echo "setup-apps"
echo "setup-system"
echo "setup-custom"

echo -e "\n# https://github.com/tadija/AEDotFiles\n"
