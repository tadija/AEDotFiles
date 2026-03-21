# https://github.com/tadija/.dotfiles
# init.sh

loadPlatformConfig() {
  dot_files=()
  shell_plugins=()
  cli_tools=()
  apps=()
  apps_path=""

  local platform_file="$df/platform/$df_platform.sh"
  if [ -f "$platform_file" ]; then
    source "$platform_file"
    return 0
  fi

  local base_file="$df/platform/base.sh"
  if [ -f "$base_file" ]; then
    echo "platform '$df_platform' not found, using platform/base.sh." >&2
    source "$base_file"
    return 0
  fi

  echo "platform '$df_platform' not found, no platform config loaded." >&2
}

# `system/init.sh` will source each item in `shell_plugins` from "shell" dir.
# any file can be overriden by a file with the same name in "config" dir.
loadShellPlugins() {
  if [ -z "${DF_SKIP_PLUGINS:-}" ]; then
    for plugin in $shell_plugins; do
      local file=$(df-resolve $plugin)
      if [ -e "$file" ]; then
        source $file
      fi
    done
  fi
}

# main
source "$df/system/commands.sh"
df-platform >/dev/null
if [ -n "${DF_PLATFORM_OVERRIDE:-}" ]; then
  df_platform="$DF_PLATFORM_OVERRIDE"
fi
export df_platform
export df_distro
export df_is_wsl
shell_file=".zshrc"
loadPlatformConfig
[ -f "$df/custom.sh" ] && source "$df/custom.sh"
loadShellPlugins
[ -f ~/.env.local ] && source ~/.env.local

