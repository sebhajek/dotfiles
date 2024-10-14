#!/usr/bin/env bash

sudo dnf install -y neovim luajit

mkdir -p ~/.config/nvim/

sudo dnf install -y npm tar
cp -ru ./nvim/* ~/.config/nvim/
rm ~/.config/nvim/install.sh
