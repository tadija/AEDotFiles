# https://rustup.rs
# rustup.sh

# if rustup is installed via homebrew, ensure it comes first.
if [ -n "${HOMEBREW_PREFIX:-}" ] && [ -d "$HOMEBREW_PREFIX/opt/rustup/bin" ]; then
  path=("$HOMEBREW_PREFIX/opt/rustup/bin" $path)
fi

# rustup installer writes this to set PATH and related vars.
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

