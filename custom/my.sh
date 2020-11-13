# https://github.com/tadija/AEDotFiles
# my.sh

typeset -Ag git_user
git_user[home]="Marko Tadic;tadija@me.com"
git_user[work]="Marko Tadic;marko.tadic@appculture.com"

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"
