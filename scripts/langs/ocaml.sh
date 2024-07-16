#!/usr/bin/env bash

sudo zypper -n in opam;

opam init -y;
cp -fu ./shell/alias/.bash_profile_ocaml ~/.shell/;

opam install dune;
opam install odoc ocamlformat utop;
