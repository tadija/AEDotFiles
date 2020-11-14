# https://github.com/tadija/AEDotFiles
# my.sh

alias sshadd="cd ~/.ssh && ssh-add -K tadija_rsa && ssh-add -K appculture_rsa && cd -"

###############################################################################
# Manual Config Reminder
###############################################################################

# [Dot Files]
# ln -s ~/Developer/GitHub/AEDotFiles ~/.dotfiles
# setup-defaults
# setup-fzf

# [iCloud]
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/Cloud

# [SSH]
# cp -rf ~/Cloud/Documents/Sync/.ssh ~/.ssh
# chmod 400 (each private key)
# ssh-add -K (each private key)

# [tmux]
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# https://github.com/tmux-plugins/tmux-resurrect
# https://github.com/tmux-plugins/tmux-continuum

# [fastlane]
# rbenv install --list
# rbenv install $latest
# rbenv global $latest
# rbenv rehash
# gem install fastlane -NV

# [Services]
# sudo rm -rf ~/Library/Services
# ln -s ~/Cloud/Documents/Sync/Services ~/Library/Services

# [Sublime]
# rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
# ln -s ~/Cloud/Documents/Sync/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# [Xcode]
# cd ~/Library/Developer/Xcode/UserData
# ln -s ~/Cloud/Documents/Sync/Xcode/CodeSnippets CodeSnippets
# ln -s ~/Cloud/Documents/Sync/Xcode/FontAndColorThemes FontAndColorThemes
# ln -s ~/Cloud/Documents/Sync/Xcode/KeyBindings KeyBindings
# ln -s ~/Cloud/Documents/Sync/Xcode/xcdebugger xcdebugger
# import accounts for code signing

# [Sketch]
# cd ~/Library/Application\ Support/com.bohemiancoding.sketch3
# ln -s ~/Cloud/Documents/Sync/Sketch/Libraries Libraries
# ln -s ~/Cloud/Documents/Sync/Sketch/Plugins Plugins
# ln -s ~/Cloud/Documents/Sync/Sketch/Templates Templates

# [TeaCode]
# rm -rf ~/Library/Application\ Support/com.apptorium.TeaCode-dm
# ln -s ~/Cloud/Documents/Sync/TeaCode/com.apptorium.TeaCode-dm ~/Library/Application\ Support/com.apptorium.TeaCode-dm

# [Safari]
# Close Left / Right Tabs -> https://redfinsolutions.com/blog/close-tabs-right-safari
# Keyboard / App Shortcuts / safari-close-left (CMD-SHIFT-Z) safari-close-right (CMD-SHIFT-X)
# Refind [https://refind.com]
