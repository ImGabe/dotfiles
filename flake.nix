{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      modules = [
        { nixpkgs.overlays = [ nur.overlay ]; }
        ./configuration.nix
        ./home.nix
        home-manager.nixosModules.home-manager
      ];
      specialArgs = { inherit inputs system; };
    };
  };
}
