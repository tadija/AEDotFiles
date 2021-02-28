# https://github.com/tadija/AEDotFiles
# general.sh

alias update="brew update && brew upgrade && brew cleanup && mas upgrade"
alias restore='pgrep -vxq tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'

alias ..="cd .."
alias cdh="cd $HOME"
alias ls='ls -GFh'
alias ll="ls -lo"
alias la="ll -a"
alias grep="grep --color=auto"
alias o="open ."
alias rmd="rm -rf"

alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias off="pmset sleepnow"
