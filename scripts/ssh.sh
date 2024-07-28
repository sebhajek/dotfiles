#!/usr/bin/env bash

mkdir -p ~/.ssh/
cp -fu ./shell/alias/.bash_profile_ssh ~/.shell/

cd ~/.ssh/
ssh-keygen -t ed25519 -C "git" -f git-key -P ""
ssh-add ~/.ssh/git-key
