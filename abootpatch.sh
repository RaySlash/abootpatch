#!/bin/bash

wdir="/home/$USER/.cache/abootpatch"

helpme() {
    printf "[!]    ABOOTPATCH by RaySlash\n\
[!]    Simple shellscript to get images from dl.google.com and flash boot image to device\n\
    TAGS        DESCRIPTION\n\
    -d          Download a file from given link.\n\
                    abootpatch -d link\n\
    -f          Flash the boot image to device.\n\
                    abootpatch -f filename\n"
}

wgetme() {
    # if ! command -v wget &> /dev/null; then
    #    printf "[X] wget could not be found. Install wget and re-run."
    #    exit
    # fi
    if [-d "$wdir"]; then
        cd $wdir && wget $2
    else
        printf '[!] abootpatch working directory not found! Creating dir.\n'
        if [-d "/home/$USER/.cache"]; then
            mkdir $wdir
        else
            mkdir ~/.cache
            mkdir $wdir
        fi
        cd $wdir && wget $2
    fi
}

flash() {
    # if ! command -v adb &> /dev/null then
    #     printf "[X] android-tools could not be found. Install adb and fastboot, and re-run."
    #     exit
    # fi
    adb devices && printf '[!] Connect your phone and Authorize(10s)\n'
    sleep 11s
    adb devices > $wdir/abootpatch.log
    adb reboot bootloader && printf '[!] Waiting to connect(20s)\n'
    sleep 20s
    fastboot flash --slot=all boot $2 && printf "[!] Flash Successfull\n\
[!] Rebooting in 5s!\n"
    sleep 5s
    fastboot reboot
}

main() {
    if [[ "$1" == "-h" ]]; then
        helpme
    elif [[ "$1" == "-d" ]]; then
        wgetme
    elif [[ "$1" == "-f" ]]; then
        flash
    else
        printf "[X] Invalid command usage\n\
[X] See abootpatch -h\n"
    fi
}

main