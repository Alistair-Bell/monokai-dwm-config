#!/bin/bash

# Get the fonts
if [ ! -d "ttf-mononoki" ]; then
    git clone https://aur.archlinux.org/ttf-mononoki.git
    cd ttf-mononoki
    makepkg -ci
    cd ../
fi



cd dwm
sudo make clean install
cd ../

cd st
sudo make clean install
cd ../

cd slstatus
sudo make clean install
cd ../

cp -r nvim ~/.config
