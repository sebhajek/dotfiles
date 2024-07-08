#!/usr/bin/env bash

sudo zypper in neovim;
mkdir -p ~/.config/nvim;
rm -rf ~/.config/nvim/*;
cp -ru ./nvim/* ~/.config/nvim/*;