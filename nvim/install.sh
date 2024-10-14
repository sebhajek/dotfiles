#!/usr/bin/env bash

sudo dnf install -y neovim luajit

mkdir -p ~/.config/nvim/

sudo dnf install -y tar libtree-sitter libtree-sitter-devel

cp -ru ./nvim/* ~/.config/nvim/
rm ~/.config/nvim/install.sh
