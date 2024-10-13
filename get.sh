#!/usr/bin/env bash

if cat /etc/*-release | grep -iq "Rocky"; then
	echo "Rocky detected"
	sudo dnf config-manager --set-enabled crb
	sudo dnf install -y epel-release
	sudo dnf config-manager --set-enabled plus
elif cat /etc/*-release | grep -iq "Fedora"; then
	echo "Fedora detected"
else
	echo "Unsupported OS"
	exit 1
fi

sudo dnf clean -y all
sudo dnf upgrade -y

sudo dnf install -y curl bash make git

mkdir -p ~/.dotfiles

if [ -d "~/.dotfiles/.git" ]; then
	echo "Repository already exists. Pulling latest changes..."
	cd ~/.dotfiles
	git fetch
	git checkout python-rewrite
	git pull origin python-rewrite
else
	echo "Cloning the repository..."
	git clone --branch python-rewrite https://github.com/sebhajek/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles
fi

make all
