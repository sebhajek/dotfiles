#!/usr/bin/env bash

sudo dnf clean -y all ;
sudo dnf upgrade -y ;
sudo dnf install -y curl bash make ;
git clone https://github.com/sebhajek/dotfiles.git ~/.dotfiles ;
make all -j3 ;