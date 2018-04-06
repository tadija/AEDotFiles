# AEDotFiles
**From vanilla to personalized macOS in less then 30 minutes**

> I'm done with manually configuring everything after clean installation of macOS. If this can help you too, then great, feel free to customize it and use for your own needs.

Start Terminal app and follow instructions:

## Step 1 [get ready]

- Install [Xcode Command Line Tools](https://developer.apple.com/download/more/)
``` bash
xcode-select --install
```

- Clone this repo
``` bash
git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles
```

## Step 2 [set]

- Run [initial setup](setup/run.sh)
``` bash
. ~/.dotfiles/setup/run.sh
```

- Configure [AE theme](setup/AE.terminal) for Terminal
``` bash
setup-terminal
```

- Install / Update / Upgrade [Homebrew](http://brew.sh)
``` bash
setup-homebrew
```

## Step 3 [go]

- Configure [stuff](setup/config.sh)
``` bash
open -a TextEdit ~/.dotfiles/setup/config.sh
```

- Install [everything](setup/installations.sh)
``` bash
setup-installations
```

- Update [few system preferences](setup/defaults.sh)
``` bash
setup-defaults
```

- Edit [.bash_profile](.bash_profile) until you're satisfied

`done for fun`
