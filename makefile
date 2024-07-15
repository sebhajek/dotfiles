all: clean setup shell nvim langs fonts wezterm

setup:
	cp -fu ./lua/lib/colors.lua ./wezterm/


nvim: setup shell
	bash ./scripts/nvim.sh


wezterm: setup shell fonts
	bash ./scripts/wezterm.sh


fonts: setup shell
	bash ./scripts/fonts.sh


shell: bash fish
bash:
	bash ./scripts/bash.sh
fish:

langs: odin
odin: shell
	

clean:
	rm -f ./wezterm/colors.lua
