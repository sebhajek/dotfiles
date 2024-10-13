#!/usr/bin/env bash

sudo dnf install git cmake gcc g++ make

mkdir -p ~/.build_sources
cd ~/.build_sources

if [ -d "./fastfetch/.git" ]; then
	echo "Repository already exists. Pulling latest changes..."
	cd ./fastfetch
	git pull
else
	echo "Cloning the fastfetch repository..."
	git clone https://github.com/fastfetch-cli/fastfetch.git
	cd ./fastfetch
fi

mkdir -p ./build
cd ./build
cmake ..
cmake --build . --target fastfetch --target flashfetch
sudo make install
