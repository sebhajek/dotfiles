all: setup core langs desktop


setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/
	sudo zypper ref

clean:
	rm -f ./wezterm/color.lua
	rm -rf ./docs/out/

docs: setup
	mkdir -p ./docs/out
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/map.mmd --output ./docs/out/map.svg	
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/system.mmd --output ./docs/out/system.svg


core: shell utils ssh buildtools c
shell: bash fish

bash:
	bash ./scripts/bash.sh

fish:
	bash ./scripts/fish.sh

utils: shell
	bash ./scripts/utils.sh

ssh: utils shell
	bash ./scripts/ssh.sh

buildtools: c go python
	bash ./scripts/buildtools.sh
	bash ./scripts/libs.sh


langs: c fennel go java js lua ocaml odin pascal python scala

c:
	bash ./scripts/langs/c.sh

fennel: lua
	bash ./scripts/langs/fennel.sh

go:
	bash ./scripts/langs/go.sh

java:
	bash ./scripts/langs/java.sh

js:
	bash ./scripts/langs/js.sh

lua: c
	bash ./scripts/langs/lua.sh

ocaml: shell
	bash ./scripts/langs/ocaml.sh

odin: shell c utils
	bash ./scripts/langs/odin.sh

pascal:
	bash ./scripts/langs/pascal.sh

python:
	bash ./scripts/langs/python.sh

scala: java utils
	bash ./scripts/langs/scala.sh


env: tools devenv
tools: mermaid latex
devenv: nvim lazygit ssh

latex: utils
	bash ./scripts/tools/latex.sh

lazygit:
	bash ./scripts/devenv/lazygit.sh

mermaid: js
	bash ./scripts/tools/mermaid.sh

nvim: lua fennel buildtools utils setup
	bash ./scripts/nvim.sh


desktop: visual wm wezterm
visual: fonts wallpapers
wm: i3wm sway

fonts: utils python
	bash ./scripts/desktop/fonts.sh

i3wm: utils shell wezterm
	bash ./scripts/desktop/i3wm.sh
	bash ./scripts/desktop/i3status.sh

sway: utils shell wezterm
	bash ./scripts/desktop/sway.sh
	bash ./scripts/desktop/i3status.sh
	
wallpapers: utils
	bash ./scripts/desktop/wallpaper.sh

wezterm: fonts lua utils setup
	bash ./scripts/desktop/wezterm.sh


apps: multimedia flatpak gdbgui

flatpak:
	bash ./scripts/apps/flatpak.sh

gdbgui: browser python c
	bash ./scripts/apps/gdbgui.sh

multimedia:
	bash ./scripts/apps/multimedia.sh

browser:

