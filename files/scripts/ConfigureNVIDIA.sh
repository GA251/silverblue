#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Configure libva-nvidia-driver, an addon used to enable accelerated video decoding on firefox
# Because NVIDIA couldn't be bothered to support it
echo 'LIBVA_DRIVER_NAME=nvidia' >> /etc/environment
echo 'CUDA_DISABLE_PERF_BOOST=1' >> /etc/environment
