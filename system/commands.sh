# https://github.com/tadija/.dotfiles
# commands.sh

function df-platform() {
  df_platform="n/a"
  df_distro="n/a"
  df_is_wsl="0"

  case "$(uname -s)" in
    Darwin)
      df_platform="macos"
      df_distro="$(sw_vers -productVersion 2>/dev/null)"
      df_distro="${df_distro:-macos}"
      ;;
    Linux)
      df_platform="linux"
      if [ -f /etc/os-release ]; then
        df_distro=$(awk -F= '/^ID=/{gsub(/"/, "", $2); print $2}' /etc/os-release)
      fi
      if [ -r /proc/version ] && grep -qi microsoft /proc/version; then
        df_is_wsl="1"
      fi
      case "$df_distro" in
        archlinux) df_distro="arch" ;;
        ""|unknown) df_distro="linux" ;;
      esac
      ;;
    CYGWIN*|MINGW*|MSYS*|Windows_NT)
      df_platform="windows"
      df_distro="windows"
      ;;
    *)
      df_platform="unknown"
      df_distro="unknown"
      ;;
  esac
  echo "$df_platform"
}

function df-reload() {
  [ -f "$HOME/$shell_file" ] && source "$HOME/$shell_file"
  if [ -n "${df_distro:-}" ] && [ "$df_distro" != "$df_platform" ]; then
    echo "platform: $df_platform ($df_distro)"
  else
    echo "platform: $df_platform"
  fi
  exec zsh
}

function df-resolve() {
  local name="$1"

  local search_paths=(
    "$df"
    "$df/system"
    "$df/config"
    "$df/plugins"
    "$df/profiles"
  )

  for path in "${search_paths[@]}"; do
    local file="$path/$name.sh"
    if [ -e "$file" ]; then
      echo "$file"
      return 0
    fi
  done
}

function df-edit() {
  local file=$(df-resolve $1)

  if [ -e "$file" ]; then
    if [ -z "$EDITOR" ]; then
      open -t $file
    else
      $(echo $EDITOR) $file
    fi
  else
    cd $df
  fi
}

function df-link() {
  local entry="$1"
  local action="${2:-deploy}"
  local source="$entry"
  local target="$entry"

  if [[ "$entry" == *:* ]]; then
    source="${entry%%:*}"
    target="${entry##*:}"
  fi

  local source_path="$df/$source"
  local target_path="$HOME/$target"

  if [ ! -e "$source_path" ]; then
    echo "not found: $source"
    return 1
  fi

  if [ "$action" = "deploy" ]; then
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
      local timestamp=$(date "+%Y%m%d-%H%M%S")
      local backupFile="$target_path-$timestamp.dfb"
      mv "$target_path" "$backupFile"
      if type df-print >/dev/null 2>&1; then
        df-print "Moved existing $target -> $backupFile"
      else
        echo "Moved existing $target -> $backupFile"
      fi
    fi

    mkdir -p "$(dirname "$target_path")"
    ln -s "$source_path" "$target_path"

    if type df-print >/dev/null 2>&1; then
      df-print "deployed $target"
    else
      echo "deployed $target"
    fi
  elif [ "$action" = "destroy" ]; then
    rm -f "$target_path"
    if type df-print >/dev/null 2>&1; then
      df-print "destroyed $target"
    else
      echo "destroyed $target"
    fi
  else
    echo "unknown action: $action"
    return 1
  fi
}

function df-run() {
  local file=$(df-resolve $1)

  if [ -e "$file" ]; then
    . "$file"
  else
    echo "not found: $1"
  fi
}

function df-update() {
  cd $df
  git stash
  git fetch && git pull
  git stash apply
  df-reload
}

function df-destroy() {
  . $df/system/setup.sh destroy "$@"
}

function df-deploy() {
  . $df/system/setup.sh deploy "$@"
}

function df-gitid() {
  if [[ -z "$1" ]]; then
    echo "git user: $(git config user.name) | $(git config user.email)"
    return 0
  fi

  value=${df_git[$1]}
  name=$(echo $value | cut -d ';' -f1)
  email=$(echo $value | cut -d ';' -f2)

  if [[ -z $name || -z $email ]]; then
    echo "name or email not found in df_git[$1]"
  else
    if [[ $2 == "--global" ]]; then
      echo "configuring global git user..."
      git config --global user.name $name
      git config --global user.email $email
    else
      if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "not in a git repository"
        return 1
      fi

      echo "configuring local git user..."
      git config user.name $name
      git config user.email $email
    fi
    # print current git user after change
    df-gitid
  fi
}

function df-brew() {
  echo "[brew] checking..."
  if ! [ -x "$(command -v brew)" ]; then
    echo "[brew] installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  echo "[brew] updating..."
  brew update
  brew upgrade

  echo "[brew] cleanup..."
  brew cleanup
}

function df-install() {
  local profile_override="${1:-}"

  if [ -n "$profile_override" ]; then
    if [ ! -f "$df/profiles/$profile_override.sh" ]; then
      echo "[install] profile '$profile_override' not found: $df/profiles/$profile_override.sh" >&2
      return 1
    fi
    DF_PROFILE_OVERRIDE="$profile_override" DF_SKIP_PLUGINS=1 source "$df/system/init.sh"
  else
    echo "[install] profile: $df_profile (implicit)"
    if [ -n "${df_distro:-}" ] && [ "$df_distro" != "$df_profile" ]; then
      echo "[install] detected: $df_platform ($df_distro)"
    else
      echo "[install] detected: $df_platform"
    fi
    echo "[install] pass an explicit profile to avoid this prompt, for example: df-install vps"
    printf "[install] continue with profile '%s'? [y/N] " "$df_profile"
    read -r reply
    case "$reply" in
      [yY]|[yY][eE][sS]) ;;
      *)
        echo "[install] cancelled."
        return 1
        ;;
    esac
  fi

  df-brew

  echo ""
  echo "[brew] installing command line tools..."
  if (( ${#cli_tools[@]} > 0 )); then
    brew install ${cli_tools[@]} --force
  else
    echo "[brew] no command line tools configured, skipping."
  fi

  echo ""
  echo "[brew] installing apps..."
  if (( ${#apps[@]} > 0 )); then
    brew install --cask --appdir=$apps_path ${apps[@]} --force
  else
    echo "[brew] no apps configured, skipping."
  fi

  echo ""
  echo -e "[brew] cleanup...\n"

  brew cleanup
}

