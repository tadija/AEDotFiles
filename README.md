# AEDotFiles
**From vanilla to personalized OSX in less then 30 minutes**

> I'm done with manually configuring everything after clean installation of OSX. If this can help you too, then great, feel free to customize it and use for your own needs.

## Step 1
Open Terminal, clone this repo and run `ae.sh`.  
``` bash
git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles && cd ~/.dotfiles
. ae.sh
```

## Step 2
Open `~/.dotfiles/settings.sh` in your editor of choice and configure what's gonna be installed.

### Hints
When you're done, don't forget to update these files to fit your need:
- `~/.dotfiles/config/.gitconfig` 
- `~/.dotfiles/config/.gitignore` 
- `~/.dotfiles/scripts/custom.sh`

## Step 3
Run the setup scripts:
- `setup-terminal` | Install [Piperita theme](https://github.com/jacobtomlinson/terminal-piperita)
- `setup-homebrew` | Install / Update / Upgrade [Homebrew](http://brew.sh)
- `setup-utilities` | Install all utilities from `settings.sh`
- `setup-apps` | Install all the apps, quicklook plugins and fonts from `settings.sh`
- `setup-system` | Configure system settings (as I like)
- `setup-custom` | As I said, you should edit this script to do anything that you want.

`done for fun`
