#!/usr/bin/env bash

mkdir -p ~/.dotfiles/fonts/
rm -rf ~/.dotfiles/fonts/
mkdir -p ~/.dotfiles/fonts/out/bitmap
mkdir -p ~/.dotfiles/fonts/download
cd ~/.dotfiles/fonts/download

# COLLECTIONS
## Codeface collection
wget https://dtinth.github.io/comic-mono-font/ComicMono.ttf -O mono-comic.ttf
wget https://github.com/chrissimpkins/codeface/releases/download/font-collection/codeface-fonts.zip -O collection-codeface.zip
## URW-35 collection
wget https://github.com/ArtifexSoftware/urw-base35-fonts/archive/refs/tags/20200910.zip -O collection-urw35.zip
## GNU Free Font collection
wget http://ftp.gnu.org/gnu/freefont/freefont-ttf.zip -O collection-gnu.zip

# MONOSPACE

## Kode Mono
wget https://github.com/isaozler/kode-mono/releases/download/1.206/kode-mono-fonts.zip -O mono-kode.zip
## Fira Code
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -O mono-fira-code.zip
## Julia Mono
wget https://github.com/cormullion/juliamono/releases/download/v0.056/JuliaMono-ttf.zip -O mono-julia.zip
## JetBrains Mono
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip -O mono-jetbrains.zip
## Victor Mono
wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip -O mono-victor.zip
## 0xProto Mono
#wget https://github.com/0xType/0xProto/releases/download/2.100/0xProto_2_100.zip -O mono-0xproto.zip;

## DISPLAY AND PRINT

## IBM Plex
wget https://github.com/IBM/plex/releases/download/v6.4.0/OpenType.zip -O family-ibm-plex.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/IBMPlexMono.zip -O mono-nerd-blex.zip
## Fira Family
wget https://github.com/mozilla/Fira/archive/refs/tags/4.202.zip -O family-fira.zip
## Apple SF Family
wget https://github.com/bradleyhodges/SFWindows/archive/refs/heads/main.zip -O family-apple-sf.zip
## maybe add noto, alegreya, volkhorn, roboto, opensans, nunito, Red hat display, Arvo, Exo, Chivo, Cardo, Old Standard, Nova/Nova Cut, acme, Gochi, Telex, Andada, Cambo, Piazolla

# BITMAP

## Eldur
wget https://github.com/molarmanful/eldur/releases/download/v0.0.2/eldur.otb -O bitmap-eldur.otp
## Cozette
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette.otb -O bitmap-cozette.otp
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette_hidpi.otb -O bitmap-cozette-hidpi.otp
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/CozetteVector.otf -O bitmap-cozette-vector.otf
## GNU Unifont
wget https://unifoundry.com/pub/unifont/unifont-15.1.05/font-builds/unifont-15.1.05.otf -O bitmap-gnu-unifont.otf
## Terminus
#wget https://files.ax86.net/terminus-ttf/files/latest.zip -O bitmap-terminus.zip;
## Maybe add blockzone...

# INSTALL
cd ~/.dotfiles/fonts/

## BITMAPS
mv download/bitmap-eldur.otp out/bitmap/bitmap-eldur.otp
mv download/bitmap-cozette.otp out/bitmap/bitmap-cozette.otp
mv download/bitmap-cozette-hidpi.otp out/bitmap/bitmap-cozette-hidpi.otp
mv download/bitmap-cozette-vector.otf out/bitmap/bitmap-cozette-vector.otf
mv download/bitmap-gnu-unifont.otf out/bitmap/bitmap-gnu-unifont.otf

## DISPLAY AND PRINT
cd ~/.dotfiles/fonts/download/
7za x family-ibm-plex.zip -aoa -y
7za x mono-nerd-blex.zip -aoa -y -omono-nerd-blex
mv OpenType/ family-ibm-plex/
mv mono-nerd-blex/ family-ibm-plex/Nerd-Mono
cd ~/.dotfiles/fonts/
mv download/family-ibm-plex/ out/family-ibm-plex/

cd ~/.dotfiles/fonts/download/
7za x family-fira.zip -aoa -y
mv Fira-4.202/otf/ family-fira/
rm -rf ./Fira-4.202
cd ~/.dotfiles/fonts/
mv download/family-fira/ out/family-fira/

