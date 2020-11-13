# https://github.com/tadija/AEDotFiles
# general.sh

alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && mas upgrade"
alias restore="tmux attach || { (while ! tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh; do sleep 0.2; done)& tmux ; }"

alias dfe="subl $df && fork $df"
alias dfu="cd $df && gitsy && cd -"

alias ..="cd .."
alias cdh="cd $HOME"
alias ls='ls -GFh'
alias ll="ls -lo"
alias la="ll -a"
alias grep="grep --color=auto"
alias rmd="rm -rf"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias o="open ."
alias help="tldr"
alias rng="ranger"

alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias slp="pmset sleepnow"
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias zap='brew rmtree'
