# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

###############################################################################
# general
###############################################################################

# dotfiles setup
alias setup-terminal=". $DOT_FILES/setup/terminal.sh"
alias setup-homebrew=". $DOT_FILES/setup/homebrew.sh"
alias setup-installations=". $DOT_FILES/setup/installations.sh"
alias setup-defaults=". $DOT_FILES/setup/defaults.sh"

# shortcuts
alias ..="cd .."
alias rmd="rm -rf"
alias reload="source ~/.bash_profile"
function cdl { cd $1; ls; }

# git general
alias gitwho="echo 'Git user:' && git config user.name && git config user.email"
alias gitopen="open -a SourceTree ."
alias gitlog="git log --pretty=format:'%h %s' --graph"
alias gitundo="git reset --soft HEAD^"
alias gitrh="get reset --hard"
alias gitsubmodulesupdate="git submodule update --init --recursive"
alias gitsubmodulespull="git submodule foreach git pull origin master"
alias gitlocalizablestrings="echo \"*.strings diff=localizablestrings\" > .gitattributes"
alias gitstate="git remote update && git status -uno"
alias gitcleanup="git reflog expire --all --expire=now && git gc --prune=now --aggressive"
alias gitss="gitStashWithTimestamp"
alias gitsa="git stash apply"
alias gitssa="gitss && gitsa"

gitStashWithTimestamp() {
  ts=$(date "+%Y%m%d-%H%M%S")
  git stash save $ts
}

# show / hide hidden files in finder
alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

# icloud
alias icloudlog="brctl log --wait --shorten"
alias icloudoff="sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on && /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off"
alias icloudon="sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall off && /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on"

# random
alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"
alias checkperm="stat -f '%OLp'"
alias sketchdebug="tail -f /var/log/system.log|grep Sketch"
alias codesigndoc="bash -l -c '$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap.sh)'"
alias off="pmset sleepnow"
alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && mas upgrade"
alias xcopen="xcfile() { local workspace=$(find *.xcworkspace 2>/dev/null | head -1); local project=$(find *.xcodeproj 2>/dev/null | head -1); \${workspace:-\${project}} ; }; open -a Xcode \"${xcfile}\""
alias alphacheck="sips -g all"
alias alphadisable="mogrify -alpha off"

# homebrew
alias bcs="brew cask search"
alias bci="brew cask install"
alias bcu="brew cask uninstall"
alias bcz="brew cask zap"
alias bcd="brew cask doctor"
alias bcc="brew cask cleanup"
alias bcl="brew cask list"

# swift
alias sb="swift build"
alias st="swift test"
alias spi="swift package init"
alias spu="swift package update"
alias spx="swift package generate-xcodeproj"

###############################################################################
# custom (tadija)
###############################################################################

# directory navigation shortcuts
icldocs=~/iCloud/Documents
icldev=$icldocs/Developer
iclgh=$icldev/GitHub
CDPATH=.:$icldocs:$icldev:$icldev/appculture:$icldev/AppStore:$iclgh:$iclgh/\#minimal:$iclgh/\#research:$icldev/Lab

# git work / home local
alias gitwl="git config user.name 'Marko Tadic' && git config user.email 'marko.tadic@appculture.com' && git config user.name && git config user.email"
alias githl="git config user.name 'Marko Tadic' && git config user.email 'tadija@me.com' && git config user.name && git config user.email"

# git work / home global
alias gitwg="git config --global user.name 'Marko Tadic' && git config --global user.email 'marko.tadic@appculture.com' && git config --global user.name && git config --global user.email"
alias githg="git config --global user.name 'Marko Tadic' && git config --global user.email 'tadija@me.com' && git config --global user.name && git config --global user.email"
