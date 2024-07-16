all: setup cli langs desktop docs


setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/

clean:
	rm -f ./wezterm/color.lua
	rm -rf ./docs/out/


cli: shell devenv tools

devenv: nvim lazygit mc
nvim: shell
	bash ./scripts/nvim.sh
lazygit:
	bash ./scripts/lazygit.sh
mc:
	bash ./scripts/mc.sh
	

shell: bash fish
bash:
	bash ./scripts/bash.sh
fish:

tools: mermaid
mermaid: setup shell langs
	bash ./scripts/mermaid.sh


langs: shell odin lua fennel python
odin: setup
	bash ./scripts/langs/odin.sh
lua: setup
	bash ./scripts/langs/lua.sh
fennel: lua setup
	bash ./scripts/langs/fennel.sh
python:
	bash ./scripts/langs/python.sh

desktop: fonts wezterm

wezterm: setup shell fonts
	bash ./scripts/wezterm.sh

fonts: setup shell
	bash ./scripts/fonts.sh


docs: setup
	mkdir -p ./docs/out
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/map.mmd --output ./docs/out/map.svg
	

