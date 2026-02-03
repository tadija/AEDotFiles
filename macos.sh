# https://github.com/tadija/.dotfiles
# macos.sh

# dot files
dot_files=(
  system/.shell:.zshrc
  config/ghostty:.config/ghostty
  config/git/.gitconfig:.gitconfig
  config/git/.gitignore:.gitignore
  config/hammerspoon:.hammerspoon
  config/karabiner:.config/karabiner
  config/linearmouse:.config/linearmouse
  config/lldb/.lldbinit:.lldbinit
  config/nvim:.config/nvim
  config/tmux/.tmux.conf:.tmux.conf
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
  nvm # https://github.com/nvm-sh/nvm
  orbstack # https://orbstack.dev
  prompt # https://github.com/tadija/.dotfiles
  rbenv # https://github.com/rbenv/rbenv
  subl # https://www.sublimetext.com
  swift # https://www.swift.org
  swiftenv # https://github.com/kylef/swiftenv
  vscode # https://code.visualstudio.com
  wsl # https://learn.microsoft.com/windows/wsl
  xcode # https://developer.apple.com/xcode
  zsh # https://www.zsh.org
)

# command line tools
cli_tools=(
  ast-grep # https://github.com/ast-grep/ast-grep
  bat # https://github.com/sharkdp/bat
  codex # https://openai.com/codex
  claude-code # https://code.claude.com
  cloc # https://github.com/AlDanial/cloc
  copilot-cli # https://github.com/features/copilot/cli
  dotnet # https://aka.ms/dotnet/info
  eza # https://github.com/eza-community/eza
  fastfetch # https://github.com/fastfetch-cli/fastfetch
  fd # https://github.com/sharkdp/fd
  font-roboto-mono-nerd-font # https://www.nerdfonts.com
  fzf # https://github.com/junegunn/fzf
  gemini-cli # https://geminicli.com
  gh # https://cli.github.com
  git # https://git-scm.com
  git-lfs # https://git-lfs.github.com
  golang # https://go.dev
  graphicsmagick # http://www.graphicsmagick.org
  heroku/brew/heroku # https://cli.heroku.com
  htop # https://htop.dev/
  hub # https://hub.github.com
  jq # https://stedolan.github.io/jq
  lazygit # https://github.com/jesseduffield/lazygit
  luarocks # https://luarocks.org
  mas # https://github.com/mas-cli/mas
  mise # https://mise.jdx.dev
  mysql # https://dev.mysql.com
  nodenv # https://github.com/nodenv/nodenv
  npm # https://www.npmjs.com
  nvim # https://neovim.io
  pipx # https://pipx.pypa.io
  pyenv # https://github.com/pyenv/pyenv
  ranger # https://github.com/ranger/ranger
  rbenv # https://github.com/rbenv/rbenv
  ripgrep # https://github.com/BurntSushi/ripgrep
  swiftly # https://github.com/swiftlang/swiftly
  speedtest-cli # https://github.com/sivel/speedtest-cli
  kylef/formulae/swiftenv # https://github.com/kylef/swiftenv
  swiftformat # https://github.com/nicklockwood/SwiftFormat
  swiftgen # https://github.com/SwiftGen/SwiftGen
  swiftlint # https://github.com/realm/SwiftLint
  tig # https://github.com/jonas/tig
  tlrc # https://tldr.sh/tlrc
  tmux # http://tmux.github.io
  tree # http://oldmanprogrammer.net/source.php?dir=projects/tree
  wget # https://www.gnu.org/software/wget
  xcbeautify # https://github.com/cpisciotta/xcbeautify
  xcode-build-server # https://github.com/SolaWing/xcode-build-server
  xcp # https://github.com/wojciech-kulik/XcodeProjectCLI
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# mac apps
apps_path="/Applications"
apps=(
  alfred # https://www.alfredapp.com
  appcleaner # https://freemacsoft.net/appcleaner
  arc # https://arc.net
  claude # https://claude.ai
  db-browser-for-sqlite # https://sqlitebrowser.org
  docker # https://www.docker.com/products/docker-desktop
  fork # https://git-fork.com
  ghostty # https://ghostty.org
  google-drive # https://www.google.com/drive
  hammerspoon # https://www.hammerspoon.org
  karabiner-elements # https://karabiner-elements.pqrs.org
  linearmouse # https://linearmouse.org
  macdown # https://macdown.uranusjr.com
  notepadexe # https://notepadexe.com
  openvpn-connect # https://openvpn.net/client
  rapidapi # https://rapidapi.com
  raycast # https://www.raycast.com
  red-eye # https://www.hexedbits.com/redeye
  sequel-ace # https://sequel-ace.com
  sf-symbols # https://developer.apple.com/sf-symbols
  simsim # https://github.com/dsmelov/simsim
  sketch # https://www.sketch.com
  sublime-text # https://www.sublimetext.com
  textmate # https://macromates.com
  visual-studio-code # https://code.visualstudio.com
  xcodes # https://github.com/RobotsAndPencils/XcodesApp
  xscope # https://xscopeapp.com
  zoom # https://zoom.us
  zed # https://zed.dev
)

