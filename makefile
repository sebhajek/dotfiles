all: setup cli langs desktop apps docs


setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/
	sudo zypper ref

clean:
	rm -f ./wezterm/color.lua
	rm -rf ./docs/out/


cli: shell devenv tools

devenv: nvim lazygit mc
nvim: shell lua
	bash ./scripts/nvim.sh
lazygit:
	bash ./scripts/lazygit.sh
mc:
	bash ./scripts/mc.sh
	

shell: setup bash utils fish
bash:
	bash ./scripts/bash.sh
fish:
	bash ./scripts/fish.sh
utils:
	bash ./scripts/utils.sh	

tools: mermaid
mermaid: shell js
	bash ./scripts/mermaid.sh


langs: shell lua c odin fennel python js ocaml pascal
odin: setup c
	bash ./scripts/langs/odin.sh
lua: setup
	bash ./scripts/langs/lua.sh
fennel: lua setup
	bash ./scripts/langs/fennel.sh
python:
	bash ./scripts/langs/python.sh
js:
	bash ./scripts/langs/js.sh
ocaml:
	bash ./scripts/langs/ocaml.sh
c: 
	bash ./scripts/langs/c.sh
pascal: c
	bash ./scripts/langs/pascal.sh


desktop: fonts wezterm

wezterm: setup shell fonts
	bash ./scripts/desktop/wezterm.sh

fonts: setup shell
	bash ./scripts/fonts.sh

apps: gdbgui
gdbgui: c python
	bash ./scripts/apps/gdbgui.sh


docs: setup
	mkdir -p ./docs/out
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/map.mmd --output ./docs/out/map.svg
