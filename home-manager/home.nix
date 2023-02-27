{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./git.nix
    ./nvim.nix
    ./vscodium.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "gabe";
    homeDirectory = "/home/gabe";
  };

  home.packages = with pkgs; [
    discord
    spotify
    nixpkgs-fmt
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
} 
