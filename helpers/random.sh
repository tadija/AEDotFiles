# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://bash-completion.alioth.debian.org
if test $(which brew); then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  fi
fi

alias checkperm="stat -f '%OLp'"
alias icloudlog="brctl log --wait --shorten"
alias icloudoff="sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on && /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off"
alias icloudon="sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall off && /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on"
alias sketchdebug="tail -f /var/log/system.log|grep Sketch"
alias edf="subl ~/.dotfiles && fork ~/.dotfiles"
alias png2jpg="fd -e png -x convert {} {.}.jpg"