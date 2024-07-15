#!/usr/bin/env bash

sudo zypper in lazygit;
mkdir -p ~/.config/lazygit;
mkdir -p ~/.config/jesseduffield/lazygit;
rm -rf ~/.config/lazygit/*;
rm -rf ~/.config/jesseduffield/lazygit/*;
cp -ru ./lazygit/* ~/.config/lazygit/;
cp -ru ./lazygit/* ~/.config/jesseduffield/lazygit/;