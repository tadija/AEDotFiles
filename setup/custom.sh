#!/usr/bin/env bash

# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

###############################################################################
# Manual Configuration and Installations
###############################################################################

# iCloud
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud

### Xcode

## Symlink
# rm -rf ~/Library/Developer/Xcode/UserData/
# ln -s ~/iCloud/Documents/Sync/Xcode/UserData ~/Library/Developer/Xcode/UserData

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

### Sketch

## Symlink
# rm -rf ~/Library/Application\ Support/com.bohemiancoding.sketch3
# ln -s ~/iCloud/Documents/Sync/Sketch/com.bohemiancoding.sketch3 ~/Library/Application\ Support/com.bohemiancoding.sketch3

### Sublime

# package manager [https://packagecontrol.io/installation]
# "font_face": "Hack"
# install Tomorrow Night Italics Color Scheme
# material theme [https://github.com/equinusocio/material-theme]
# http://olivierlacan.com/posts/launch-sublime-text-3-from-the-command-line/

## Terminal
# Font: SF Mono Regular 14
# Window Size: 140 / 36

### System

## Configure SSH Keys
# cp -rf ~/iCloud/Documents/Sync/.ssh ~/.ssh
# chmod 400 (each private key)
# ssh-add -K (each private key)

### Safari

## General
# safari opens with all windows from last session
# turn off open safe files after downloading

## Advanced
# show full website address

## Extensions
# Close Left/Right Tabs [http://safariextensions.com/en-US/safari/addon/124]
# Refind [https://refind.com]

## Widgets
# Currency Converter Widget [https://www.apple.com/downloads/dashboard/calculate_convert/currencyconverter_palplesoftware.html]
# iStat Widget [http://mac.softpedia.com/get/Dashboard-Widgets/Status-Info/iStat-pro.shtml]
# echoes [http://www.echoes.gr] (open in dashboard)
