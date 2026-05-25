#!/bin/bash

apt-get -y install fs-uae
apt-get -y install fs-uae-launcher
apt-get -y install fs-uae-arcade

currentuser=$(users | awk '{print $1}')

mkdir -p -v /home/$currentuser/Documents/FS-UAE/Kickstarts
cp -v -f rom/* /home/$currentuser/Documents/FS-UAE/Kickstarts/

mkdir -p -v /home/$currentuser/Documents/FS-UAE/Floppies
cp -v -f adf/*.adf /home/$currentuser/Documents/FS-UAE/Floppies/

mkdir -p /home/$currentuser/Desktop/Games
cat <<'EOF'>/home/$currentuser/Desktop/Games/DeluxeGalaga.desktop
[Desktop Entry]
Type=Application
Exec=fs-uae
X-GNOME-Autostart-enabled=true
NoDisplay=false
Hidden=false
Name[en_AU]=Deluxe Galaga 2.6C
Comment[en_AU]=Commodore Amiga Emulator
X-GNOME-Autostart-Delay=0
EOF

mkdir -p /home/$currentuser/Documents/FS-UAE/Configurations
cat <<'EOF'>/home/$currentuser/Documents/FS-UAE/Configurations/Default.fs-uae
[fs-uae]
amiga_model = A1200/020
chip_memory = 2048
cpu = 68020
accuracy = 0
uae_cpu_speed = max
uae_fpu_model = 68882
jit_compiler = 1
fast_memory = 4096
slow_memory = 1536
floppy_drive_count = 1
floppy_drive_speed = 800
floppy_drive_0=Deluxe Galaga 2.6C AGA Final.adf
force_aspect = 1.7777777777777777
fullscreen mode = fullscreen
fullscreen = 1
graphics_card = uaegfx-z3
graphics_memory = 16384
kickstart_file = kick30.rom
platform = amiga
uae_floppy0type = 1
writable_floppy_images = 1
uae_sound_output = exact
uae_sound_stereo_separation = 16
zorro_iii_memory = 131072
EOF

chmod 0777 -R /home/$currentuser