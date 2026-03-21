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

- Run [the setup script](system/setup.sh) to link all configured `dot_files` 

	``` sh
	. ~/.dotfiles/system/setup.sh deploy
	```
	> override platform with explicit name argument (ie. `deploy macos`)

	> replace `deploy` with `destroy` to uninstall

- Play some music while doing all of this? (macOS only)

	``` sh
	my-radio
	```

## Step 2 [set]

- Configure and save [the custom file](custom.sh)

	``` sh
	df-edit custom
	```

- Reload shell

	``` sh
	df-reload
	```

- Set configured global git user (optional)

	``` sh
	df-gitid me --global
	```
	> check current git user with `df-gitid`

## Step 3 [go]

- Configure and save [the base file](platform/base.sh) (and/or [the platform](platform/) which extends it)

	``` sh
	df-edit base
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

