{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    home-manager.url = "github:nix-community/home-manager/release-21.05";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, home-manager, nur, nixpkgs, ... }@inputs: {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [
          {
            nixpkgs.overlays = [
              nur.overlay
            ];
          }

          ./configuration.nix
          ./home-manager/home.nix

          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit inputs system; };
      };
    };
}
