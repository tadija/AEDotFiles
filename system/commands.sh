# https://github.com/tadija/AEDotFiles
# commands.sh

function df-reload() {
  source ~/.zshrc
}

function df-find() {
  local system="$df/system/$1.sh"
  local custom="$df/custom/$1.sh"
  local plugin="$df/plugins/$1.sh"

  if [ -e "$system" ]; then
    echo "$system"
  elif [ -e "$custom" ]; then
    echo "$custom"
  elif [ -e "$plugin" ]; then
    echo "$plugin"
  fi
}

function df-run() {
  local file=$(df-find $1)

  if [ -e "$file" ]; then
    . "$file"
  else
    echo "$1 - not found"
  fi
}

function df-edit() {
  local file=$(df-find $1)
  if [ -z "$EDITOR" ]; then
    open -t $file
  else
    $(echo $EDITOR) $file
  fi
}
