#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install --lts

VERSION=$(ls -1 "$HOME/.nvm/versions/node/" | sort -V | tail -n 1)
NVM_PATH_LINE="export PATH=\"$HOME/.nvm/versions/node/$VERSION/bin:\$PATH\""

if ! grep -q 'export PATH="$HOME/.nvm/versions/node/v[0-9]\+\.[0-9]\+\.[0-9]\+/bin' "$HOME/.profile"; then
	echo "$NVM_PATH_LINE" >>"$HOME/.profile"
	echo "Added Node.js version $VERSION to ~/.profile"
else
	echo "A Node.js version is already in the PATH in ~/.profile"
fi

if ! grep -q 'export PATH="$HOME/.nvm/versions/node/v[0-9]\+\.[0-9]\+\.[0-9]\+/bin' "$HOME/.bashrc"; then
	echo "$NVM_PATH_LINE" >>"$HOME/.profile"
	echo "Added Node.js version $VERSION to ~/.bashrc"
else
	echo "A Node.js version is already in the PATH in ~/.bashrc"
fi

if ! grep -q 'export PATH="$HOME/.nvm/versions/node/v[0-9]\+\.[0-9]\+\.[0-9]\+/bin' "$HOME/.zshrc"; then
	echo "$NVM_PATH_LINE" >>"$HOME/.zshrc"
	echo "Added Node.js version $VERSION to ~/.zshrc"
else
	echo "A Node.js version is already in the PATH in ~/.zshrc"
fi
