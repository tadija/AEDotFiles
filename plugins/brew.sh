# https://github.com/tadija/AEDotFiles
# brew.sh

if [ -x "$(command -v brew)" ]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

alias bs="brew search"
alias bci="brew cask install"
alias bcu="brew cask uninstall"
alias bcz="brew cask zap"
alias bcd="brew cask doctor"
alias bcc="brew cask cleanup"
alias bcl="brew cask list"
alias bz="brew rmtree"
