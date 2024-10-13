SHELL := /bin/bash
FEDORA_VER ?= $(shell rpm -E %fedora)
FEDORA_VER ?= 40 

INSTALL_SCRIPT_DIR ?= ./new-scripts

all: neovim fastfetch

neovim:
	bash $(INSTALL_SCRIPT_DIR)/neovim.sh

fastfetch:
	bash $(INSTALL_SCRIPT_DIR)/fastfetch.sh
