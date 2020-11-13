# https://github.com/tadija/AEDotFiles
# prompt.sh

autoload -Uz promptinit
promptinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yellow}[%b]%f'
zstyle ':vcs_info:*' enable git

PROMPT='%F{blue}%~%f '\$vcs_info_msg_0_'$prompt_newline%F{green}%n@%m%f %# '
