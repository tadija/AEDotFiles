# https://github.com/tadija/.dotfiles
# general.sh

alias ..="cd .."
alias checkperm="stat -f '%OLp'"
alias grep="grep --color=auto"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"
alias hme='htop -u "$USER"'
alias ht="htop -t"
alias icloudlog="brctl log --wait --shorten"
alias la="ls -la"
alias lc="eza -lah --no-permissions"
alias ll="eza -lah --group-directories-first --icons"
alias lm="eza -l --sort=modified --reverse"
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias lsd="eza -D --group-directories-first --icons"
alias lt="eza -T --git --icons --level=3"
alias lz="eza -l --total-size --sort=size --reverse"
alias nv="nvim"
alias o="open ."
alias off="pmset sleepnow"
alias paths="echo $PATH | sed 's/:/\n/g' | sort | uniq -c"
alias png2jpg="fd -e png -x convert {} {.}.jpg"
alias restore='pgrep -vxq tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'
alias rmd="rm -rf"
alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias sketchdebug="tail -f /var/log/system.log|grep Sketch"
alias ssh-reload="cd ~/.ssh && fd -e pub -x ssh-add --apple-use-keychain {.} && cd -"
alias update="brew update && brew upgrade && echo '==> Homebrew Cleanup...' && brew cleanup && echo '==> Updating AppStore...' && mas upgrade"

add-ssh() {
  local key_filename="$1"

  if [ -z "$key_filename" ]; then
    echo "usage: add-ssh <key-filename>" >&2
    return 1
  fi

  eval "$(ssh-agent)" && ssh-add "$HOME/.ssh/$key_filename"
}

ql() {
  local input_path="${1:-.}"

  if [[ -d "$input_path" ]]; then
    if [ -x "$(command -v eza)" ]; then
      lc -- "$input_path"
    else
      ls -lah -- "$input_path"
    fi
    return $?
  fi

  if [[ -f "$input_path" ]]; then
    if [ -x "$(command -v bat)" ]; then
      bat --paging=never --style=full -- "$input_path"
    else
      cat -- "$input_path"
    fi
    return $?
  fi

  echo "ql: no such file or directory: $path" >&2
  return 1
}

gt() {
  local dir
  dir="$(eza -D | fzf --preview-window=right:0%)" || return
  cd "$dir"
}

