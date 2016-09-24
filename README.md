# AEDotFiles
**From vanilla to personalized OSX in less then 30 minutes**

> I'm done with manually configuring everything after clean installation of OSX. If this can help you too, then great, feel free to customize it and use for your own needs.

## Step 1
``` bash
git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles && cd ~/.dotfiles
. ae.sh
```

## Step 2
Open `~/.dotfiles/settings.sh` in your editor of choice and configure what's gonna be installed.

### Hints
While you're editing, don't forget these:
- `~/.dotfiles/config/.gitconfig` 
- `~/.dotfiles/config/.gitignore` 
- `~/.dotfiles/profile/custom.sh` 
- `~/.dotfiles/scripts/custom.sh`

## Step 3
Run the setup scripts:
- `setup-terminal` | Install [Piperita theme](https://github.com/jacobtomlinson/terminal-piperita)
- `setup-homebrew` | Install / Update / Upgrade [Homebrew](http://brew.sh)
- `setup-binaries` | Install all the binaries from `settings.sh`
- `setup-apps` | Install all the apps, quicklook plugins and fonts from `settings.sh`
- `setup-system` | Configure system settings (as I like)
- `setup-custom` | As I said, you should edit this script to do anything that you want.

`done for fun`
