#!/bin/zsh

if ! command -v brew &> /dev/null
then
	echo "Homebrew is not installed. Installing now..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	exit
else
	echo "Homebrew found. Updating/Upgrading now..."
	brew update && brew upgrade
	exit
fi

if ! command -v git &> /dev/null
then
	echo "Git is not installed. Installing now..."
	brew install git
	exit
else
	echo "Git found. Skipping install."
	exit
fi

if ! command -v nvim &> /dev/null
then
	echo "Neovim is not installed. Installing now..."
	brew install neovim
	exit
else
	echo "Neovim found. Skipping install."
	exit
fi

