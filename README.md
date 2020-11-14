# AEDotFiles

**From vanilla to personalized macOS in less then 30 minutes**

> If this can help you too, then great, feel free to customize it and use for your own needs.

Install and run Xcode then start Terminal app and follow instructions:

## Step 1 [get ready]

- Clone this repo into your home directory

	``` sh
	$ git clone https://github.com/tadija/AEDotFiles.git ~/.dotfiles
	```

- Run [setup](system/setup.sh) which will make your new [.shell_file](.shell_file)

	``` sh
	$ . ~/.dotfiles/system/setup.sh
	```

- Configure [AE theme](themes/AE.terminal) for Terminal (optional)

	``` sh
	$ df-terminal AE
	```

## Step 2 [set]

- Configure and save [your config](setup/config.sh)

	``` sh
	$ df-edit config
	```
	
- Configure git user (optional)

	``` sh
	$ git-user home
	```
	
- Reload shell

	``` sh
	$ df-reload
	```

## Step 3 [go]

- Install / Update / Upgrade [Homebrew](http://brew.sh)

	``` sh
	$ df-homebrew
	```

- Install all the things from [your config](setup/config.sh)

	``` sh
	$ df-install
	```
	
- Reload shell

	``` sh
	$ df-reload
	```

---

`done for fun`
