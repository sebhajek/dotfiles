all: setup shell nvim langs fonts wezterm

setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/


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
	bash ./scripts/langs/odin.sh

clean:
	rm -f ./wezterm/color.lua
