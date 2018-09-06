# https://github.com/tadija/AEDotFiles
# Copyright (c) Marko Tadić 2015-2018
# Licensed under the MIT license. See LICENSE file.

# https://swiftenv.fuller.li
if test $(which swiftenv); then
  eval "$(swiftenv init -)"
fi

# https://github.com/rbenv/rbenv
if test $(which rbenv); then
  eval "$(rbenv init -)"
fi

# http://fastlane.tools
if test $(which fastlane); then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

# https://github.com/junegunn/fzf
if test $(which fzf); then
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  export FZF_DEFAULT_OPTS="--bind pgup:preview-up --bind pgdn:preview-down "
  export FZF_DEFAULT_OPTS+="--bind='ctrl-o:execute(subl {})+abort'"
  export FZF_DEFAULT_COMMAND='fd --type file'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# https://github.com/clvv/fasd
if test $(which fasd); then
  eval "$(fasd --init auto)"
fi
