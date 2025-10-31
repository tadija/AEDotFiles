# https://github.com/tadija/AEDotFiles
# zsh.sh

if [ -n "$ZSH_VERSION" ]; then
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

  autoload -Uz compinit && compinit
  autoload -U colors && colors

  # enable vi mode
  bindkey -v
  bindkey jj vi-cmd-mode

  # case-insensitive globbing
  setopt NO_CASE_GLOB

  # setup history file
  HISTFILE=~/.zsh_history
  HISTSIZE=10000
  SAVEHIST=10000
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

