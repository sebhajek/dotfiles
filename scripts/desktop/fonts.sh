#!/usr/bin/env bash
sudo zypper in xorg-x11-fonts;

mkdir -p ~/.dotfiles/fonts/;
rm -rf ~/.dotfiles/fonts/;
mkdir -p ~/.dotfiles/fonts/out/bitmap;
mkdir -p ~/.dotfiles/fonts/download;
cd ~/.dotfiles/fonts/download;


# COLLECTIONS
## Codeface collection
wget https://github.com/chrissimpkins/codeface/releases/download/font-collection/codeface-fonts.zip -O collection-codeface.zip;
## URW-35 collection
wget https://github.com/ArtifexSoftware/urw-base35-fonts/archive/refs/tags/20200910.zip -O collection-urw35.zip;
## GNU Free Font collection
wget http://ftp.gnu.org/gnu/freefont/freefont-ttf.zip -O collection-gnu.zip;


# MONOSPACE

## IBM Plex Mono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/IBMPlexMono.zip -O mono-nerd-blex.zip;
## Kode Mono
wget https://github.com/isaozler/kode-mono/releases/download/1.206/kode-mono-fonts.zip -O mono-kode.zip;
## Fira Code
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -O mono-fira-code.zip;
## Julia Mono
wget https://github.com/cormullion/juliamono/releases/download/v0.056/JuliaMono-ttf.zip -O mono-julia.zip;
## JetBrains Mono
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip -O mono-jetbrains.zip;
## Victor Mono
wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip -O mono-victor.zip
## Comic Mono
wget https://dtinth.github.io/comic-mono-font/ComicMono.ttf -O mono-comic.ttf


## DISPLAY AND PRINT

## IBM Plex
wget https://github.com/IBM/plex/releases/download/v6.4.0/OpenType.zip -O family-ibm-plex.zip;
## Fira Family
wget https://github.com/mozilla/Fira/archive/refs/tags/4.202.zip -O family-fira.zip;
## maybe add noto, alegreya, volkhorn, roboto, opensans, nunito, Red hat display, Arvo, Exo, Chivo, Cardo, Old Standart, Nova/Nova Cut, acme, Gochi, Telex, Andada, Cambo, Piazolla


# BITMAP

## Eldur
wget https://github.com/molarmanful/eldur/releases/download/v0.0.2/eldur.otb -O bitmap-eldur.otp;
## Cozette
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette.otb -O bitmap-cozette.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette_hidpi.otb -O bitmap-cozette-hidpi.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/CozetteVector.otf -O bitmap-cozette-vector.otf;
## GNU Unifont
wget https://unifoundry.com/pub/unifont/unifont-15.1.05/font-builds/unifont-15.1.05.otf -O bitmap-gnu-unifont.otf;
## Maybe add blockzone...


# INSTALL
cd ~/.dotfiles/fonts/;

## BITMAPS
mv download/bitmap-eldur.otp out/bitmap/bitmap-eldur.otp;
mv download/bitmap-cozette.otp out/bitmap/bitmap-cozette.otp;
mv download/bitmap-cozette-hidpi.otp out/bitmap/bitmap-cozette-hidpi.otp;
mv download/bitmap-cozette-vector.otf out/bitmap/bitmap-cozette-vector.otf;
mv download/bitmap-gnu-unifont.otf out/bitmap/bitmap-gnu-unifont.otf;

## DISPLAY AND PRINT
cd ~/.dotfiles/fonts/download/;
7z x family-ibm-plex.zip -aoa -y;
mv OpenType/ family-ibm-plex/;
cd ~/.dotfiles/fonts/;
mv download/family-ibm-plex/ out/family-ibm-plex/;

cd ~/.dotfiles/fonts/download/;
7z x family-fira.zip -aoa -y;
mv Fira-4.202/otf/ family-fira/;
rm -rf ./Fira-4.202;
cd ~/.dotfiles/fonts/;
mv download/family-fira/ out/family-fira/;

## COLLECTIONS

## MONOSPACE


# FINISH AND REFRESH CACHE
cp -fru ~/.dotfiles/fonts/out/* ~/.local/share/fonts/;
fc-cache -fv && sudo fc-cache -f /usr/share/fonts/;


#cd ~/.dotfiles/fonts/out/;
#7z x ~/.dotfiles/fonts/ibm-plex.zip -y -aoa;
#mv ./OpenType ./ibm-plex;
#mkdir -p ~/.dotfiles/fonts/out/ibm-plex/NerdBlex;
#7z x ~/.dotfiles/fonts/nerd-blex.zip -o~/.dotfiles/fonts/out/ibm-plex/Nerd-Blex -y -aoa;

#7z x ~/.dotfiles/fonts/kode-mono.zip -y -aoa;
#mv ./ ./ibm-plex;


#cd ~/.dotfiles;
#cp -fru ~/.dotfiles/fonts/out/* ~/.local/share/fonts/;
#sudo cp -fru ~/.dotfiles/fonts/out/bitmap/* /usr/share/fonts/;
#fc-cache -fv;
#sudo fc-cache -f /usr/share/fonts/;
