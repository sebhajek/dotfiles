#!/usr/bin/env bash


cp -fu ./shell/alias/.bash_profile_ocaml ~/.shell/;
cp -fu ./shell/alias/config_ocaml.fish ~/config/fish/conf.d/;


sudo zypper -n in opam ocaml;
sudo zypper -n in ocaml-dune ocaml-ocamlbuild;

opam init -y --reinit -ni;
source ~/.bashrc;

eval `opam env`;
opam switch create 4.10.0;
eval $(opam env);
opam install -y  --restore dune;
eval $(opam env);
opam install -y --restore ocamlformat utop;

eval $(opam env);
source ~/.bashrc;
