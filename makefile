all: setup cli langs desktop apps docs


setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/
	sudo zypper ref

clean:
	rm -f ./wezterm/color.lua
	rm -rf ./docs/out/


cli: shell devenv tools buildtools

devenv: nvim lazygit mc
nvim: shell lua buildtools
	bash ./scripts/nvim.sh
lazygit:
	bash ./scripts/devenv/lazygit.sh
mc:
	bash ./scripts/mc.sh

buildtools: libs
	bash ./scripts/buildtools.sh
libs:
	bash ./scripts/libs.sh

shell: setup bash utils fish
bash:
	bash ./scripts/bash.sh
fish:
	bash ./scripts/fish.sh
utils:
	bash ./scripts/utils.sh	

tools: mermaid latex
mermaid: shell js
	bash ./scripts/tools/mermaid.sh
latex:
	bash ./scripts/tools/latex.sh

langs: shell c lua odin fennel python js ocaml pascal java c
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
java: utils
	bash ./scripts/langs/java.sh
scala: java utils
	bash ./scripts/langs/scala.sh
go: c
	bash ./scripts/langs/go.sh

desktop: fonts wezterm

wezterm: setup shell fonts
	bash ./scripts/desktop/wezterm.sh

fonts: setup shell python
	bash ./scripts/desktop/fonts.sh

apps: browser gdbgui multimedia
gdbgui: c python browser
	bash ./scripts/apps/gdbgui.sh
multimedia: desktop fonts
	bash ./scripts/apps/multimedia.sh
browser:


docs: setup
	mkdir -p ./docs/out
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/map.mmd --output ./docs/out/map.svg
