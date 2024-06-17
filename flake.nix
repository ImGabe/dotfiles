{
  description = "Dotfiles.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    # alacritty
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

    swayfx = {
      url = "github:WillPower3309/swayfx";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations."gabe@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [ ./home-manager/home.nix ];
      };

      templates = ./templates;
    };
}
