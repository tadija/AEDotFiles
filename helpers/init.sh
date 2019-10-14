# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2019
# Licensed under the MIT license. See LICENSE file.

if [ -n "$BASH_VERSION" ]; then
  # https://bash-completion.alioth.debian.org
  if [ -x "$(command -v brew)" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    fi
  fi

  # https://github.com/apple/swift-package-manager
  if [ -x "$(command -v swift)" ]; then
    eval "`swift package completion-tool generate-bash-script`"
  fi
fi

# https://swiftenv.fuller.li
if [ -x "$(command -v swiftenv)" ]; then
  eval "$(swiftenv init -)"
fi

# https://github.com/rbenv/rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# https://hub.github.com
if [ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi

# http://fastlane.tools
if [ -x "$(command -v fastlane)" ]; then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

# https://github.com/junegunn/fzf
if [ -x "$(command -v fzf)" ]; then
  if [ -n "$BASH_VERSION" ]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  elif [ -n "$ZSH_VERSION" ]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  fi
  
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --bind pgup:preview-up --bind pgdn:preview-down"
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --bind='ctrl-p:execute(bat {})+abort'"
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --bind='ctrl-o:execute(subl {})'"
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" --bind='ctrl-c:execute-silent(cat {} | pbcopy)'"

  export FZF_DEFAULT_COMMAND='fd --type file'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_T_OPTS="--preview-window right:50% --preview 'bat {}'"
fi

# https://github.com/clvv/fasd
if [ -x "$(command -v fasd)" ]; then
  export _FASD_BACKENDS="native spotlight current"
  eval "$(fasd --init auto)"
fi

# https://github.com/sharkdp/bat
if [ -x "$(command -v bat)" ]; then
  alias cat="bat"
fi
