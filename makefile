all: setup shell nvim langs lazygit fonts wezterm docs

setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/


nvim: setup shell
	bash ./scripts/nvim.sh


wezterm: setup shell fonts
	bash ./scripts/wezterm.sh


fonts: setup shell
	bash ./scripts/fonts.sh

lazygit: setup
	bash ./scripts/lazygit.sh

shell: bash fish
bash:
	bash ./scripts/bash.sh
fish:

langs: odin
odin: shell
	bash ./scripts/langs/odin.sh


mermaid: shell setup
	bash ./scripts/mermaid.sh


docs: setup
	mkdir -p ./docs/out
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/map.mmd --output ./docs/out/map.svg

clean:
	rm -f ./wezterm/color.lua
	rm -rf ./docs/out/