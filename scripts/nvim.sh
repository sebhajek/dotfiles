#!/usr/bin/env bash

sudo zypper -n in neovim;
mkdir -p ~/.config/nvim;
mkdir -p ~/.vim/colors;
rm -rf ~/.config/nvim/*;

cp -ru ./nvim/* ~/.config/nvim/;