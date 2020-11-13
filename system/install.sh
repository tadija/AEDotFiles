# https://github.com/tadija/AEDotFiles
# install.sh

source $df/custom/config.sh
source $df/system/homebrew.sh

echo ""
echo "[brew] installing quicklook plugins..."
brew cask install ${qlplugins[@]}

echo ""
echo "[brew] installing command line tools..."
brew install ${cli[@]}

echo ""
echo "[brew] installing apps..."
brew cask install --appdir=$apps_installation_path ${apps[@]} --force

echo ""
echo -e "[brew] cleanup...\n"

brew cleanup
