#!/usr/bin/env bash

sudo dnf install -y neovim luajit

mkdir -p ~/.config/nvim/
cp -ru ./nvim/* ~/.config/nvim/
rm ~/.config/nvim/install.sh
