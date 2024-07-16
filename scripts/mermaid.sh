#!/usr/bin/env bash

cp -fu ./shell/alias/.bash_profile_mermaid ~/.shell/;
cp -fu ./shell/alias/config_mermaid.fish ~/.config/fish/conf.d/;

mkdir -p ~/.mermaidjs/;
rm -rf ~/.mermaidjs/*;

cd ~/.mermaidjs/;
npm install @mermaid-js/mermaid-cli;
npm update;