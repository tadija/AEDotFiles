# https://github.com/tadija/.dotfiles
# tmux.sh

tmux-open() {
  local root="${1:-.}"
  local session="${2:-}"

  if [ ! -d "$root" ]; then
    echo "tmux-open: not a directory: $root" >&2
    return 1
  fi

  root="$(cd "$root" && pwd)" || return 1
  [ -n "$session" ] || session="$(basename "$root")"
  if [[ "$session" == .* ]]; then
    session="dot-${session#.}"
  fi

  tmux kill-session -t "$session" 2>/dev/null

  tmux new-session -d -s "$session" -c "$root"

  local dir
  for dir in "$root"/*/; do
    [ -d "$dir" ] || continue
    tmux new-window -t "$session:" -n "$(basename "$dir")" -c "$dir"
  done

  tmux kill-window -t "$session:0" 2>/dev/null || true

  if [ -n "${TMUX:-}" ]; then
    tmux switch-client -t "$session"
  else
    tmux attach -t "$session"
  fi
}

tmux-close() {
  local root="${1:-.}"

  if [ ! -d "$root" ]; then
    echo "tmux-close: not a directory: $root" >&2
    return 1
  fi

  root="$(cd "$root" && pwd)" || return 1
  local session
  session="$(basename "$root")"
  if [[ "$session" == .* ]]; then
    session="dot-${session#.}"
  fi

  tmux kill-session -t "$session" 2>/dev/null || {
    echo "tmux-close: session not found: $session" >&2
    return 1
  }
}

