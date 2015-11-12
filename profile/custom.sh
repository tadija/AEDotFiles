###############################################################################
# tadija
###############################################################################

# shortcuts
alias ..="cd .."

alias dev="cd ~/Dropbox/Developer/"
alias devios="cd ~/Dropbox/Developer/iOS"
alias devgh="cd ~/Dropbox/Developer/GitHub"
alias devyc="cd ~/Dropbox/Developer/Youngculture/"
alias sy="cd ~/Dropbox/Sync/"

# ssh
alias addssh="cd ~/Dropbox/Sync/.ssh && chmod 400 id_rsa && ssh-add id_rsa"

# git general
alias gitwho="echo 'git user:' && git config user.name && git config user.email"
alias glp="git log --pretty=format:'%h %s' --graph"

# git work / home local
alias gwl="git config user.name 'Marko Tadic' && git config user.email 'm.tadic@youngculture.com' && git config user.name && git config user.email"
alias ghl="git config user.name 'Marko Tadic' && git config user.email 'tadija@me.com' && git config user.name && git config user.email"

# git work / home global
alias gwg="git config --global user.name 'Marko Tadic' && git config --global user.email 'm.tadic@youngculture.com' && git config --global user.name && git config --global user.email"
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
alias bcu="brew cask update"
