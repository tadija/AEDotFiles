###############################################################################
# tadija
###############################################################################

## variables ##

# default path
export PATH=/usr/local/bin:$PATH

# default directory for brew-cask install
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## aliases ##

# paths
alias pro="cd ~/Dropbox/Projects/"
alias ios="cd ~/Dropbox/Projects/iOS"
alias gh="cd ~/Dropbox/Projects/GitHub"
alias yc="cd ~/Dropbox/Projects/Youngculture/"
alias sy="cd ~/Dropbox/Sync/"

## commands ##

# git work / home global
alias gwg="git config --global user.name 'Marko Tadić' && git config --global user.email 'm.tadic@youngculture.com' && git config --global user.name && git config --global user.email"
alias ghg="git config --global user.name 'Marko Tadić' && git config --global user.email 'tadija@me.com' && git config --global user.name && git config --global user.email"

# git work / home local
alias gwl="git config user.name 'Marko Tadić' && git config user.email 'm.tadic@youngculture.com' && git config user.name && git config user.email"
alias ghl="git config user.name 'Marko Tadić' && git config user.email 'tadija@me.com' && git config user.name && git config user.email"

# show / hide hidden files in finder
alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

# random
alias checkperm="stat -f '%OLp'"
alias logicl="brctl log --wait --shorten"

alias bcs="brew cask search"
alias bci="brew cask install"
alias bcu="brew cask update"

###############################################################################
# Piperita Theme
###############################################################################

### Start Piperita Theme ###
# Theme by Jacob Tomlinson
# https://github.com/killfall/terminal-piperita

# Aliases to make ls easier to use in different modes, taken from Red Hat EL 6
alias ls='ls -GFh'
alias ll="ls -ll"
alias la="ll -a"

# Set ls colors
export LSCOLORS=ExFxBxDxCxegedabagacad

# Alias to set color in grep
alias grep="grep --color=auto"

# Environment variables to set prompt format and color
export COLOR_BOLD="\[\e[1m\]"
export COLOR_DEFAULT="\[\e[0m\]"

# Test if user is root and set user color appropriately
if [[ $(id -u) == 0 ]]
then
    export PS1USERCOLOR="\[\033[31m\]"
else
    export PS1USERCOLOR="\[\033[36m\]"
fi

# get current branch in git repo
function parse_git_branch() {
        BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=$(parse_git_dirty)
                echo " [${BRANCH}${STAT}]"
        else
                echo ""
        fi
}

# get current status of git repo
function parse_git_dirty {
        status=$(git status 2>&1 | tee)
        dirty=$(echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
        untracked=$(echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
        ahead=$(echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
        newfile=$(echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
        renamed=$(echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
        deleted=$(echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
        bits=''
        if [ "${renamed}" == "0" ]; then
                bits=">${bits}"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="*${bits}"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="+${bits}"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="?${bits}"
        fi
        if [ "${deleted}" == "0" ]; then
                bits="x${bits}"
        fi
        if [ "${dirty}" == "0" ]; then
                bits="!${bits}"
        fi
        if [ ! "${bits}" == "" ]; then
                echo " ${bits}"
        else
                echo ""
        fi
}

export PS1="$PS1USERCOLOR\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[33;1m\]\W\`if type parse_git_branch > /dev/null 2>&1; then parse_git_branch; fi\`\`if [ \$? = 0 ]; then echo -e '\[\033[m\]\$'; else echo -e '\[\e[31m\]\$'; fi\` \[\033[m\]"

export CLICOLOR=1

### End Piperita Theme ###
