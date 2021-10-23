{ pkgs, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    imports = [
      ../../pkgs/bash.nix
      ../../pkgs/direnv.nix
      ../../pkgs/fzf.nix
      ../../pkgs/git.nix
      ../../pkgs/vscode.nix
      ../../pkgs/firefox
      ../../pkgs/starship
      ../../pkgs/nvim
      # ../../pkgs/spicetify
    ];

    programs.home-manager.enable = true;

    home.username = "gabe";
    home.homeDirectory = "/home/gabe";
    home.packages = with pkgs; [
      steam
      tdesktop
      discord
      obsidian
      ffmpeg
      qbittorrent
      krita
      insomnia
      ranger
      vlc
      git
      feh
      spotify
      chromium
      nixpkgs-fmt
    ];

    home.file.".config/direnv/lib/use_flake.sh".text = ''
      use_flake() {
        watch_file flake.nix
        watch_file flake.lock
        eval "$(nix print-dev-env --profile "$(direnv_layout_dir)/flake-profile")"
      }
    '';

    home.stateVersion = "21.05";
  };
}
