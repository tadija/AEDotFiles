# https://github.com/tadija/AEDotFiles
# my.sh

alias ssh-reload="cd ~/.ssh && fd -e pub -x ssh-add --apple-use-keychain {.} && cd -"

function my-radio() {
  echo "configuring radio..."
  cd ~/Downloads
  curl http://tadija.net/random/radio.zip > radio.zip
  unzip -qq radio.zip
  yes | cp -rf Radio.app /Applications
  rm radio.zip
  rm -rf Radio.app
  open -a /Applications/Radio.app
  cd -
  echo "ready to play! (check the menu bar)"
}

function my-dotfiles() {  
  ln -s ~/Developer/GitHub/AEDotFiles ~/.dotfiles
  la ~/.dotfiles
}

function my-cloud() {
  ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/Cloud
  la ~/Cloud
}

function my-ssh() {
  cp -rf ~/Cloud/Documents/Sync/.ssh ~/.ssh
  cd ~/.ssh && la

  # chmod 400 each private key
  fd -e pub -x chmod 400 {.}
  
  # ssh-add -K each private key manually
}

function my-tmux() {
  # install tmux plugin manager
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  if tmux ls; then
    # reload tmux
    tmux source-file ~/.tmux.conf
    echo "tmux reloaded"
  else
    # start new session
    tmux new-session
  fi
  # prefix + I (load plugins)
  # https://github.com/tmux-plugins/tmux-resurrect
  # https://github.com/tmux-plugins/tmux-continuum
}

function my-plugins() {
  setup-defaults
  echo ""
  setup-fzf
  echo ""
  setup-rbenv
  echo ""
  setup-fastlane
  echo ""
  gem install cocoapods
  echo ""
}

function my-services() {
  sudo rm -rf ~/Library/Services
  ln -s ~/Cloud/Documents/Sync/Services ~/Library/Services
  la ~/Library/Services
}

function my-sublime() {
  rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
  ln -s ~/Cloud/Documents/Sync/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
  la ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
}

function my-xcode() {
  cd ~/Library/Developer/Xcode/UserData

  rmd CodeSnippets
  ln -s ~/Cloud/Documents/Sync/Xcode/CodeSnippets CodeSnippets

  rmd FontAndColorThemes
  ln -s ~/Cloud/Documents/Sync/Xcode/FontAndColorThemes FontAndColorThemes
  
  rmd KeyBindings
  ln -s ~/Cloud/Documents/Sync/Xcode/KeyBindings KeyBindings

  rmd xcdebugger
  ln -s ~/Cloud/Documents/Sync/Xcode/xcdebugger xcdebugger

  la ~/Library/Developer/Xcode/UserData
  cd -

  # select command line tools version
  # import accounts for code signing
}

function my-sketch() {
  cd ~/Library/Application\ Support/com.bohemiancoding.sketch3

  rmd Libraries
  ln -s ~/Cloud/Documents/Sync/Sketch/Libraries Libraries

  rmd Plugins
  ln -s ~/Cloud/Documents/Sync/Sketch/Plugins Plugins

  rmd Templates
  ln -s ~/Cloud/Documents/Sync/Sketch/Templates Templates

  la ~/Library/Application\ Support/com.bohemiancoding.sketch3
}

function my-teacode() {
  rmd ~/Library/Application\ Support/com.apptorium.TeaCode-dm
  ln -s ~/Cloud/Documents/Sync/TeaCode/com.apptorium.TeaCode-dm ~/Library/Application\ Support/com.apptorium.TeaCode-dm
  la ~/Library/Application\ Support/com.apptorium.TeaCode-dm
}

function my-homebridge() {
  sudo npm install -g --unsafe-perm homebridge homebridge-config-ui-x
  sudo hb-service install
}
