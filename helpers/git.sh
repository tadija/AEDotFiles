# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

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

# git work / home local
alias gitwl="git config user.name 'Marko Tadic' && git config user.email 'marko.tadic@appculture.com' && git config user.name && git config user.email"
alias githl="git config user.name 'Marko Tadic' && git config user.email 'tadija@me.com' && git config user.name && git config user.email"

# git work / home global
alias gitwg="git config --global user.name 'Marko Tadic' && git config --global user.email 'marko.tadic@appculture.com' && git config --global user.name && git config --global user.email"
alias githg="git config --global user.name 'Marko Tadic' && git config --global user.email 'tadija@me.com' && git config --global user.name && git config --global user.email"
