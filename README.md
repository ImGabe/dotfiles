# Dotfiles

My [NixOs] and [Home Manager] dotfiles. Template from [nix-starter-configs].

![OS NixOS](https://img.shields.io/badge/os-nixos%20-%235277c3?style=flat-square&logoColor=7eb5e0)
![Shell Bash](https://img.shields.io/badge/editor-vscode-%23464748?style=flat-square)

## Desktop

- sway (swayfx): An i3-compatible tiling Wayland compositor 
  - waybar: Highly customizable Wayland bar for Sway and Wlroots based compositors
  - swayidle: Idle management daemon for Wayland
  - swaylock: Screen locker for Wayland
  - swaync: Simple notification daemon with a GUI built for Sway
  - wlsunset: Day/night gamma adjustments for Wayland
  - fuzzel: Wayland-native application launcher, similar to rofi’s drun mode 

## Technologies

- [Nix] as package manager.
- [Home Manager] to take care of my home directory on [NixOS] and non-NixOS.
- [VSCode] and [Neovim] as code editors.
- [Firefox] as browser.

## Repository structure

- `home-manager`: [Home Manager] configuration;
- `nixos`: host configuration;
- `flake.nix`: [Nix Flake] configuration.

<!-- variables -->

[nix-starter-configs]: <https://github.com/Misterio77/nix-starter-configs/>

[VSCode]: <https://vscodium.com/>
[Neovim]: <https://neovim.io/>
[Firefox]: <https://www.mozilla.org/firefox/>

[NixOS]: <https://nixos.org>
[Nix]: <https://nixos.org>
[Nix Flake]: <https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html>
[Home Manager]: <https://github.com/nix-community/home-manager/>

