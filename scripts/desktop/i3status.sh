#!/usr/bin/env bash

sudo zypper -n install -tpackage --no-recommends i3status

mkdir -p ~/.config/i3status
cp -ur ./i3status/* ~/.config/i3status/