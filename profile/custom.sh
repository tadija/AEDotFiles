###############################################################################
# tadija
###############################################################################

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# shortcuts
alias ..="cd .."
alias rmd="rm -rf"

alias dbd="cd ~/Dropbox/Developer/"
alias dbdios="cd ~/Dropbox/Developer/iOS"
alias dbdgh="cd ~/Dropbox/Developer/GitHub"
alias dbdac="cd ~/Dropbox/Developer/appculture/"
alias dbdweb="cd ~/Dropbox/Developer/Web/"
alias dbsy="cd ~/Dropbox/Sync/"

# git general
alias gitwho="echo 'Git user:' && git config user.name && git config user.email"
alias glp="git log --pretty=format:'%h %s' --graph"
alias gitundo="git reset --soft HEAD^"
alias gitsubmodulesupdate="git submodule update --init --recursive"
alias gitsubmodulespull="git submodule foreach git pull origin master"
alias gitlocalizablestrings="echo \"*.strings diff=localizablestrings\" > .gitattributes"

# git work / home local
alias gwl="git config user.name 'Marko Tadic' && git config user.email 'marko.tadic@appculture.com' && git config user.name && git config user.email"
alias ghl="git config user.name 'Marko Tadic' && git config user.email 'tadija@me.com' && git config user.name && git config user.email"

# git work / home global
alias gwg="git config --global user.name 'Marko Tadic' && git config --global user.email 'marko.tadic@appculture.com' && git config --global user.name && git config --global user.email"
alias ghg="git config --global user.name 'Marko Tadic' && git config --global user.email 'tadija@me.com' && git config --global user.name && git config --global user.email"

# show / hide hidden files in finder
alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

# random
alias checkperm="stat -f '%OLp'"
alias logicl="brctl log --wait --shorten"

#homebrew
alias bcs="brew cask search"
alias bci="brew cask install"
alias bcu="brew cask uninstall"
alias bcz="brew cask zap"
alias bcd="brew cask doctor"
alias bcc="brew cask cleanup"
alias bcl="brew cask list"
