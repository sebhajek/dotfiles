#!/usr/bin/env bash

cp -fu ./shell/alias/.bash_profile_odin ~/.shell/
cp -fu ./shell/alias/config_odin.fish ~/.config/fish/conf.d/

rm -rf ~/.odin
mkdir -p ~/.odin/

git clone https://github.com/odin-lang/Odin ~/.odin
sudo zypper -n in clang llvm llvm-devel
cd ~/.odin/ && make

source ~/.bashrc
~/.odin/odin version
