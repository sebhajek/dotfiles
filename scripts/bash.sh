#!/usr/bin/env bash


sudo zypper in bash;
rm -f ~/.bashrc;
mkdir -p ~/.shell/;
cp -fu ./shell/.bashrc ~/;
cp -fu ./shell/alias/.bash_profile_bash ~/.shell;
source ~/.bashrc;