#!/usr/bin/env bash

sudo zypper -n install -tpackage --no-recommends sway-branding-upstream i3 i3status i3lock feh
sudo zypper -n install -tpackage --no-recommends dunst maim xclip rofi-wayland

mkdir -p ~/.config/i3/config.d
mkdir -p ~/.config/i3lock
cp -ur ./i3wm/* ~/.config/i3/
cp -ur ./wm/* ~/.config/i3/config.d
cp -ur ./wmlock/* ~/.config/i3lock

mkdir -p ~/.config/rofi
mkdir -p ~/.config/dusnt
cp -ur ./rofi/* ~/.config/rofi
cp -ur ./dunst/* ~/.config/dunst
