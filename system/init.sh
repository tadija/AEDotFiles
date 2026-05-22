# https://github.com/tadija/.dotfiles
# init.sh

loadProfileConfig() {
  dot_files=()
  shell_plugins=()
  cli_tools=()
  apps=()
  apps_path=""

  local profile_file="$df/profiles/$df_profile.sh"
  if [ -f "$profile_file" ]; then
    source "$profile_file"
    return 0
  fi

  local base_file="$df/profiles/base.sh"
  if [ -f "$base_file" ]; then
    echo "profile '$df_profile' not found, using profiles/base.sh." >&2
    source "$base_file"
    return 0
  fi

  echo "profile '$df_profile' not found, no profile config loaded." >&2
}

# `system/init.sh` will source each item in `shell_plugins` from "plugins" dir.
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
df_profile="$df_platform"
if [ -n "${DF_PROFILE_OVERRIDE:-}" ]; then
  df_profile="$DF_PROFILE_OVERRIDE"
fi
export df_profile
export df_platform
export df_distro
export df_is_wsl
shell_file=".zshrc"
loadProfileConfig
[ -f "$df/custom.sh" ] && source "$df/custom.sh"
loadShellPlugins
[ -f ~/.env.local ] && source ~/.env.local

