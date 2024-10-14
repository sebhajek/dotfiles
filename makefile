SHELL := /bin/bash
FEDORA_VER ?= $(shell rpm -E %fedora)
FEDORA_VER ?= 40 
RHEL_VER ?= $(shell rpm -E %rhel)
RHEL_VER ?= 9 


INSTALL_SCRIPT_DIR ?= ./new-scripts


all: zsh bash neovim fastfetch js


js: zsh
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	nvm install --lts

neovim: js
	bash ./nvim/install.sh

fastfetch:
	sudo dnf install -y fastfetch

zsh: bash
	bash ./zsh/install.sh

bash:
	touch ~/.profile
	touch ~/.bashrc

