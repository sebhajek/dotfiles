#!/usr/bin/env bash

cp -fu ./shell/alias/.bash_profile_mermaid ~/.shell/;

mkdir -p ~/.mermaidjs/;
rm -rf ~/.mermaidjs/*;

cd ~/.mermaidjs/;
npm install @mermaid-js/mermaid-cli;
npm update;