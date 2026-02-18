# https://github.com/tadija/.dotfiles
# brew.sh

brew_bin_paths=(
  "/home/linuxbrew/.linuxbrew/bin/brew"
  "/opt/homebrew/bin/brew"
  "/usr/local/bin/brew"
)
brew_bin_path=""
for brew_bin_path in "${brew_bin_paths[@]}"; do
  if [ -x "$brew_bin_path" ]; then
    eval "$("$brew_bin_path" shellenv zsh)"
    break
  fi
done

alias bs="brew search"
alias bci="brew cask install"
alias bcu="brew cask uninstall"
alias bcz="brew cask zap"
alias bcd="brew cask doctor"
alias bcc="brew cask cleanup"
alias bcl="brew cask list"
alias bz="brew rmtree"
