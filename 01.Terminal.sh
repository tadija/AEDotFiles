#!/usr/bin/env bash

#
# AESetupOSX
#
# 01.Terminal.sh
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

source 00.Config.sh

###############################################################################
# Set default path and get current directory
###############################################################################

PATH=/usr/local/bin:$PATH
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

###############################################################################
# Set .bash_profile
###############################################################################

echo ""
echo "Symlink and load bash profile"

# backup .profile if already exists
if [ -f ~/.profile ]; then
  mv ~/.profile ~/.profile.backup
fi
# load new .profile
cp $DIR/.bash_profile ~/.profile
source ~/.profile

###############################################################################
# Set Terminal theme
###############################################################################

echo ""
echo "Get and set Piperita theme for Terminal"
echo ""

# create temp directory
cd $DIR && mkdir .tmp && cd .tmp
# get 'piperita' theme
git clone https://github.com/jacobtomlinson/terminal-piperita.git
# add it to terminal
open $DIR/.tmp/terminal-piperita/schemes/Terminal/Piperita.terminal
sleep 1
# set as default theme
defaults write com.apple.Terminal "Default Window Settings" -string "Piperita"
defaults write com.apple.Terminal "Startup Window Settings" -string "Piperita"
# remove temp directory
rm -rf $DIR/.tmp
# quit terminal
osascript -e 'tell application "Terminal" to quit' & exit
