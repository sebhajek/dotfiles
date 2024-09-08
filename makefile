SHELL := /bin/bash

all: setup headless
	source ~/.bashrc

headless: utils shell libs langs devenv
	source ~/.bashrc


setup: clean
	cp -fu ./lua/lib/color.lua ./wezterm/ ;
	sudo dnf clean -y all ;
	sudo dnf upgrade -y ;

clean:
	rm -f ./wezterm/color.lua ;
	rm -rf ./docs/out/ ;
	sudo dnf autoremove -y ;

docs: setup
	mkdir -p ./docs/out;
	~/.mermaidjs/node_modules/.bin/mmdc --theme neutral --input ./docs/src/map.mmd --output ./docs/out/map.svg ;
	cd ./palettes && lua5.1 gen-svg.lua ;


utils: bash
	sudo dnf install -y git wget curl make tar p7zip gzip mercurial ;

libs: buildtools
	sudo dnf install -y openssl openssl-devel openssl-libs ;

buildtools: c go
	sudo dnf install -y rustup composer ;
	-rustup-init -y ;
	-rustup toolchain install stable ;

shell: bash fish
	mkdir -p ~/.shell;
	cp -fu ./shell/.profile ~/ ;
	cp -fu ./shell/alias/.sh_profile_ ~/.shell ; 
	source ~/.profile ;

bash:
	sudo dnf install -y bash ;
	mkdir -p ~/.shell/ ;
	cp -fu ./shell/.bashrc ~/ ;
	cp -fu ./shell/alias/.bash_profile_bash ~/.shell ;
	source ~/.bashrc ;

fish:
	sudo dnf install -y fish ;
	mkdir -p ~/.config/fish/conf.d ;
	cp -rfu ./shell/fish/* ~/.config/fish/ ;


langs: c lua fnl go java js ocaml odin pascal python scala

c:
	sudo dnf install -y gcc gdb make;
	sudo dnf install -y gcc-c++ gcc-fortran clang nasm;
	sudo dnf install -y valgrind;

fnl: lua
	sudo dnf install -y fennel compat-lua compat-lua-devel readline readline-devel compat-readline6 compat-readline6-devel lua-readline ;
	mkdir -p ~/.fennel/ ;
	touch ~/.fennel/.fennel-history ;
	rm -f ~/.inputrc ;
	cp -fu ./fennel/.inputrc ~/ ;
	rm -f ~/.fennelrc ;
	cp -fu ./fennel/.fennelrc ~/ ;

lua:
	sudo dnf install -y compat-lua compat-lua-devel rlwrap luajit lua lua-devel ;
	sudo dnt install -y luarocks love liblove ;

go: shell
	sudo dnf install -y golang;
	mkdir -p ~/.go;
	cp -fu ./shell/alias/.bash_profile_go ~/.shell/ ;
	cp -fu ./shell/alias/.sh_profile_go ~/.shell/ ;
	cp -fu ./shell/alias/config_go.fish ~/.config/fish/conf.d/ ;

java:
	sudo rpm --import https://yum.corretto.aws/corretto.key ;
	sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo ;
	sudo dnf install -y java-21-amazon-corretto-devel java-17-amazon-corretto-devel;
	sudo dnf install -y maven ;

js:
	sudo dnf install -y nodejs nodejs-npm ;

ocaml: shell 
	cp -fu ./shell/alias/.bash_profile_ocaml ~/.shell/ ;
	cp -fu ./shell/alias/config_ocaml.fish ~/.config/fish/conf.d/ ;
	sudo dnf install -y opam ocaml ocaml-dune ;
	-opam init -y --reinit -ni ;
	-eval $(opam env) ;
	-opam switch create 4.12.0 --yes --confirm-level=unsafe-yes;
	-eval $(opam env) ;

odin: c shell
	cp -fu ./shell/alias/.bash_profile_odin ~/.shell/ ;
	cp -fu ./shell/alias/.sh_profile_odin ~/.shell/ ;
	cp -fu ./shell/alias/config_odin.fish ~/.config/fish/conf.d/ ;
	rm -rf ~/.odin ;
	mkdir -p ~/.odin/ ;
	git clone https://github.com/odin-lang/Odin ~/.odin ;
	sudo dnf copr enable -y @fedora-llvm-team/llvm18 ;
	sudo dnf install -y llvm llvm-devel clang ;
	sudo dnf upgrade -y llvm llvm-devel clang ;
	cd ~/.odin/ && make ;
	cd ~/.odin/ && make release ;

pascal:
	sudo dnf install -y fpc fpc-doc ;
#	sudo dnf install -y lazarus-lcl ;

python: c
	sudo dnf install -y python3 python3-pip python3-userpath ;
#	python3 -m userpath append ~/.local/bin ;
	sudo dnf install -y pipx ;
	sudo dnf install -y python3-numpy python3-numpy-doc python3-pandas ;
#	sudo dnf install -y python3-scikit-image python3-scikit-learn python3-scikit-misc ;
#	sudo dnf install -y python3-notebook python3-pillow ;

scala: java shell
	rm -rf ~/.scala/*
	mkdir -p ~/.scala/cs/
	cp -fu ./shell/alias/.sh_profile_scala ~/.shell/
	cd ~/.scala/cs/
	curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d >~/.scala/cs/cs && chmod +x ~/.scala/cs/cs && ~/.scala/cs/cs setup --yes
	/home/sebhajek/.local/share/coursier/bin/cs install giter8
	/home/sebhajek/.local/share/coursier/bin/cs update g8


devenv: nvim lazygit ranger
	sudo dnf install -y htop fzf tealdeer cloc entr hyperfine jq ;

nvim: lua c
	sudo dnf install -y neovim ;
	mkdir -p ~/.config/nvim ;
	mkdir -p ~/.vim/colors ;
	rm -rf ~/.config/nvim/* ;
	cp -ru ./nvim/* ~/.config/nvim/ ;

lazygit: go
	sudo dnf copr enable -y atim/lazygit ;
	sudo dnf install -y lazygit	;
	mkdir -p ~/.config/lazygit ;
	mkdir -p ~/.config/jesseduffield/lazygit ;
	rm -rf ~/.config/lazygit/* ;
	rm -rf ~/.config/jesseduffield/lazygit/* ;
	cp -ru ./lazygit/* ~/.config/lazygit/ ;
	cp -ru ./lazygit/* ~/.config/jesseduffield/lazygit/ ;

ranger: python
	sudo dnf install -y ranger ;
	