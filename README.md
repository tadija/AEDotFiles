# AESetupOSX
**From vanilla to personalized OSX in less then 30 minutes**

> I'm done with manually configuring everything after clean installation of OSX. If this can help you too, then great, feel free to customize it and use for your own needs.

All you need to do is to clone this repository on your machine and execute these bash scripts, one by one.  
But first, you need to know what each script does, so you can decide which ones to actually edit or execute.

## 00.Config.sh

This is where you setup what are all the things that you want to install automatically.  
You'll notice that things are divided into sections: **binaries**, **apps**, **quicklook plugins**, **fonts** and **atom packages**.  
You just need to delete ones you don't need, and type in the ones you do.

## 01.Terminal.sh

This one loads `.bash_profile` from this repo and installs great [Piperita theme](https://github.com/jacobtomlinson/terminal-piperita) for Terminal.

## 02.Homebrew.sh

This one installs the legendary [Homebrew](http://brew.sh) - The missing package manager for OS X

## 03.Binaries.sh

This one installs all the **binaries** you set in `00.Config.sh`.  
Particullary important one is awesome [brew-cask](https://github.com/caskroom/homebrew-cask), that will install your apps later on.

## 04.Apps.sh

This one installs all the **apps**, **quicklook plugins**, **fonts** and **atom packages** you set in `00.Config.sh`.

## 05.System.sh

This is where 'custom' begins. It's generally for configuring some system settings. Unfortunatelly I didn't have time to look for all the commands and automate everything, so I left comments for myself what I need to setup manually.

## 06.Custom.sh

This one is completely random and customized for me. You shouldn't even look at it.

`done for fun`
