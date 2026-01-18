#!/usr/bin/env bash

# Enable zapret, a DPI bypass tool.
# more info available @ https://github.com/bol-van/zapret/blob/master/docs/readme.en.md

# For this script to work; 
# zapret must be installed through the terra repo
# a config file must be installed at /etc/zapret/config
# DNS-over-TLS must be enabled through systemd-resolved

# Tell this script to exit if there are any errors.
set -oue pipefail

systemctl enable zapret.service
