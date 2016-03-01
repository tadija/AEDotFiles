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

echo ""
echo "Updating system settings..."

###############################################################################
# Security & Privacy
###############################################################################

echo ""
echo "Requiring password 1 minute after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 60

###############################################################################
# Keyboard
###############################################################################

echo ""
echo "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Finder
###############################################################################

echo ""
echo "New Finder window show $HOME folder"
defaults write com.apple.finder NewWindowTarget -string "PfHm"

echo ""
echo "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo ""
echo "Allowing text selection in Quick Look/Preview in Finder by default"
# this does not work in El Capitan
defaults write com.apple.finder QLEnableTextSelection -bool true

echo ""
echo "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo ""
echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

###############################################################################
# Safari
###############################################################################

echo ""
echo "Disabling Safari thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo ""
echo "Enabling Safari debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Making Safari search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Messages
###############################################################################

echo ""
echo "Disable automatic emoji substitution (i.e. use plain text smileys)"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo ""
echo "Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# MANUAL SETTINGS
# these are my personal settings for which I didn't have time
# to automate with defaults but maybe one day I will... :)
# p.s. feel free to send a pull request if you automate some of those...
###############################################################################

red='\033[0;31m'
green='\033[0;32m'
default='\033[0m'

echo ""
echo -e "${red}REMINDER:"
echo -e "${red}Don't forget manual settings..."

### system preferences

## dock
# size and magnifications

## mission control
# dashboard as overlay

## language & region
# add serbian latin to preffered languages
# time format 24h

## security & privacy
# allow apps downloaded from anywhere
# advanced / disable remote control infrared receiver

## keyboard
# use F keys as standard function keys
# add serbian latin input source
# turn on previous input source keyboard shortcut to ctrl+space
# add shortcut for service / new terminal at folder cmd+alt+b

## mouse
# secondary click
# swipe between pages

## trackpad
# tap to click

## sound
# show volume in menu bar

## icloud

## internet accounts

## extensions
# share menu / pocket

## users & groups
# login options / show fast user switching menu as Account Name

## date & time
# display time with seconds

## accessibility
# zoom / use scroll gesture with modifier keys to zoom ctrl

### finder

## general
# turn off open folders in tabs

## sidebar
# airdrop, all my files, applications, icloud drive, dropbox, tadija, desktop, documents, downloads, movies, music, pictures

## advanced
# when performing a search search the current folder

## view options
# calculate all sizes / use as defaults

### safari

## general
# safari opens with all windows from last session
# turn off open safe files after downloading

## advanced
# show full website address

### xcode

## accounts
# setup accounts, profiles and certificates

## behaviors
# running starts / show debug navigator && debugger with console view
# running completes / show project navigator && hide debugger

## text editing
# line numbers
# code folding ribbon
# page guide at column: 120

###############################################################################
# The End
###############################################################################

echo ""
echo -e "${green}Done!"
echo ""
