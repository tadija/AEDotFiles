#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

echo -e "\n> Hello $USER!\n"

# backup .gitconfig if it already exists
if [ -f ~/.gitconfig ]; then
mv ~/.gitconfig ~/.gitconfig.backup
echo -e "> Your current .gitconfig is copied to .gitconfig.backup"
fi

# configure new .gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# backup .bash_profile if it already exists
if [ -f ~/.bash_profile ]; then
mv ~/.bash_profile ~/.bash_profile.backup
echo -e "> Your current .bash_profile is copied to .bash_profile.backup"
fi

# configure and load new .bash_profile
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
source ~/.bash_profile

echo -e "\n> This is how you new .bash_profile looks: \n"
echo "------------------------------------------------"
cat ~/.bash_profile
echo "------------------------------------------------"

echo -e "\n> You can now begin with the setup by running these commands:\n"
echo "setup-terminal"
echo "setup-homebrew"
echo "setup-installations"
echo "setup-defaults"

echo -e "\n> https://github.com/tadija/AEDotFiles\n"
