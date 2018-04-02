# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

alias reload="source ~/.bash_profile"
alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && mas upgrade"

alias ..="cd .."
alias ls='ls -GFh'
alias ll="ls -ll"
alias la="ll -a"
alias rmd="rm -rf"

alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias off="pmset sleepnow"
