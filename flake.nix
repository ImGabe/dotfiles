{
  description = "My personal Nix/Os configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-22.05";

    utils.url = "github:numtide/flake-utils";

    homeManager.inputs.nixpkgs.follows = "unstable";
    homeManager.url = "github:nix-community/home-manager";

    nixos-generators.inputs.nixpkgs.follows = "unstable";
    nixos-generators.url = "github:nix-community/nixos-generators";

    hardware.url = "github:nixos/nixos-hardware";
    nixColors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/nur";
  };

  outputs = { ... } @inputs:
    let prelude = import ./prelude inputs;
    in
    {
      # NixOS
      nixosConfigurations = {
        gxbe = prelude.mkSystem {
          host = "gxbe";
          system = "x86_64-linux";
          username = "gabe";

          nixosModules = [
            ./modules/meta.nix

            ./nixos/git.nix
            ./nixos/nix.nix
            ./nixos/user.nix

            ./hosts/gxbe/hardware-configuration.nix
          ];

          homeModules = [
            ./home/bash.nix
            ./home/firefox.nix
            ./home/git.nix
            ./home/gui.nix
            ./home/home.nix
            ./home/kitty.nix
            ./home/nvim.nix
            ./home/rbw.nix
            ./home/vscode.nix

            ./modules/meta.nix

            inputs.nixColors.homeManagerModule
          ];
        };

      };

      templates = import ./templates;
    };
}
