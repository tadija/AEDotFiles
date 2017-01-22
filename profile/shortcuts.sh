###############################################################################
# general
###############################################################################

# dotfiles setup
alias setup-terminal=". $DOT_FILES/scripts/terminal.sh"
alias setup-homebrew=". $DOT_FILES/scripts/homebrew.sh"
alias setup-utilities=". $DOT_FILES/scripts/utilities.sh"
alias setup-apps=". $DOT_FILES/scripts/apps.sh"
alias setup-system=". $DOT_FILES/scripts/system.sh"
alias setup-custom=". $DOT_FILES/scripts/custom.sh"

# shortcuts
alias home="cd ~"
alias ..="cd .."
alias rmd="rm -rf"

# git general
alias gitwho="echo 'Git user:' && git config user.name && git config user.email"
alias glp="git log --pretty=format:'%h %s' --graph"
alias gitundo="git reset --soft HEAD^"
alias gitsubmodulesupdate="git submodule update --init --recursive"
alias gitsubmodulespull="git submodule foreach git pull origin master"
alias gitlocalizablestrings="echo \"*.strings diff=localizablestrings\" > .gitattributes"
alias gitstash="git stash && git stash apply"
alias gitopen="open -a SourceTree ."

# show / hide hidden files in finder
alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

# random
alias checkperm="stat -f '%OLp'"
alias logicl="brctl log --wait --shorten"
alias sketchdebug="tail -f /var/log/system.log|grep Sketch"

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

# shortcuts
alias dbd="cd ~/Dropbox/Developer/"
alias dbdios="cd ~/Dropbox/Developer/iOS"
alias dbdgh="cd ~/Dropbox/Developer/GitHub"
alias dbdac="cd ~/Dropbox/Developer/appculture/"
alias dbdweb="cd ~/Dropbox/Developer/Web/"
alias dbsy="cd ~/Dropbox/Sync/"

# git work / home local
alias gwl="git config user.name 'Marko Tadic' && git config user.email 'marko.tadic@appculture.com' && git config user.name && git config user.email"
alias ghl="git config user.name 'Marko Tadic' && git config user.email 'tadija@me.com' && git config user.name && git config user.email"

# git work / home global
alias gwg="git config --global user.name 'Marko Tadic' && git config --global user.email 'marko.tadic@appculture.com' && git config --global user.name && git config --global user.email"
alias ghg="git config --global user.name 'Marko Tadic' && git config --global user.email 'tadija@me.com' && git config --global user.name && git config --global user.email"
