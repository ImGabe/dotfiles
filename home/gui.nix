{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # gui
    vlc
    spotify

    # online chat
    discord
    tdesktop

    # dev
    obsidian
    qbittorrent

    # cli
    ffmpeg
    pulseaudio
    gnumake
    ripgrep
    lm_sensors

    # nix
    rnix-lsp
    nixpkgs-fmt
  ];
}
