{ inputs
, pkgs
, ...
}:

{
  imports = [
    ./alacritty.nix
    ./calendar.nix
    ./direnv.nix
    ./firefox.nix
    ./fish.nix
    ./fuzzel.nix
    ./git.nix
    ./starship.nix
    ./sway.nix
    ./swayidle.nix
    ./swaylock.nix
    ./swaync.nix
    ./vscode.nix
    ./waybar.nix
    ./wlsunset.nix

    inputs.nur.hmModules.nur
  ];

  nixpkgs = {
    overlays = [
      inputs.alacritty-theme.overlays.default
      inputs.swayfx.overlays.insert
    ];

    config.allowUnfree = true;
  };

  home = {
    username = "gabe";
    homeDirectory = "/home/gabe";
  };

  home.packages = [
    pkgs.swayimg
    pkgs.zathura
    pkgs.swww
    pkgs.kooha
    pkgs.nwg-wrapper # funny!!
    pkgs.neovim

    pkgs.wl-clipboard
    pkgs.playerctl
    pkgs.pw-volume

    pkgs.ansifilter # for calendar

    pkgs.discord
    (pkgs.vesktop.override { withSystemVencord = false; })

    pkgs.mpv
    pkgs.stremio
    pkgs.tdesktop
    pkgs.thunderbird
    pkgs.obsidian
    pkgs.spotify
    pkgs.calibre

    # nix format and lsp server
    pkgs.nixpkgs-fmt
    pkgs.nil
    pkgs.nixd
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
