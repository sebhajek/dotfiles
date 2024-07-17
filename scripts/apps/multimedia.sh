#!/usr/bin/env bash

sudo zypper -n in imv mpv
sudo zypper -n in zathura

mkdir -p ~/.config/zathura
cp -ru ./zathura/* ~/.config/zathura
