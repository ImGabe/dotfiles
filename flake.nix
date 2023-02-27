{
  description = "Dotfiles.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix User Repository
    nur.url = github:nix-community/NUR;

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { nixpkgs, home-manager, nur, hardware, ... }@inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#nixos'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix

          hardware.nixosModules.common-cpu-amd
          hardware.nixosModules.common-gpu-amd
          hardware.nixosModules.common-pc-ssd
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#gabe@nixos'
    homeConfigurations = {
      "gabe@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules =
          [
            ./home-manager/home.nix

            { imports = [ inputs.nur.hmModules.nur ]; }
          ];
      };
    };
  };
}
