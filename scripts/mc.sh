#!/usr/bin/env bash

sudo zypper in mc;
mkdir -p ~/.config/mc;
rm -rf ~/.config/mc/*;
cp -ru ./mc/* ~/.config/mc/*;