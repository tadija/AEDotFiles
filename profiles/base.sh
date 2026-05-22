# https://github.com/tadija/.dotfiles
# base.sh

# dot files
dot_files=(
  config/ghostty:.config/ghostty
  config/git/.gitconfig:.gitconfig
  config/git/.gitignore:.gitignore
  config/lldb/.lldbinit:.lldbinit
  config/nvim:.config/nvim
  config/tmux/.tmux.conf:.tmux.conf
  system/.shell:.zshrc
)

# shell plugins
shell_plugins=(
  bat # https://github.com/sharkdp/bat
  brew # https://brew.sh
  colors # https://github.com/tadija/.dotfiles
  dotnet # https://aka.ms/dotnet/info
  fastlane # https://fastlane.tools
  fzf # https://github.com/junegunn/fzf
  general # https://github.com/tadija/.dotfiles
  git # https://git-scm.com
  hub # https://hub.github.com
  mise # https://mise.jdx.dev
  my # https://github.com/tadija/.dotfiles
  nodenv # https://github.com/nodenv/nodenv
  prompt # https://github.com/tadija/.dotfiles
  pyenv # https://github.com/pyenv/pyenv
  rbenv # https://github.com/rbenv/rbenv
  rustup # https://rustup.rs
  swift # https://www.swift.org
  tmux # http://tmux.github.io
  vscode # https://code.visualstudio.com
  zsh # https://www.zsh.org
)

# command line tools
cli_tools=(
  ast-grep # https://github.com/ast-grep/ast-grep
  bat # https://github.com/sharkdp/bat
  cloc # https://github.com/AlDanial/cloc
  dotnet # https://aka.ms/dotnet/info
  eza # https://github.com/eza-community/eza
  fastfetch # https://github.com/fastfetch-cli/fastfetch
  fd # https://github.com/sharkdp/fd
  font-roboto-mono-nerd-font # https://www.nerdfonts.com
  fzf # https://github.com/junegunn/fzf
  gh # https://cli.github.com
  git # https://git-scm.com
  git-lfs # https://git-lfs.github.com
  golang # https://go.dev
  graphicsmagick # http://www.graphicsmagick.org
  htop # https://htop.dev/
  hub # https://hub.github.com
  jq # https://stedolan.github.io/jq
  lazygit # https://github.com/jesseduffield/lazygit
  luarocks # https://luarocks.org
  mise # https://mise.jdx.dev
  mysql # https://dev.mysql.com
  nodenv # https://github.com/nodenv/nodenv
  npm # https://www.npmjs.com
  nvim # https://neovim.io
  pipx # https://pipx.pypa.io
  postgresql@18 # https://www.postgresql.org 
  pyenv # https://github.com/pyenv/pyenv
  ranger # https://github.com/ranger/ranger
  rbenv # https://github.com/rbenv/rbenv
  ripgrep # https://github.com/BurntSushi/ripgrep
  rust # https://www.rust-lang.org
  rustup # https://rustup.rs
  sqlite # https://www.sqlite.org
  swiftformat # https://github.com/nicklockwood/SwiftFormat
  swiftlint # https://github.com/realm/SwiftLint
  swiftly # https://github.com/swiftlang/swiftly
  tig # https://github.com/jonas/tig
  tlrc # https://tldr.sh/tlrc
  tmux # http://tmux.github.io
  tree # http://oldmanprogrammer.net/source.php?dir=projects/tree
  wget # https://www.gnu.org/software/wget
  zig # https://ziglang.org
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# ai agents
ai_agents=(
  claude-code # https://code.claude.com
  codex # https://openai.com/codex
  copilot-cli # https://github.com/features/copilot/cli
  gemini-cli # https://geminicli.com
  openclaw-cli # https://github.com/openclaw/openclaw
  picoclaw # https://github.com/sipeed/picoclaw
  zeroclaw # https://github.com/zeroclaw-labs/zeroclaw
  nullclaw # https://github.com/nullclaw/nullclaw
)
cli_tools+=("${ai_agents[@]}")

# apps
apps_path=""
apps=()

