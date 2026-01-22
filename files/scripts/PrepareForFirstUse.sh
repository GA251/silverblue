#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Removes unneeded toolbox stuff since it's already removed in recipe.yml
rm -f /etc/profile.d/toolbox.sh

# Enables font stemming (https://blog.aktsbot.in/no-more-blurry-fonts.html)
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' >> /etc/environment

# TEMP!!!!
# PLEASE REMOVE THIS AFTER THIS IS FIXED:
# https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/issues/34
# Downgrades wireplumber to v0.5.12-1 until gnome stops crashing the second it switches to a bluetooth device
current_date=$(date +%Y%m%d)
cutoff_date="20260206" # 06.02.2026 (DD/MM/YYYY)
if [ "$current_date" -lt "$cutoff_date" ]; then
    echo "Current date is before $cutoff_date. Downgrading wireplumber as a temp fix..."
    echo "See https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/issues/34 for more info"
    dnf downgrade -y wireplumber-0.5.12-1.fc43
else
    echo "Current date is after $cutoff_date and the wireplumber downgrade will not occur."
    echo "https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/issues/34"
    echo "If the issue above is fixed by GNOME, please remove me from the file below:"
    echo "https://github.com/GA251/silverblue/blob/main/files/scripts/PrepareForFirstUse.sh#L12"
fi
