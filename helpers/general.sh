# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

alias reload="source ~/.bash_profile"
alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && mas upgrade"

alias ..="cd .."
alias ls='ls -GFh'
alias ll="ls -lo"
alias la="ll -a"
alias rmd="rm -rf"
alias cat="bat"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias help="tldr"
alias rg="ranger"

alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias off="pmset sleepnow"
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias zap='brew rmtree'
