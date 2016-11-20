# AEDotFiles
**From vanilla to personalized OSX in less then 30 minutes**

> I'm done with manually configuring everything after clean installation of OSX. If this can help you too, then great, feel free to customize it and use for your own needs.

Open Terminal and follow instructions:

## Step 0 [get ready]

- Install Xcode Command Line Tools:
``` bash
xcode-select --install
```

## Step 1 [set]

- Clone this repo:  
``` bash
git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles && cd ~/.dotfiles
```

- Run initial script:
``` bash
. ~/.dotfiles/ae.sh
```

- Install [Piperita theme](https://github.com/jacobtomlinson/terminal-piperita) for Terminal:
``` bash
setup-terminal
```

- Install / Update / Upgrade [Homebrew](http://brew.sh):
``` bash
setup-homebrew
```

- Configure **.gitconfig** file:
``` bash
open -a Xcode ~/.dotfiles/config/.gitconfig
```

- Configure **.gitignore** file:
``` bash
open -a Xcode ~/.dotfiles/config/.gitignore
```

- Configure **shortcuts.sh** file:
``` bash
open -a Xcode ~/.dotfiles/profile/shortcuts.sh
```

## Step 2 [go]

- Configure **settings.sh** file (what's gonna be installed):
``` bash
open -a Xcode ~/.dotfiles/settings.sh
```

- Install all utilities from `settings.sh`:
``` bash
setup-utilities
```

- Install all apps, quicklook plugins and fonts from `settings.sh`:
``` bash
setup-apps
```

## Step 3 [custom / optional]

- Configure system settings (the way I like)
``` bash
setup-system
```

- Configure **custom.sh** script:
``` bash
open -a Xcode ~/.dotfiles/scripts/custom.sh
```

- Run **custom.sh** script:
``` bash
setup-custom
```

`done for fun`
