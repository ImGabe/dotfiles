{ pkgs, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    imports = [
      ./modules/bash.nix
      ./modules/direnv.nix
      ./modules/fzf.nix
      ./modules/git.nix
      ./modules/vscode.nix
      ./modules/firefox
      ./modules/starship
      ./modules/nvim
      ./modules/spicetify
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
      mypaint
      feh
      chromium
      noisetorch
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
