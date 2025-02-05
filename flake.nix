{
  description = "Dotfiles.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

    nixvim.url = "github:imgabe/nixvim";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nur
    , lix-module
    , lix
    , lanzaboote
    , ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./nixos/configuration.nix

          lix-module.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
        ];
      };

      homeConfigurations."gabe@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home-manager/home.nix
          lix-module.nixosModules.default
          nur.modules.homeManager.default
        ];
      };

      templates = ./templates;
    };
}

