# https://github.com/tadija/AEDotFiles
# zsh.sh

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
