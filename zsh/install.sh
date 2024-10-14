#!/usr/bin/env bash

sudo dnf install -y zsh

if [ -d "~/.oh-my-zsh" ]; then
	echo "OMZ already installed..."
	zsh -c "omz update"
else
	echo "Installing OMZ..."
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
