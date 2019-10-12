# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# me

export GIT_HOME_NAME="Marko Tadic"
export GIT_HOME_EMAIL="tadija@me.com"

export GIT_WORK_NAME="Marko Tadic"
export GIT_WORK_EMAIL="marko.tadic@appculture.com"

# my paths

dev=~/Developer
gh=$dev/GitHub
ac=$dev/appculture
as=$dev/AppStore
web=$dev/Web
lab=$dev/Lab
local=$dev:$gh:$ac:$as:$web:$lab

cldocs=~/Cloud/Documents
cldev=$cldocs/Developer
clgh=$cldev/GitHub
clac=$cldev/appculture
clas=$cldev/AppStore
cloud=$cldocs:$cldev:$clgh:$clac:$clas

export CDPATH=.:$local:$cloud

# my aliases

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"
alias disablecursorblink="defaults write -g NSTextInsertionPointBlinkPeriod -float 60000"
