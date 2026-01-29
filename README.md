# [![bluebuild build badge](https://github.com/ga251/silverblue/actions/workflows/build.yml/badge.svg)](https://github.com/ga251/silverblue/actions/workflows/build.yml)<br>A rock solid immutable linux image based on Universal Blue
Includes:
- The reliability of Fedora Silverblue and UniversalBlue's images
- UUPD for automatic updates and Bazaar as an app store
- Open NVIDIA kernel modules built-in
- DNS-over-TLS enabled by default for secure connections to the internet
- zapret to bypass DPI (**Disabled by default**)
- A few gnome extensions (Night Theme Switcher, AppIndicator and KStatusNotifierItem Support, Rounded Window Corners Reborn)
- fastfetch utilty built-in
- [adw-gtk3](https://github.com/lassekongo83/adw-gtk3)
- Most inbox apps moved to flatpaks

It is essentially Linux with the reliability and automatic upgrades of a Chromebook.

**Take a look @ [Bluebuild Docs](https://blue-build.org/learn/getting-started/) to get started with bluebuild's image creator!**

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
- New builds are made every day, and your system will automatically upgrade to them as they come.

## Post-install:
  - You should configure secure boot with ```ujust enroll-secure-boot-key```
  - Because NVIDIA drivers don't support hardware decoding with firefox (by default), I recommend using Chromium based browsers or Epiphany (GNOME Web)
  - While updates are automatic and are installed after reboot without any intervention, if you need to force-update, you can run ```sudo uupd```
