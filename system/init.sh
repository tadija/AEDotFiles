# https://github.com/tadija/.dotfiles
# init.sh

loadPlatformConfig() {
  dot_files=()
  shell_plugins=()
  cli_tools=()
  apps=()
  apps_path=""

  platform_file="$df/$df_platform.sh"
  [ -f "$platform_file" ] && source "$platform_file"
}

# `system/init.sh` will source each item in `shell_plugins` from "plugins" dir.
# any file can be overriden by a file with the same name in "config" dir.
loadShellPlugins() {
  if [ -z "${DF_SKIP_PLUGINS:-}" ]; then
    for plugin in $shell_plugins; do
      local file=$(df-find $plugin)
      if [ -e "$file" ]; then
        source $file
      fi
    done
  fi
}

# main
source $df/system/commands.sh
df_platform="$(df-platform)"
export df_platform
shell_file=".zshrc"
loadPlatformConfig
source $df/config/main.sh
loadShellPlugins
[ -f ~/.env.local ] && source ~/.env.local

