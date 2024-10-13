#!/usr/bin/env bash

sudo dnf -y install git ninja-build cmake gcc make unzip gettext curl glibc-gconv-extra

mkdir -p ~/.build_sources
cd ~/.build_sources

if [ -d "./neovim/.git" ]; then
	echo "Repository already exists. Pulling latest changes..."
	cd ./neovim
	git pull
else
	echo "Cloning the fastfetch repository..."
	git clone https://github.com/neovim/neovim.git
	cd ./neovim
fi

make CMAKE_BUILD_TYPE=Release
sudo make install
