# dotfiles

My [NixOs] and [Home Manager] dotfiles.

![OS NixOS](https://img.shields.io/badge/os-nixos%20-%235277c3?style=flat-square&logoColor=7eb5e0)
![Shell Bash](https://img.shields.io/badge/editor-neovim%20|%20vscode-%23464748?style=flat-square)

## Desktop

- [gnome]: Desktop environment that aims to be simple and easy to use;
  - [kitty]: Cross-platform, fast, feature-rich, GPU based terminal;
  - [vlc]: Cross-platform media player and streaming server;
  - [rbw]: Unofficial command line client for Bitwarden.

## Technologies

- [Nix] as package manager.
- [Home Manager] to take care of my home directory on [NixOS] and non-NixOS.
- [VSCode] and [Neovim] as code editors.

## Repository structure

- `home`: [Home Manager] configuration;
- `hosts`: hosts configurations;
- `modules`: [Nix Modules];
- `overlay`: overlay for some packages;
- `templates`: [Nix Flake] templates that I use to start new projects or package
  existing ones.
  - Run `nix flake init -t github:imgabe/dotfiles#templates.<template>` to
    use the templates. See the [default.nix file](./templates/default.nix) for a
    complete list of available templates;
- `wallpapers`: my wallpaper collection.

<!-- variables -->
[gnome]: <https://wiki.gnome.org/>
[kitty]: <https://github.com/kovidgoyal/kitty>
[vlc]: <https://www.videolan.org/vlc>
[rbw]: <https://crates.io/crates/rbw>

[VsCode]: <https://code.visualstudio.com/>
[Neovim]: <https://neovim.io/>

[NixOS]: <https://nixos.org>
[Nix]: <https://nixos.org>
[Nix Overlays]: <https://nixos.wiki/wiki/Overlays>
[Nix Modules]: <https://nixos.wiki/wiki/Module>
[Nix Flake]: <https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html>
[Home Manager]: <https://github.com/nix-community/home-manager/>
