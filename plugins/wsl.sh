# https://github.com/tadija/.dotfiles
# wsl.sh

if [ "${df_is_wsl:-0}" = "1" ]; then
  alias o="explorer.exe ."

  function git {
    # use windows git when working inside windows-mounted drives.
    if [[ $(pwd -P) =~ ^/mnt/[a-zA-Z]/ ]]; then
      git.exe "$@"
    else
      command git "$@"
    fi
  }

  winpath() {
    wslpath -w "${1:-.}"
  }

  winlocalappdata() {
    local dir
    dir=$(powershell.exe -NoProfile -Command '[Environment]::GetFolderPath("LocalApplicationData")' 2>/dev/null)
    dir=${dir//$'\r'/}
    [ -n "$dir" ] && wslpath -u "$dir" && return

    local path_entry
    for path_entry in ${(s.:.)PATH}; do
      case "$path_entry" in
        /mnt/c/Users/*/AppData/Local/*)
          print -r -- "${path_entry%%/AppData/Local/*}/AppData/Local"
          return
          ;;
      esac
    done
  }

  npp() {
    "/mnt/c/Program Files/Notepad++/notepad++.exe" "$(winpath "$1")"
  }

  zed() {
    "/mnt/c/Program Files/Zed/zed.exe" "$(winpath "$1")"
  }

  fork() {
    local app
    app=$(command -v Fork.exe 2>/dev/null)

    if [ -z "$app" ]; then
      local localappdata=$(winlocalappdata)
      for app in "$localappdata/Fork/current/Fork.exe" "$localappdata/Fork/Fork.exe"; do
        [ -x "$app" ] && break
      done
    fi

    [ -x "$app" ] || return 1
    "$app" "$(winpath "$1")"
  }
fi
