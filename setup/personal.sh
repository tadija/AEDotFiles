# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# me

export GIT_HOME_NAME="Marko Tadic"
export GIT_HOME_EMAIL="tadija@me.com"

export GIT_WORK_NAME="Marko Tadic"
export GIT_WORK_EMAIL="marko.tadic@appculture.com"

# my paths

icldocs=~/iCloud/Documents
icldev=$icldocs/Developer
iclgh=$icldev/GitHub
iclac=$icldev/appculture
iclas=$icldev/AppStore

export CDPATH=.:$icldocs:$icldev:$iclac:$iclas:$icldev/Lab:$iclgh:$iclgh/\#random:$iclgh/\#research:$iclgh/\#sketch

# my aliases

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"
