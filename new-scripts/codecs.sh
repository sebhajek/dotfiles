#!/usr/bin/env bash

if [ "$DISTRO" == "F" || "$DISTRO" == "R" ]; then
	sudo dnf groupupdate -y core
	sudo dnf install -y dnf-plugins-core

	sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
	sudo dnf install -y lame* --exclude=lame-devel
	sudo dnf group upgrade -y --with-optional --allowerasing Multimedia
	sudo dnf install -y ffmpeg ffmpeg-devel

elif [ "$DISTRO" == "D" ]; then
	sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

else
	echo "codecs already installed"
fi
