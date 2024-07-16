#!/usr/bin/env bash

sudo zypper -n in fish;
mkdir -p ~/.config/fish/conf.d;
cp -rfu ./shell/fish/* ~/.config/fish/;