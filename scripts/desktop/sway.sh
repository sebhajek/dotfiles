#!/usr/bin/env bash

sudo zypper -n install -tpackage --no-recommends sway-branding-upstream sway swayidle swaylock swaybg swaybar
sudo zypper -n install -tpackage --no-recommends dunst grim slurp rofi-wayland

mkdir -p ~/.config/sway/config.d
mkdir -p ~/.config/swaylock
cp -ur ./sway/* ~/.config/sway/
cp -ur ./wm/* ~/.config/sway/config.d
cp -ur ./wmlock/* ~/.config/swaylock

mkdir -p ~/.config/rofi
mkdir -p ~/.config/dusnt
cp -ur ./rofi/* ~/.config/rofi
cp -ur ./dunst/* ~/.config/dunst
