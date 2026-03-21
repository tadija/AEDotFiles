# https://github.com/tadija/.dotfiles
# setup.sh

export df="${df:-$HOME/.dotfiles}"

### - helpers

function df-print() {
  echo "> $1"
  echo ""
}

function df-print-file() {
  echo "$1"
  dashes=----------------------------------------
  echo "<$dashes"
  cat $1
  echo "$dashes>"
  echo ""
}

### - main

function run() {
  local action="$1"
  local platform_override="${2:-}"

  if [ -n "$platform_override" ]; then
    DF_PLATFORM_OVERRIDE="$platform_override" DF_SKIP_PLUGINS=1 source "$df/system/init.sh"
  else
    DF_SKIP_PLUGINS=1 source "$df/system/init.sh"
  fi

  echo ""
  df-print "Hello $USER!"

  for file in "${dot_files[@]}"; do df-link "$file" "$action"; done

  if [ "$action" = "destroy" ] && [ ! -f "$HOME/$shell_file" ]; then
cat <<'EOF' > "$HOME/$shell_file"
autoload -Uz compinit && compinit
PS1='%~ ❯ '
bindkey -v
EOF
  fi

  if [ -f "$HOME/$shell_file" ]; then
    df-print "Loading $shell_file"
    source "$HOME/$shell_file"
    df-print-file "$HOME/$shell_file"
  fi

  if [ "$action" = "deploy" ]; then
    rm "$HOME/.zcompdump" 2>/dev/null
    df-print "dot files deployed!"
  fi

  if [ "$action" = "destroy" ]; then
    df-print "dot files destroyed!"
    df-print "setup again with: \`. ~/.dotfiles/system/setup.sh deploy\`"
    df-print "or remove all with \`rm -rf ~/.dotfiles\`"
  fi

  df-print "See more: https://github.com/tadija/.dotfiles"
}

function deploy() {
  run "deploy" "$1"
}

function destroy() {
  run "destroy" "$1"
}

"$@"

