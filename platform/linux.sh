# https://github.com/tadija/.dotfiles
# linux.sh

# base
source $df/platform/base.sh

# linux-specific additions
# dot_files+=(...)
shell_plugins+=(
  wsl # https://learn.microsoft.com/windows/wsl
)
cli_tools+=(
  caddy # https://caddyserver.com
  certbot # https://certbot.eff.org
  nginx # https://nginx.org
  supervisor # https://supervisord.org
  tailscale # https://tailscale.com
)
# apps=(...)

# distro-specific additions
if [ -n "${df_distro:-}" ]; then
  distro_file="$df/platform/$df_distro.sh"
  if [ -f "$distro_file" ]; then
    source "$distro_file"
  fi
fi

