{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    # ./emacs.nix
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./starship.nix
    ./vscode.nix
    # ./rio.nix
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
    # pkgs.nixvim
    pkgs.chromium

    # secure boot
    pkgs.sbctl

    # IDEs
    pkgs.jetbrains.idea-ultimate
    pkgs.android-studio

    # desktop
    pkgs.discord
    pkgs.vesktop

    pkgs.tdesktop
    pkgs.obsidian
    pkgs.spotify
    pkgs.thunderbird
    # pkgs.calibre
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
    pkgs.nixfmt-rfc-style
    pkgs.nil
    pkgs.nixd
    pkgs.nix-search-cli

    pkgs.devenv
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
