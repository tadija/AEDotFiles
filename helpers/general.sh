# https://github.com/tadija/AEDotFiles
# general.sh

alias reload="source ~/.zshrc"
alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup && mas upgrade"
alias restore="tmux attach || { (while ! tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh; do sleep 0.2; done)& tmux ; }"

alias dfe="subl $df && fork $df"
alias dfu="cd $df && gitsy && cd -"

alias .="open ."
alias ..="cd .."
alias cdh="cd $HOME"
alias ls='ls -GFh'
alias ll="ls -lo"
alias la="ll -a"
alias grep="grep --color=auto"
alias rmd="rm -rf"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias help="tldr"
alias rng="ranger"

alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

alias off="pmset sleepnow"
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias zap='brew rmtree'

if [ -n "$ZSH_VERSION" ]; then
  # case-insensitive globbing
  setopt NO_CASE_GLOB
  # show timestamp and elapsed time of the command
  setopt EXTENDED_HISTORY
  # share history across multiple zsh sessions
  setopt SHARE_HISTORY
  # append to history
  setopt APPEND_HISTORY
  # adds commands as they are typed, not at shell exit
  setopt INC_APPEND_HISTORY
  # do not store duplications
  setopt HIST_IGNORE_DUPS
  # removes blank lines from history
  setopt HIST_REDUCE_BLANKS
  # disable zsh options
  unsetopt CORRECT
  unsetopt CORRECT_ALL
  unsetopt AUTO_CD
fi

if [ -n "$ZSH_VERSION" ]; then
  autoload -Uz compinit && compinit
  autoload -U colors && colors
fi
