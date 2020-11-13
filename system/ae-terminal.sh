# https://github.com/tadija/AEDotFiles
# ae-terminal.sh

echo ""
echo "Configuring AE theme..."
echo ""

open ~/.dotfiles/themes/AE.terminal
sleep 1
defaults write com.apple.Terminal "Default Window Settings" -string "AE"
defaults write com.apple.Terminal "Startup Window Settings" -string "AE"
osascript -e 'tell application "Terminal" to quit' & exit
