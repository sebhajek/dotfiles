#!/usr/bin/env bash

sudo zypper in lua-fennel;
sudo zypper in libreadline8 readline-devel;
sudo zypper in libreadline6 readline6-devel;
sudo zypper in lua51-readline;

mkdir -p ~/.fennel/;
touch ~/.fennel/.fennel-history;
rm -f ~/.inputrc;
cp -fu ./fennel/.inputrc ~/;
rm -f ~/.fennelrc;
cp -fu ./fennel/.fennelrc ~/;