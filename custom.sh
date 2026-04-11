# https://github.com/tadija/.dotfiles
# custom.sh

# git user(s)
typeset -Ag df_git
df_git[me]="Marko Tadic;tadija@me.com"
# df_git[gmk]="Marko Tadic;marko@gemikro.rs"
# df_git[yc]="Marko Tadic;mtadic@youngculture.com"
# df_git[ac]="Marko Tadic;marko@appculture.com"
# df_git[bux]="Marko Tadic;marko.tadic@getbux.com"
# df_git[calendly]="Marko Tadic;marko.tadic@calendly.com"
# df_git[gmi]="Marko Tadic;markot@gmi.si"
df_git[ai]="Agent Local;agent.local@localhost"
df_git[codex]="Agent Codex;agent.codex@localhost"
df_git[claude]="Agent Claude;agent.claude@localhost"

# path variable(s)
path=(
  $HOME/.local/bin
  $HOME/bin
  /bin
  /home/linuxbrew/.linuxbrew/bin
  /opt/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/postgresql@18/bin
  /opt/mssql-tools18/bin
  /sbin
  /snap/bin
  /usr/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/sbin
  $path
)

# setting(s)
export TERM=xterm-256color
export COLORTERM=truecolor

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="$(command -v nvim >/dev/null 2>&1 && echo nvim || echo vim)"
export VISUAL="$EDITOR"

export LESS='-RXMF'
export PAGER='less'

export MANPAGER='less'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_so=$'\e[1;40;36m'

export XDG_CONFIG_HOME="$HOME/.config"

