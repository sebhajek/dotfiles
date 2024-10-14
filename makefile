SHELL := /bin/bash
FEDORA_VER ?= $(shell rpm -E %fedora)
FEDORA_VER ?= 40 
RHEL_VER ?= $(shell rpm -E %rhel)
RHEL_VER ?= 9 


INSTALL_SCRIPT_DIR ?= ./new-scripts


all: zsh neovim fastfetch


neovim:
	sudo dnf install -y neovim

fastfetch:
	sudo dnf install -y fastfetch

zsh:
	bash ./zsh/install.sh
