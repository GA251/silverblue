# silverblue &nbsp; [![bluebuild build badge](https://github.com/ga251/silverblue/actions/workflows/build.yml/badge.svg)](https://github.com/ga251/silverblue/actions/workflows/build.yml)

A custom Fedora Silverblue Image with the following:
- UUPD for automatic updates and Bazaar in place of gnome-software
- NVIDIA-open drivers built-in
- DNS-over-TLS enabled by default
- zapret to bypass DPI inspection (**this is very specific software and its probably not useful for a lot of people!**)
- A few gnome extensions (Night Theme Switcher, AppIndicator and KStatusNotifierItem Support, Rounded Window Corners Reborn)
- fastfetch utilty built-in
- [adw-gtk3](https://github.com/lassekongo83/adw-gtk3)
- Most inbox apps moved to flatpaks

**I think that this repo is a good reference point if you're looking towards building your own bluebuild image**
**You can also take a look @ [Bluebuild Docs](https://blue-build.org/learn/getting-started/) to get started with bluebuild!**

## Installation
To rebase an existing Fedora **Silverblue** installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/ga251/silverblue:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ga251/silverblue:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

  ## Post-install:
  - You might need to configure secure boot with ```ujust enroll-secure-boot-key```
  - Because NVIDIA drivers don't support hardware decoding with firefox (by default), I recommend using Chromium based browsers or Epiphany (GNOME Web)
  - While updates are automatic and are installed after reboot without any intervention, if you need to force-update, you can run ```sudo uupd```
