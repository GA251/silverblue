#!/usr/bin/env bash

# Enable UUPD (Universal Update)
# Normally this is supposed to be provided by bling (https://blue-build.org/reference/modules/bling/)
# but it isn't (for now). So we install it through recipe.yml, then configure it here.

# For this script to work; 
# ublue-os-update-services must be removed and uupd must be installed through recipe.yml

# Tell this script to exit if there are any errors.
set -oue pipefail

# https://github.com/ublue-os/bazzite/blob/main/Containerfile#L504
# On an image derived from uBlue main, this is needed to remove or disable automatic updates with rpm-ostreed, which collides with UUPD
sed -i 's/stage/none/g' /etc/rpm-ostreed.conf
systemctl disable rpm-ostreed-automatic.timer

# Enable automatic updates w/ UUPD
systemctl enable uupd.timer
