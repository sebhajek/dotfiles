#!/usr/bin/env bash

sudo zypper -n in python311;
sudo zypper -n in python311-pip python311-jupyter;
sudo zypper -n in python311-pipx;
python3 -m userpath append ~/.local/bin;
sudo zypper -n in python311-numpy python311-pandas python311-pandas-all python311-Pillow;
sudo zypper -n in python311-scikit-build python311-scikit-build-core python311-scikit-build-core-pyproject python311-scikit-dsp-comm python311-scikit-hep-testdata python311-scikit-image python311-scikit-learn python311-scikit-sound python311-scikit-sparse;