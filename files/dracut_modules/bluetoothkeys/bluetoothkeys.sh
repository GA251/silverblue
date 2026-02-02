#!/bin/sh
#/boot/_bluetooth/[bluetooth dongle mac]/[bluetooth keyboard mac]/info
#don't want initramfs to choke if the keys arent copied yet
if [ -d "/boot/_bluetooth" ]; then
  cp -R /boot/_bluetooth/* /var/lib/bluetooth/
fi
