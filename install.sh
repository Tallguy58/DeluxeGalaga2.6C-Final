#!/bin/bash

apt-get -y install fs-uae
apt-get -y install fs-uae-launcher
apt-get -y install fs-uae-arcade

currentuser=$(users | awk '{print $1}')

mkdir -p -v /home/$currentuser/Documents/FS-UAE/Configurations
cp -v -f configs/*.fs-uae /home/$currentuser/Documents/FS-UAE/Configurations/

mkdir -p -v /home/$currentuser/Documents/FS-UAE/Kickstarts
cp -v -f rom/* /home/$currentuser/Documents/FS-UAE/Kickstarts/

mkdir -p -v /home/$currentuser/Documents/FS-UAE/Floppies
cp -v -f adf/*.adf /home/$currentuser/Documents/FS-UAE/Floppies/

## Create Shortcuts
mkdir -p /home/$currentuser/Desktop/Games
echo -e '[Desktop Entry]'>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'Type=Application'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'Exec=fs-uae'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'X-GNOME-Autostart-enabled=true'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'NoDisplay=false'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'Hidden=false'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'Name[en_AU]=Deluxe Galaga 2.6C'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'Comment[en_AU]=Commodore Amiga Emulator'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
echo -e 'X-GNOME-Autostart-Delay=0'>>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop

chmod 0777 -R /home/$currentuser
