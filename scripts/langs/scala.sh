#!/usr/bin/env bash

rm -rf ~/.scala/*
mkdir -p ~/.scala/cs/
cp -fu ./shell/alias/.sh_profile_scala ~/.shell/

cd ~/.scala/cs/
curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d >~/.scala/cs/cs && chmod +x ~/.scala/cs/cs && ~/.scala/cs/cs setup

export PATH="$PATH:/home/sebhajek/.local/share/coursier/bin"
cs install giter8
cs update g8
