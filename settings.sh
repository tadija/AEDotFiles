#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

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
  git
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
