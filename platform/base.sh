# https://github.com/tadija/.dotfiles
# base.sh

# dot files
dot_files=(
  system/.shell:.zshrc
  config/git/.gitconfig:.gitconfig
  config/git/.gitignore:.gitignore
  config/nvim:.config/nvim
  config/tmux/.tmux.conf:.tmux.conf
)

# shell plugins
shell_plugins=(
  colors # https://github.com/tadija/.dotfiles
  general # https://github.com/tadija/.dotfiles
  git # https://git-scm.com
  prompt # https://github.com/tadija/.dotfiles
  zsh # https://www.zsh.org
)

# command line tools
cli_tools=(
  bat # https://github.com/sharkdp/bat
  eza # https://github.com/eza-community/eza
  fd # https://github.com/sharkdp/fd
  fzf # https://github.com/junegunn/fzf
  git # https://git-scm.com
  nvim # https://neovim.io
  ripgrep # https://github.com/BurntSushi/ripgrep
  tmux # http://tmux.github.io
)

# apps
apps_path=""
apps=()

