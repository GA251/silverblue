#!/bin/sh

check() {
  return 0
}

depends() {
  # This module obviously requires the bluetooth module
  # the bluetooth module also has its own requirements but dracut loads them anyway
  # I include numlock because I needed it anyway
  echo bluetooth numlock
  return 0
}

install() {
  inst_hook pre-udev 50 "$moddir/bluetoothkeys.sh"
}
