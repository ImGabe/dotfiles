{
  description = "My NixOS configuration";

  inputs = {
    # Utilities for building flakes
    utils.url = "github:numtide/flake-utils";

    # Core nix flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # hardware.url = "github:nixos/nixos-hardware";

    # Home manager flake
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Extra community flakes
    nix-colors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/nur";
  };

  outputs =
    { self
    , home-manager
    , nixpkgs
    , nur
    , nix-colors
    , ...
    }@inputs: {
      # NixOS
      nixosConfigurations = {
        # Desktop
        desktop = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          modules = [
            { nixpkgs.overlays = [ nur.overlay (import ./overlay) ]; }

            ./hosts/nixos/configuration.nix
            ./home.nix

            home-manager.nixosModules.home-manager
          ];
          specialArgs = { inherit inputs system; };
        };
      };

      templates = import ./templates;
    };
}
