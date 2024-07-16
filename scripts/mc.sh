#!/usr/bin/env bash

sudo zypper -n in mc;
mkdir -p ~/.config/mc;
rm -rf ~/.config/mc/*;
cp -ru ./mc/* ~/.config/mc/;