#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

echo ""
print "Hello $USER!"

shellFile=$(getShellFile)

backupFile "$HOME/$shellFile"
backupFile "$HOME/.gitconfig"
backupFile "$HOME/.lldbinit"
backupFile "$HOME/.tmux.conf"

df=$HOME/.dotfiles
ln -s $df/.shell_file $HOME/.shell_file
ln -s $df/.gitconfig $HOME/.gitconfig
ln -s $df/.lldbinit $HOME/.lldbinit
ln -s $df/.tmux.conf $HOME/.tmux.conf

mv $HOME/.shell_file $HOME/$shellFile

print "This is how your new $shellFile looks now:"
printFile $HOME/$shellFile

print "Loading $shellFile:"
source $HOME/$shellFile
echo "" && print "Finished loading $shellFile"

print "You can now continue the setup with these commands: \n\n\
• setup-terminal \n\
• setup-defaults \n\
• setup-homebrew \n\
• setup-installations"

print "https://github.com/tadija/AEDotFiles"

### - helpers

function print() {
  echo "> $1"
  echo ""
}

function printFile() {
  echo "- Displaying $1"
  dashes=----------------------------------------
  echo "<$dashes"
  cat $1
  echo "$dashes>"
  echo ""
}

function getShellFile() {
  if [ -n "$ZSH_VERSION" ]; then
    echo ".zshrc"
  elif [ -n "$BASH_VERSION" ]; then
    echo ".bash_profile"
  else
    print "This shell is not supported... ¯\_(ツ)_/¯"
    exit 1
  fi
}

function backupFile() {
  if [ -e $1 ]; then
    timestamp=$(date "+%Y%m%d-%H%M%S")
    backupFile=$1.backup.$timestamp
    mv "$1" "$backupFile"
    print "Moved existing $1 -> $backupFile"
  fi
}
