#!/usr/bin/env bash

# WARNING!
# ujust configure-nvidia still needs to be run to configure the NVIDIA drivers and to enable the firefox flatpak to access the libva driver

# Tell this script to exit if there are any errors.
set -oue pipefail

echo "LIBVA_DRIVER_NAME=nvidia" >> /etc/environment
echo "CUDA_DISABLE_PERF_BOOST=1" >> /etc/environment
