#!/usr/bin/env bash

sudo zypper in wezterm;
mkdir -p ~/.config/wezterm;
rm -rf ~/.config/wezterm/*;
cp -ru ./wezterm/* ~/.config/wezterm/;