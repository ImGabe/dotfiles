{ pkgs, inputs, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    imports = [
      ./home/bash.nix
      ./home/chrome.nix
      ./home/email.nix
      ./home/firefox.nix
      ./home/git.nix
      ./home/i3.nix
      ./home/kitty.nix
      ./home/newsboat.nix
      ./home/nvim.nix
      ./home/rbw.nix
      ./home/starship.nix
      ./home/vscode.nix
      ./modules/meta.nix

      inputs.nix-colors.homeManagerModule
    ];

    colorscheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-medium;

    programs.home-manager.enable = true;

    home.username = "gabe";
    home.homeDirectory = "/home/gabe";
    home.packages = with pkgs; [
      # gui
      vlc
      mpv
      krita
      steam
      spotify
      zathura

      # online chat
      discord

      # dev
      tdesktop
      obsidian
      qbittorrent

      # cli
      feh
      bottom
      ffmpeg
      pulseaudio
      gnumake
      lm_sensors
      maim
      xclip

      # nix
      rnix-lsp
      nixpkgs-fmt
    ];

    home.sessionVariables = {
      VISUAL = "nvim";
      EDITOR = "nvim";
    };

    home.stateVersion = "21.05";
  };
}
