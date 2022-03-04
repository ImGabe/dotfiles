# dotfiles

My [NixOs] and [Home Manager] dotfiles.

![OS NixOS](https://img.shields.io/badge/os-nixos%20-%235277c3?style=flat-square&logoColor=7eb5e0)
![Shell Bash](https://img.shields.io/badge/editor-neovim%20|%20vscode-%23464748?style=flat-square)

## Desktop

- [i3]: tiling window manager, completely written from scratch;
  - [compton]: A compositor for X11;
  - [dunst]: Lightweight and customizable notification daemon;
  - [kitty]: A modern, hackable, featureful, OpenGL based terminal emulator;
  - [mpv]: a free, open source, and cross-platform media player;
  - [newsboat]: A fork of Newsbeuter, an RSS/Atom feed reader for the text console;
  - [rbw]: Unofficial command line client for Bitwarden;
  - [rofi]: A window switcher, application launcher and dmenu replacement;
  - [zathura]: A highly customizable and functional PDF viewer.

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
    complete list of available templates.
- `wallpapers`: my wallpaper collection;

<!-- variables -->

[i3]: <https://i3wm.org/>

[compton]: <https://github.com/chjj/compton>
[dunst]: <https://github.com/dunst-project/dunst>
[kitty]: <https://github.com/kovidgoyal/kitty>
[kitty]: <https://github.com/kovidgoyal/kitty>
[mpv]: <https://mpv.io/>
[newsboat]:<https://newsboat.org/>
[rbw]: <https://crates.io/crates/rbw>
[rofi]: <https://github.com/davatorium/rofi>
[zathura]: <https://github.com/pwmt/zathura>

[VsCode]: <https://code.visualstudio.com/>
[Neovim]: <https://neovim.io/>

[NixOS]: <https://nixos.org>
[Nix]: <https://nixos.org>
[Nix Overlays]: <https://nixos.wiki/wiki/Overlays>
[Nix Modules]: <https://nixos.wiki/wiki/Module>
[Nix Flake]: <https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html>
[Home Manager]: <https://github.com/nix-community/home-manager/>
