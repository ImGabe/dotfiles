{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # gui
    vlc
    mpv
    krita
    steam
    spotify
    spotify-tui
    sptlrx
    zathura

    ppsspp
    citra


    # online chat
    discord
    element-desktop
    tdesktop

    # dev
    obsidian
    qbittorrent

    # cli
    feh
    ffmpeg
    pulseaudio
    gnumake
    ripgrep
    lm_sensors
    maim
    xclip

    # nix
    rnix-lsp
    nixpkgs-fmt
  ];
}
