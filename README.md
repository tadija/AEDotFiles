# AEDotFiles
**From vanilla to personalized macOS in less then 30 minutes**

> I'm done with manually configuring everything after clean installation of macOS. If this can help you too, then great, feel free to customize it and use for your own needs.

Install and run Xcode then start Terminal app and follow instructions:

## Step 1 [get ready]

- Clone this repo into your home directory

``` bash
$ git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles
```

- Run [initial setup](setup/run.sh) which will make your new [.bash_profile](.bash_profile)

``` bash
$ . ~/.dotfiles/setup/run.sh
```

- Configure [AE theme](themes/AE.terminal) for Terminal

``` bash
$ setup-terminal
```

## Step 2 [set]

- Update [few system preferences](setup/defaults.sh)

``` bash
$ setup-defaults
```

- Configure and save [your stuff](setup/personal.sh)

``` bash
$ open -a TextEdit ~/.dotfiles/setup/personal.sh
```

- Reload new settings and configure default Git user

``` bash
# choose between `githomeglobal` or `gitworkglobal`
$ reload && githomeglobal
```

## Step 3 [go]

- Configure [what's gonna be installed](setup/config.sh)

``` bash
$ open -a TextEdit ~/.dotfiles/setup/config.sh
```

- Install / Update / Upgrade [Homebrew](http://brew.sh)

``` bash
$ setup-homebrew
```

- Install [everything](setup/installations.sh)

``` bash
$ setup-installations
```

---

`done for fun`
