# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

alias grep="grep --color=auto"

export LSCOLORS=ExFxBxDxCxegedabagacad
export CLICOLOR=1

export CLR_RED="\[\e[31m\]"
export CLR_GREEN="\[\e[32m\]"
export CLR_YELLOW="\[\e[33m\]"
export CLR_BLUE="\[\e[34m\]"
export CLR_LIGHT_GRAY="\[\e[90m\]"
export CLR_RESET="\[\e[0m\]"

# red color for root user
if [[ $(id -u) == 0 ]]
then
    export CLR_USER=$CLR_RED
else
    export CLR_USER=$CLR_GREEN
fi
