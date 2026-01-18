#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Updates the /etc/os-release file to better reflect the image version
OS_RELEASE_FILE="/etc/os-release"
VARIANT=$(grep '^VARIANT=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d "'")
VERSION_ID=$(grep '^VERSION_ID=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d "'")
OSTREE_VERSION=$(grep '^OSTREE_VERSION=' "$OS_RELEASE_FILE" | cut -d'=' -f2 | tr -d "'")

# Update PRETTY_NAME and add/edit BUILD_ID
{
  sed -i.bak "s/^PRETTY_NAME=.*/PRETTY_NAME=\"Fedora Linux $VERSION_ID ($VARIANT)\"/" "$OS_RELEASE_FILE"
  # Add BUILD_ID if it doesn't exist, or update it if it does
  if grep -q '^BUILD_ID=' "$OS_RELEASE_FILE"; then
    sed -i "s/^BUILD_ID=.*/BUILD_ID=\"$OSTREE_VERSION\"/" "$OS_RELEASE_FILE"
  else
    echo "BUILD_ID=\"$OSTREE_VERSION\"" >> "$OS_RELEASE_FILE"
  fi
} 
