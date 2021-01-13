#!/bin/bash
userHome="/home/$(whoami)"
nvimPath="$userHome/.config/nvim"
archivePath="$userHome/.config/archives"
currentPath=$(pwd)

function MakeCleanInstall() { # list of folders
    for i in "$@"
    do
        cd $i 
        sudo make clean install
        cd ../
    done
}

function ArchiveConfigFolder() { # root folder path, list of folders
    # Change to archive directory
    cd $archivePath 

    # Output folder uses unix timestamp
    outputFolder=$(date +%s)
    mkdir $outputFolder

    for i in "$@"
    do
        configFolder="$1/$i"
        echo $configFolder
        if [ -d $configFolder ]; then
            cp -rf $configFolder $archivePath
            tar -czvf $outputFolder/$i.tar.gz $configFolder
            rm -r $archivePath/$i
        fi
    done
}

# Users may have custom home dir, use the first arg for the home directory
if [ "$#" -ge 1 ]; then
    userHome=$1
fi

# Get the fonts
if [ ! -d "ttf-mononoki" ]; then
    git clone https://aur.archlinux.org/ttf-mononoki.git
    cd ttf-mononoki
    makepkg -sci # ence - get it science, haha
    cd ../
fi

if [ ! -d "$archivePath" ]; then
    # Make archive folder for storage
    mkdir $archivePath
fi

rm -r $archivePath/*
ArchiveConfigFolder "$userHome/.config" "nvim" 


# Reset directory to build the configs
cd $currentPath

# Build the stuff
MakeCleanInstall dwm st slstatus
