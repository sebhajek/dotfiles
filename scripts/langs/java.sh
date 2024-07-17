#!/usr/bin/env bash

sudo zypper -n rr https://yum.corretto.aws/x86_64;
sudo zypper -n addrepo https://yum.corretto.aws/corretto.repo; 
sudo zypper -n refresh;
sudo zypper -n in java-1.8.0-amazon-corretto-devel java-11-amazon-corretto-devel java-17-amazon-corretto-devel java-21-amazon-corretto-devel;
sudo zypper -n in maven;