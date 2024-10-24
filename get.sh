#!/usr/bin/env bash

# sudo dnf in curl bash; curl -L https://raw.githubusercontent.com/sebhajek/dotfiles/main/get.sh | bash
# sudo apt-get install curl bash; curl -L https://raw.githubusercontent.com/sebhajek/dotfiles/main/get.sh | bash
#

pull-the-main-repo() {
	mkdir -p ~/.dotfiles

	if [ -d "$HOME/.dotfiles/.git" ]; then
		echo "Repository already exists. Pulling latest changes..."
		cd "$HOME/.dotfiles"
		git fetch
		git checkout python-rewrite
		git pull
	else
		echo "Cloning the repository..."
		git clone --branch python-rewrite https://github.com/sebhajek/dotfiles.git "$HOME/.dotfiles"
		cd "$HOME/.dotfiles"
	fi
}

if cat /etc/*-release | grep -iq "Rocky"; then
	echo "Rocky detected"

	sudo dnf config-manager --set-enabled crb
	sudo dnf install -y epel-release
	sudo dnf config-manager --set-enabled plus

	sudo dnf install -y --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm

	sudo dnf clean -y all
	sudo dnf upgrade -y

	sudo dnf install -y curl bash make git

	pull-the-main-repo
elif cat /etc/*-release | grep -iq "Fedora"; then
	echo "Fedora detected"

	sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	sudo dnf config-manager --enable fedora-cisco-openh264

	sudo dnf clean -y all
	sudo dnf upgrade -y

	sudo dnf install -y curl bash make git

	pull-the-main-repo
elif cat /etc/*-release | grep -iq "Debian"; then
	echo "Debian detected"
	# Upon first login as root and run:
	# su -
	# apt-get install sudo
	# usermod -aG sudo <username>

	sudo apt-get clean
	sudo apt-get update

	sudo apt-get install curl bash make git

	pull-the-main-repo
else
	echo "Unsupported OS"
	exit 1
fi

pull-the-main-repo() {
	mkdir -p ~/.dotfiles

	if [ -d "$HOME/.dotfiles/.git" ]; then
		echo "Repository already exists. Pulling latest changes..."
		cd "$HOME/.dotfiles"
		git fetch
		git checkout python-rewrite
		git pull
	else
		echo "Cloning the repository..."
		git clone --branch python-rewrite https://github.com/sebhajek/dotfiles.git "$HOME/.dotfiles"
		cd "$HOME/.dotfiles"
	fi
}
