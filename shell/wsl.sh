# https://github.com/tadija/.dotfiles
# wsl.sh

if [ "${df_is_wsl:-0}" = "1" ]; then
  alias o="explorer.exe ."

  npp() {
    "/mnt/c/Program Files/Notepad++/notepad++.exe" "$(wslpath -w "$1")"
  }

  zed() {
    "/mnt/c/Program Files/Zed/zed.exe" "$(wslpath -w "$1")"
  }
fi

