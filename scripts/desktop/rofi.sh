#!/usr/bin/env bash

sudo zypper -n install -tpackage --no-recommends rofi-wayland

mkdir -p ~/.config/rofi/
cp -ru ./rofi/* ~/.config/rofi/
