{ pkgs, ... }:

{
  imports = [
    ../../pkgs/git.nix
    ../../pkgs/vscode.nix
    ../../pkgs/firefox
  ];

  home.packages = with pkgs; [
    # GUI
    discord # messager
    spotify # music streaming

    # CLI
    file # Shows info about files
    neofetch # Shows system information
    pfetch # Smaller neofetch
    nixpkgs-fmt # Format nix files
    ffmpeg

    # Fonts
    hasklig
    (nerdfonts.override { fonts = [ "Hasklig" ]; })
  ];

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
