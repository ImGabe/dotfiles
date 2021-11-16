# dotfiles

My NixOs and Home-Manager dotfiles.

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## Desktops

- [Berry]: healthy, byte-sized window manager written in C for unix systems;
  - [alacritty]: A cross-platform, OpenGL terminal emulator;
  - [dunst]: Lightweight and customizable notification daemon;
  - [lemonbar]: A featherweight, lemon-scented, bar based on xcb;
  - [sxhkd]: Simple X hotkey daemon.
- [i3]: tiling window manager, completely written from scratch;
  - [alacritty]: A cross-platform, OpenGL terminal emulator;
  - [dunst]: Lightweight and customizable notification daemon;
  - [polybar]: A fast and easy-to-use status bar;
  - [rofi]: A window switcher, application launcher and dmenu replacement;
  - [compton]: A compositor for X11.

## Technologies

- [Nix] as package manager.
- [Home Manager] to take care of my home directory on [NixOS] and non-NixOS.
- [VSCode](https://code.visualstudio.com/) and [Neovim](https://neovim.io/) as code
  editors.

## Repository structure

- `desktop`: DE and WM options;
- `hosts`: hosts configurations;
- `pkgs`: packages used in the system;
- `templates`: [Nix Flake] templates that I use to start new projects or package
  existing ones.
  - Run `nix flake init -t github:imgabe/dotfiles#templates.<template>` to
    use the templates. See the [default.nix file](./templates/default.nix) for a
    complete list of available templates.

[NixOS]: https://nixos.org
[Nix]: https://nixos.org
[Home Manager]: https://github.com/nix-community/home-manager/
[Nix Flake]: https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html

[Berry]: https://berrywm.org/
[i3]: https://i3wm.org/

[alacritty]: https://github.com/alacritty/alacritty
[dunst]: https://github.com/dunst-project/dunst
[lemonbar]: https://github.com/LemonBoy/bar
[sxhkd]: https://github.com/baskerville/sxhkd
[polybar]: https://github.com/polybar/polybar
[rofi]: https://github.com/davatorium/rofi
[compton]: https://github.com/chjj/compton