cd ~/.dotfiles/fonts/download/
7za x family-apple-sf.zip -aoa -y
mkdir -p ./family-apple-sf
cp -ru ./SFWindows-main/'SF Compact'/* ./family-apple-sf/
cp -ru ./SFWindows-main/'SF Mono'/* ./family-apple-sf/
cp -ru ./SFWindows-main/'SF Pro'/* ./family-apple-sf/
cp -ru ./SFWindows-main/'New York'/* ./family-apple-sf/
rm -rf ./SFWindows-main
cd ~/.dotfiles/fonts/
mv download/family-apple-sf/ out/family-apple-sf/

## COLLECTIONS
cd ~/.dotfiles/fonts/download/
7za x collection-urw35.zip -aoa -y
mv urw-base35-fonts-20200910/fonts/ collection-urw35/
rm -rf ./urw-base35-fonts-20200910
cd ~/.dotfiles/fonts/
mv download/collection-urw35/ out/collection-urw35/

cd ~/.dotfiles/fonts/download/
7za x collection-gnu.zip -aoa -y -ocollection-gnu-temp/
mv collection-gnu-temp/sfd/ collection-gnu/
rm -rf ./collection-gnu-temp
cd ~/.dotfiles/fonts/
mv download/collection-gnu/ out/collection-gnu/

cd ~/.dotfiles/fonts/download/
7za x collection-codeface.zip -aoa -y
mv fonts/ collection-codeface/
mv mono-comic.ttf collection-codeface/comic-mono.ttf
cd ~/.dotfiles/fonts/
mv download/collection-codeface/ out/collection-codeface/

## MONOSPACE
cd ~/.dotfiles/fonts/download/
7za x mono-fira-code.zip -aoa -y -omono-fira-code-temp/
mkdir -p ~/.dotfiles/fonts/download/mono-fira-code
cp -ru mono-fira-code-temp/ttf/* mono-fira-code/
cp -ru mono-fira-code-temp/variable_ttf/* mono-fira-code/
cd ~/.dotfiles/fonts/
mv download/mono-fira-code/ out/mono-fira-code/
rm -rf ./download/mono-fira-code-temp

cd ~/.dotfiles/fonts/download/
7za x mono-jetbrains.zip -aoa -y -omono-jetbrains-temp/
mkdir -p ~/.dotfiles/fonts/download/mono-jetbrains
cp -ru mono-jetbrains-temp/fonts/ttf/* mono-jetbrains/
cp -ru mono-jetbrains-temp/fonts/variable/* mono-jetbrains/
cd ~/.dotfiles/fonts/
mv download/mono-jetbrains/ out/mono-jetbrains/
rm -rf ./download/mono-jetbrains-temp/

cd ~/.dotfiles/fonts/download/
7za x mono-julia.zip -aoa -y -omono-julia-temp/
rm -f mono-julia-temp/LICENSE
cd ~/.dotfiles/fonts/
mv download/mono-julia-temp/ out/mono-julia/

cd ~/.dotfiles/fonts/download/
7za x mono-kode.zip -aoa -y
mkdir -p ~/.dotfiles/fonts/download/mono-kode
cp -ru kode-mono-fonts/fonts/ttf/* mono-kode/
cp -ru kode-mono-fonts/fonts/variable/* mono-kode/
cd ~/.dotfiles/fonts/
mv download/mono-kode/ out/mono-kode/
rm -rf ./download/kode-mono-fonts/

cd ~/.dotfiles/fonts/download/
7za x mono-victor.zip -aoa -y -omono-victor-temp/
mkdir -p ~/.dotfiles/fonts/download/mono-victor
cp -ru mono-victor-temp/OTF/* mono-victor/
cp -ru mono-victor-temp/TTF/* mono-victor/
cd ~/.dotfiles/fonts/
mv download/mono-victor/ out/mono-victor/
rm -rf ./download/mono-victor-temp/

# FINISH AND REFRESH CACHE
mkdir -p ~/.local/share/fonts/ ;
cp -fru ~/.dotfiles/fonts/out/* ~/.local/share/fonts/ ;
fc-cache -fv && fc-cache -f ~/.local/share/fonts/ && sudo fc-cache -f /usr/share/fonts/ ;

