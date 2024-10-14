SHELL := /bin/bash
FEDORA_VER ?= $(shell rpm -E %fedora)
FEDORA_VER ?= 40 
RHEL_VER ?= $(shell rpm -E %rhel)
RHEL_VER ?= 9 


INSTALL_SCRIPT_DIR ?= ./new-scripts


all: zsh bash neovim fastfetch js

c:
	bash ./languages/c.sh

js: zsh
	bash ./languages/js.sh

neovim: c js
	bash ./nvim/install.sh

fastfetch:
	sudo dnf install -y fastfetch

zsh: bash
	bash ./zsh/install.sh

bash:
	touch ~/.profile
	touch ~/.bashrc

