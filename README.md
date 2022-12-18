# abootpatch
Simple tool to get factory images and flash boot image to device

      #include<DISCLAIMER>
      * I am not responsible for bricked devices, dead SD cards,
      * thermonuclear war, or you getting fired because the alarm app failed. Please
      * do some research if you have any concerns. YOU are choosing to make these modifications, and if
      * you point the finger at me for messing up your device, I will laugh at you.

### Usage
    TAGS        DESCRIPTION
    -d          Download a file from given link.
                    abootpatch -d link
    -f          Flash the boot image to device.
                    abootpatch -f filename

### Dependecies:
Wget (https://archlinux.org/packages/?name=wget)<br>
Android-Tools (https://archlinux.org/packages/?name=android-tools)<br>
(!) Find your own packages for your distros.

### Installation

        sudo pacman -Sy wget android-tools
        cd Downloads && wget https://github.com/RaySlash/abootpatch/abootpatch.sh
        sudo cp ~/Downloads/abootpatch.sh /usr/local/bin/abootpatch
        sudo chmod +x /usr/local/bin/abootpatch
