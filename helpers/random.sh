# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

alias checkperm="stat -f '%OLp'"
alias icloudlog="brctl log --wait --shorten"
alias sketchdebug="tail -f /var/log/system.log|grep Sketch"
alias png2jpg="fd -e png -x convert {} {.}.jpg"
