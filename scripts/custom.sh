#!/usr/bin/env bash

#
# AEDotFiles
#
# Copyright (c) 2015 Marko Tadić <tadija@me.com> http://tadija.net
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

###############################################################################
# Configure .gitconfig
###############################################################################

echo ""
echo "Copy and set .gitconfig"
if [ -f ~/.gitconfig ]; then
mv ~/.gitconfig ~/.gitconfig.backup
fi
cp $DOT_FILES/config/.gitconfig ~/.gitconfig
gitwho

###############################################################################
# Install Vapor
###############################################################################

echo ""
echo "Installing Vapor..."
curl -sL toolbox.vapor.sh | bash

###############################################################################
# End
###############################################################################

cd ~

red='\033[0;31m'
green='\033[0;32m'
default='\033[0m'

echo ""
echo -e "${red}REMINDER:"
echo -e "${red}Don't forget manual settings..."

echo ""
echo -e "${green}Done!"
echo ""

###############################################################################
# Manual Configuration and Installations
###############################################################################

### Xcode

## Symlink
# rm -rf ~/Library/Developer/Xcode/UserData/
# ln -s ~/Dropbox/Sync/Xcode/UserData ~/Library/Developer/Xcode/UserData

## Accounts
# setup accounts, profiles and certificates

## Behaviors
# running starts / show debug navigator && debugger with console view
# running completes / show project navigator && hide debugger

## Fonts & colors
# Tomorrow Night Eighties [https://github.com/chriskempson/tomorrow-theme]
# SF Mono 14

## Text editing
# line numbers
# code folding ribbon
# page guide at column: 120

### Sublime

# package manager [https://packagecontrol.io/installation]
# font SF Mono 14
# material theme [https://github.com/equinusocio/material-theme]

## Terminal
# Font SF Mono 12

### System

## Configure SSH Keys

## Symlinks
# sudo rm -rf Movies
# ln -s /Volumes/aemac.hdd/Movies Movies
# sudo rm -rf Music
# ln -s /Volumes/aemac.hdd/Music Music
# sudo rm -rf Pictures
# ln -s /Volumes/aemac.hdd/Pictures Pictures

### Safari

## General
# safari opens with all windows from last session
# turn off open safe files after downloading

## Advanced
# show full website address

## Extensions
# HoverSee [http://www.macupdate.com/app/mac/34951/hoversee-safari-extension]
# Close Left/Right Tabs [http://safariextensions.com/en-US/safari/addon/124]
# Refind [https://refind.com]

## Widgets
# Currency Converter Widget [https://www.apple.com/downloads/dashboard/calculate_convert/currencyconverter_palplesoftware.html]
# iStat Widget [http://mac.softpedia.com/get/Dashboard-Widgets/Status-Info/iStat-pro.shtml]
