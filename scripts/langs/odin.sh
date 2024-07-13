#!/usr/bin/env bash

cp -fu ./shell/alias/.bash_profile_odin ~/.shell/;

rm -rf ~/.odin;
mkdir -p ~/.odin/;

git clone https://github.com/odin-lang/Odin ~/.odin;
sudo zypper in clang llvm llvm-devel;
cd ~/.odin/ && make;

source ~/.bashrc;
~/.odin/odin version;