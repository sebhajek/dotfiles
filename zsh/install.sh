#!/usr/bin/env bash

sudo dnf install -y zsh

if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "OMZ already installed..."
	zsh -c "$HOME/.oh-my-zsh/tools/upgrade.sh"
else
	echo "Installing OMZ..."
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

sudo usermod -s /bin/zsh $USER
cp -fu ~/.dotfiles/zsh/.zshrc ~/
