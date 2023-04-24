# Dotfiles

My [NixOs] and [Home Manager] dotfiles. Template from [nix-starter-configs].

![OS NixOS](https://img.shields.io/badge/os-nixos%20-%235277c3?style=flat-square&logoColor=7eb5e0)
![Shell Bash](https://img.shields.io/badge/editor-vscodium-%23464748?style=flat-square)

## Desktop

- Pantheon: is the desktop environment of elementary OS. It is written in Vala, using GTK 3 and Granite.

## Technologies

- [Nix] as package manager.
- [Home Manager] to take care of my home directory on [NixOS] and non-NixOS.
- [VSCodium] and [Neovim] as code editors.
- [Firefox] as browser.

## Repository structure

- `home-manager`: [Home Manager] configuration;
- `nixos`: host configuration;
- `flake.nix`: [Nix Flake] configuration.

<!-- variables -->

[nix-starter-configs]: <https://github.com/Misterio77/nix-starter-configs/>

[VsCodium]: <https://vscodium.com/>
[Neovim]: <https://neovim.io/>
[Firefox]: <https://www.mozilla.org/firefox/>

[NixOS]: <https://nixos.org>
[Nix]: <https://nixos.org>
[Nix Flake]: <https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html>
[Home Manager]: <https://github.com/nix-community/home-manager/>
