# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://bash-completion.alioth.debian.org
if test $(which brew); then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  fi
fi

# https://hub.github.com
eval "$(hub alias -s)"

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"
alias checkperm="stat -f '%OLp'"
alias icloudlog="brctl log --wait --shorten"
alias icloudoff="sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on && /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off"
alias icloudon="sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall off && /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on"
alias sketchdebug="tail -f /var/log/system.log|grep Sketch"
alias editdotfiles='atom ~/.dotfiles && gitopen ~/.dotfiles'
