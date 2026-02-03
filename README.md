# .dotfiles

**from vanilla system to infinity and beyond**

- macOS: install and run Xcode, then start Terminal app and follow instructions below
- Linux / WSL: change shell to zsh -> `chsh -s $(which zsh)`, then follow instructions below

> feel free to fork and customize for yourself

## Step 1 [ready]

- Clone this repo into your home directory

	``` sh
	cd && git clone https://github.com/tadija/.dotfiles.git
	```

- Run [the setup script](system/setup.sh) to link all `dot_files` defined in [the platform file](macos.sh)

	``` sh
	. ~/.dotfiles/system/setup.sh deploy
	```
	> replace `deploy` with `destroy` to uninstall
	
- Play some music while doing all of this? (optional)

	``` sh
	my-radio
	```

## Step 2 [set]

- Configure and save [the main config file](config/main.sh)

	``` sh
	df-edit main
	```

- Reload shell

	``` sh
	df-reload
	```

- Configure global git user (optional)

	``` sh
	df-git my --global
	```

## Step 3 [go]

- Configure and save [the platform file](macos.sh)

	``` sh
	df-edit macos
	```

- Install all the things

	``` sh
	df-install
	```
	
- Reload shell

	``` sh
	df-reload
	```

boom! that's it!

---

`done for fun`

