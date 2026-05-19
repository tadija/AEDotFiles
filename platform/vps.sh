# https://github.com/tadija/.dotfiles
# vps.sh

# dot files
dot_files=(
  config/git/.gitconfig:.gitconfig
  config/git/.gitignore:.gitignore
  config/nvim:.config/nvim
  config/tmux/.tmux.conf:.tmux.conf
  system/.shell:.zshrc
)

# shell plugins
shell_plugins=(
  bat # https://github.com/sharkdp/bat
  colors # https://github.com/tadija/.dotfiles
  fzf # https://github.com/junegunn/fzf
  general # https://github.com/tadija/.dotfiles
  git # https://git-scm.com
  my # https://github.com/tadija/.dotfiles
  prompt # https://github.com/tadija/.dotfiles
  tmux # http://tmux.github.io
  zsh # https://www.zsh.org
)

# command line tools
cli_tools=(
  bat # https://github.com/sharkdp/bat
  caddy # https://caddyserver.com
  eza # https://github.com/eza-community/eza
  fd # https://github.com/sharkdp/fd
  fzf # https://github.com/junegunn/fzf
  gh # https://cli.github.com
  git # https://git-scm.com
  htop # https://htop.dev/
  jq # https://stedolan.github.io/jq
  lazygit # https://github.com/jesseduffield/lazygit
  mise # https://mise.jdx.dev
  nvim # https://neovim.io
  rbenv # https://github.com/rbenv/rbenv
  ripgrep # https://github.com/BurntSushi/ripgrep
  supervisor # https://supervisord.org
  swiftly # https://github.com/swiftlang/swiftly
  tig # https://github.com/jonas/tig
  tlrc # https://tldr.sh/tlrc
  tmux # http://tmux.github.io
  tree # http://oldmanprogrammer.net/source.php?dir=projects/tree
  wget # https://www.gnu.org/software/wget
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# role-specific additions
case "${DF_VPS_ROLE:-}" in
  app)
    cli_tools+=(
      bun # https://bun.sh
      node # https://nodejs.org
      uv # https://docs.astral.sh/uv
    )
    ;;

  db)
    cli_tools+=(
      mongodb/brew/mongodb-community # https://www.mongodb.com
      mysql # https://dev.mysql.com
      postgresql@18 # https://www.postgresql.org
    )
    ;;

  container)
    cli_tools+=(
      docker # https://www.docker.com
      docker-compose # https://docs.docker.com/compose
      lazydocker # https://github.com/jesseduffield/lazydocker
    )
    ;;

  polyglot)
    cli_tools+=(
      go # https://go.dev
      rust # https://www.rust-lang.org
      zig # https://ziglang.org
    )
    ;;

  rails)
    cli_tools+=(
      rbenv # https://github.com/rbenv/rbenv
      libpq # https://www.postgresql.org
      ruby-build # https://github.com/rbenv/ruby-build
    )
    ;;

  swift)
    cli_tools+=(
      swiftly # https://github.com/swiftlang/swiftly
      swift-format # https://github.com/swiftlang/swift-format
      swiftlint # https://github.com/realm/SwiftLint
    )
    ;;

  wordpress)
    cli_tools+=(
      composer # https://getcomposer.org
      php # https://www.php.net
      wp-cli # https://wp-cli.org
    )
    ;;
esac

# apps
apps_path=""
apps=()
