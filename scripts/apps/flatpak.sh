#!/usr/bin/env bash

sudo zypper -n install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo flatpak install --assumeyes --noninteractive flathub com.github.xournalpp.xournalpp

sudo flatpak install --assumeyes --noninteractive flathub com.orama_interactive.Pixelorama
sudo flatpak install --assumeyes --noninteractive flathub org.kde.krita

sudo flatpak install --assumeyes --noninteractive flathub org.gimp.GIMP
sudo flatpak install --assumeyes --noninteractive flathub org.inkscape.Inkscape

sudo flatpak update --assumeyes --noninteractive
