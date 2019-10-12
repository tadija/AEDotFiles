#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
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

# backup .lldbinit if it already exists
if [ -f ~/.lldbinit ]; then
mv ~/.lldbinit ~/.lldbinit.backup
echo -e "> Your current .lldbinit is copied to .lldbinit.backup"
fi

# configure new .lldbinit
ln -s ~/.dotfiles/.lldbinit ~/.lldbinit

# backup .tmux.conf if it already exists
if [ -f ~/.tmux.conf ]; then
mv ~/.tmux.conf ~/.tmux.conf.backup
echo -e "> Your current .tmux.conf is copied to .tmux.conf.backup"
fi

# configure new .tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

echo -e "\n> This is how you new .bash_profile looks: \n"
echo "------------------------------------------------"
cat ~/.bash_profile
echo "------------------------------------------------"

echo -e "\n> You can now continue the setup by running these commands:\n"
echo "setup-terminal"
echo "setup-defaults"
echo "setup-homebrew"
echo "setup-installations"

echo -e "\n> https://github.com/tadija/AEDotFiles\n"
