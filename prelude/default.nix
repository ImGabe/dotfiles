inputs:

let
  lib = inputs.nixpkgs.lib;
in
rec  {
  mkNixpkgs =
    { nixpkgs ? inputs.unstable
    , system
    }:
    import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.nur.overlay
        (import ../overlay)
      ];
    };

  # NixOs System
  mkSystem =
    { host
    , username
    , system ? "x86_64-linux"
    , nixosModules ? [ ]
    , homeModules ? [ ]
    , nixpkgs ? inputs.unstable
    }:
    let
      pkgs = mkNixpkgs { inherit nixpkgs system; };
    in
    nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit pkgs inputs system nixpkgs;
        inherit (inputs) homeManager nur hardware;
      };

      modules =
        nixosModules ++
        [
          # host configuration
          ../hosts/${host}

          # home manager
          inputs.homeManager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;

              users."${username}" = {
                imports = homeModules;
              };

              extraSpecialArgs = {
                inherit inputs pkgs nixpkgs username;
              };
            };
          }
        ];
    };

  # Emulator
  mkEmulator =
    { host
    , system
    , format
    , emulatorModules ? [ ]
    , nixpkgs ? inputs.unstable
    }:
    let
      pkgs = mkNixpkgs { inherit nixpkgs system; };
    in
    inputs.nixos-generators.nixosGenerate {
      inherit nixpkgs system;

      pkgs = pkgs;
      modules = emulatorModules ++ [ ../hosts/${host} ];
      format = format;
    };

  # Home Manager
  mkHome =
    { username
    , system
    , homeModules ? [ ]
    , nixpkgs ? inputs.unstable
    }:
    let
      pkgs = mkNixpkgs { inherit system; };
      homeDirectory = "/home/${username}";
    in
    inputs.homeManager.lib.homeManagerConfiguration {
      inherit system username homeDirectory pkgs;
      configuration = {
        imports = homeModules;
      };

      extraSpecialArgs = {
        inherit inputs nixpkgs system username;
      };
    };
}
