# https://github.com/tadija/.dotfiles
# zsh.sh

function zsh-init() {
  autoload -Uz compinit && compinit -C
  autoload -U colors && colors
}

function zsh-options() {
  # case-insensitive globbing
  setopt NO_CASE_GLOB
  # disable zsh options
  unsetopt CORRECT
  unsetopt CORRECT_ALL
  unsetopt AUTO_CD
}

function zsh-history() {
  # setup history file
  HISTFILE=~/.zsh_history
  HISTSIZE=1000000
  SAVEHIST=1000000
  # show timestamp and elapsed time of the command
  setopt EXTENDED_HISTORY
  # append to history
  setopt APPEND_HISTORY
  # share history across multiple zsh sessions
  setopt SHARE_HISTORY
  # adds commands as they are typed, not at shell exit
  setopt INC_APPEND_HISTORY
  # do not store duplications
  setopt HIST_IGNORE_DUPS
  # removes blank lines from history
  setopt HIST_REDUCE_BLANKS
}

function zsh-bindkeys() {
  # enable vi mode
  bindkey -v
  bindkey jj vi-cmd-mode
  bindkey -M vicmd "/" vi-history-search-forward
  bindkey -M vicmd "?" vi-history-search-backward
}

function source-if-present() {
  if [ -f "$1" ]; then
    source "$1"
  fi
}

function zsh-setup() {
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  local base_paths=(
    "${HOMEBREW_PREFIX}/share"
    "/opt/homebrew/share"
    "/usr/local/share"
    "/usr/share"
  )
  local base_path
  for base_path in "${base_paths[@]}"; do
    source-if-present "$base_path/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source-if-present "$base_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  done
}

if [ -n "$ZSH_VERSION" ]; then
  zsh-init
  zsh-options
  zsh-history
  zsh-bindkeys
  zsh-setup
fi

