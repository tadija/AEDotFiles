#!/usr/bin/env bash

#
# AESetupOSX
#
# 06.Custom.sh
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

source ~/.profile

###############################################################################
# Configure SSH key
###############################################################################

echo ""
echo "Add SSH key"
ssh-add ~/Dropbox/Sync/.ssh/id_rsa

###############################################################################
# Configure .profile
###############################################################################

echo ""
echo "Sync .profile"
# backup remote .profile if already exists
if [ -f ~/Dropbox/Sync/.profile ]; then
  mv ~/Dropbox/Sync/.profile ~/Dropbox/Sync/.profile.backup
fi
# copy local to remote
cp ~/.profile ~/Dropbox/Sync/.profile
# backup local .profile if already exists
if [ -f ~/.profile ]; then
  mv ~/.profile ~/.profile.backup
fi
# symlink remote .profile
ln -s ~/Dropbox/Sync/.profile ~/.profile
source ~/.profile

###############################################################################
# Configure .gitconfig
###############################################################################

echo ""
echo "Copy and set .gitconfig"
cp ~/Dropbox/Sync/.gitconfig ~/.gitconfig
ghg

###############################################################################
# Configure Xcode
###############################################################################

echo ""
echo "Symlink Xcode Snippets"
# symlink CodeSnippets
rm -rf ~/Library/Developer/Xcode/UserData/CodeSnippets
ln -s ~/Dropbox/Sync/CodeSnippets ~/Library/Developer/Xcode/UserData

echo ""
echo "Installing Alcatraz..."
# install alcatraz (package manager)
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

###############################################################################
# Manual installation of packages from Alcatraz
###############################################################################

red='\033[0;31m'
green='\033[0;32m'
default='\033[0m'

echo ""
echo "${red}REMINDER:"
echo "${red}Don't forget manual settings..."

# Install packages:
# DerivedData Exterminator
# MCLog
# Open With Application
# SCXcodeMinimap
# Tomorrow & Tomorrow Night themes

###############################################################################

echo ""
echo "${green}Done!"
echo ""

###############################################################################
# Other Manual Configuration and Installations
###############################################################################

## Set Hack 14 Font in:
# Terminal
# Sublime
# Xcode

## Widgets
# Currency Converter Widget [https://www.apple.com/downloads/dashboard/calculate_convert/currencyconverter_palplesoftware.html]
# iStat Widget [http://mac.softpedia.com/get/Dashboard-Widgets/Status-Info/iStat-pro.shtml]

## Safari extensions
# HoverSee (http://www.macupdate.com/app/mac/34951/hoversee-safari-extension)
# Close Left/Right Tabs (http://safariextensions.com/en-US/safari/addon/124)

# Sublime package manager (https://packagecontrol.io/installation)