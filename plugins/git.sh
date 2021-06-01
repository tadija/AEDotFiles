# https://github.com/tadija/AEDotFiles
# git.sh

alias gits="git status"
alias gitstate="git remote update && git status -uno"
alias gitlog="git log --pretty=format:'%h %s' --graph"
alias gitsmupdate="git submodule update --init --recursive"
alias gitsmpull="git submodule foreach git pull origin master"
alias gitcm="git add . && git commit --allow-empty-message -m ''"
alias gitam="git add . && git commit --amend --no-edit --allow-empty-message"
alias gitamd="git commit --amend --date=now"
alias gitcmui="git add . && git gui citool"
alias gitamui="git add . && git gui citool --amend"
alias gitss="gitStashWithTimestamp"
alias gitsa="git stash apply"
alias gitssa="gitss && gitsa"
alias gitsc="git stash clear"
alias gitundo="git reset --soft HEAD^"
alias gitrh="git reset --hard"
alias gitlocstr="echo \"*.strings diff=localizablestrings\" > .gitattributes"
alias gitcleanup="git reflog expire --all --expire=now && git gc --prune=now --aggressive"
alias gitdt="git difftool -y"
alias gitmt="git mergetool -y"
alias gitpf="git push --force"
alias gitsy="gitss && git pull && gitsa"
alias gitsyf="gitss && gitundo && gitrh && git pull && gitsa"

gitStashWithTimestamp() {
  ts=$(date "+%Y%m%d-%H%M%S")
  git stash save $ts
}

alias gf="git-flow"
alias gfi="gf init"
alias gff="gf feature"
alias gfr="gf release"
alias gfh="gf hotfix"
