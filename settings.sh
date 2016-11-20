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

echo -e "Getting settings...\n"

###############################################################################
# General
###############################################################################

# path where brew-cask will install apps
app_directory_path="/Applications"

###############################################################################
# Utilities to install
###############################################################################

utilities=(
  # brew-cask is required for installing apps later
  ack
  bash-completion
  caskroom/cask/brew-cask
  carthage
  cocoapods
  graphicsmagick
  heroku
  hub
  mas
  mysql
  kylef/formulae/swiftenv
  trash
  tree
)

###############################################################################
# Apps to install
###############################################################################

apps=(
  appzapper
  calibre
  charles
  dropbox
  flash-player
  google-drive
  java
  kodi
  macdown
  paw
  recordit
  sequel-pro
  simpholders
  sketch
  sketch-toolbox
  skype
  sourcetree
  sqlitebrowser
  sublime-text
  torbrowser
  transmission
  tunnelbear
  vlc
  vox
  wwdc
  xscope
)

###############################################################################
# Quicklook plugins to install
###############################################################################

quicklook=(
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-json
  provisioning
)

###############################################################################
# Fonts to install
###############################################################################

fonts=(
  font-hack
  font-play
)
