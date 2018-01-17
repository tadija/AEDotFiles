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
  ack
  bash-completion
  carthage
  cloc
  cocoapods
  imagemagick
  graphicsmagick
  heroku
  hub
  mas # required for installing app store apps
  mysql
  kylef/formulae/swiftenv
  trash
  tree
  vapor/tap/vapor
)

###############################################################################
# App Store Apps to install
###############################################################################

appIDs=(
  412448059 # forklift
  430255202 # mactracker
  441258766 # magnet
  1179623856 # pastebot
  803453959 # slack
  747648890 # telegram
  497799835 # xcode
)

###############################################################################
# Apps to install (outside App Store)
###############################################################################

apps=(
  apptivate
  appzapper
  atom
  calibre
  charles
  fastlane
  firefox
  flash-player
  google-chrome
  java
  macdown
  opensim
  paw
  recordit
  reflector
  sequel-pro
  sip
  sketch
  skype
  sourcetree
  db-browser-for-sqlite
  sublime-text
  torbrowser
  transmission
  vlc
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
