# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

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
# Xcode
###############################################################################

echo ""
echo "Enabling simulator beside Xcode in full screen mode"
defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES

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
# add shortcut for service / new terminal at folder cmd+alt+§

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

###############################################################################
# The End
###############################################################################

echo ""
echo -e "${green}Done!"
echo ""
