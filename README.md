# AEDotFiles

**From vanilla to personalized macOS in less then 30 minutes**

> If this can help you too, then great, feel free to customize it and use for your own needs.

Install and run Xcode then start Terminal app and follow instructions:

## Step 1 [get ready]

- Clone this repo into your home directory

	``` bash
	$ git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles
	```

- Run [initial setup](setup/run.sh) which will make your new [.shell_file](.shell_file)

	``` bash
	$ . ~/.dotfiles/setup/run.sh
	```

- Configure [AE theme](themes/AE.terminal) for Terminal (optional)

	``` bash
	$ . $df/setup/terminal.sh
	```

## Step 2 [set]

- Configure and save [your custom stuff](setup/personal.sh)

	``` bash
	$ open -t $EDITOR ~/.dotfiles/setup/personal.sh
	```

- Configure and save [what's gonna be installed](setup/config.sh)

	``` bash
	$ open -t $EDITOR ~/.dotfiles/setup/config.sh
	```
	
- Reload new settings and configure default Git user

	``` bash
	$ githomeglobal # or `gitworkglobal`
	$ reload # source .shell_file
	$ gitwho # see current git user
	```

## Step 3 [go]

- Install / Update / Upgrade [Homebrew](http://brew.sh)

	``` bash
	$ . $df/setup/homebrew.sh
	```

- Install [everything](setup/installations.sh)

	``` bash
	$ . $df/setup/installations.sh
	```
	
- Run [custom scripts](setup/personal.sh) and reload (optional)

	``` bash
	$ setup-fzf
	$ setup-defaults
	$ reload
	```

---

`done for fun`
