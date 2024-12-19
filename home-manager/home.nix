{ inputs, pkgs, ... }:

{
  imports = [
    # ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    # ./emacs.nix
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./vscode.nix
    ./rio.nix

    inputs.nur.hmModules.nur
  ];

  nixpkgs = {
    overlays = [ ];
    config.allowUnfree = true;
  };

  home = {
    username = "gabe";
    homeDirectory = "/home/gabe";
  };

  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default

    # IDEs
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.pycharm-professional

    # desktop
    pkgs.discord
    pkgs.vesktop

    pkgs.tdesktop
    pkgs.obsidian
    pkgs.spotify
    pkgs.thunderbird
    pkgs.calibre
    pkgs.insomnia
    pkgs.libreoffice

    # media
    pkgs.stremio
    pkgs.ffmpeg
    pkgs.vlc
    pkgs.mpv
    pkgs.imagemagick

    # gnome apps
    pkgs.eyedropper
    pkgs.newsflash
    pkgs.gnome-podcasts

    # games
    pkgs.prismlauncher

    # redes
    pkgs.tailscale

    # commands/utils
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.zola

    # passwords
    pkgs.bitwarden
    pkgs.bitwarden-cli

    # nix things
    pkgs.nixpkgs-fmt
    pkgs.nil
    pkgs.nixd
    pkgs.devenv
    pkgs.nix-search-cli
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.material-cursors;
    name = "material_cursors";
    size = 24;
  };

  home.keyboard = {
    layout = "br";
    variant = "abnt2";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
