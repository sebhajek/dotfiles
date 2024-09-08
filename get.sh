#!/usr/bin/env bash

sudo dnf clean -y all ;
sudo dnf upgrade -y ;
sudo dnf install -y curl bash make ;
rm -rf ~/.dotfiles;
mkdir -p ~/.dotfiles;
git clone https://github.com/sebhajek/dotfiles.git ~/.dotfiles ;
cd ~/.dotfiles ;
make all -j3 ;