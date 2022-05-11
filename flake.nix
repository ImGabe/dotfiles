{
  description = "My personal Nix/Os configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-21.11";

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
            ./home/chromium.nix
            ./home/email.nix
            ./home/firefox.nix
            ./home/git.nix
            ./home/i3.nix
            ./home/newsboat.nix
            ./home/nvim.nix
            ./home/gui.nix
            ./home/home.nix
            ./home/rbw.nix
            ./home/starship.nix
            ./home/vscode.nix
            ./home/wezterm.nix

            ./modules/meta.nix

            inputs.nixColors.homeManagerModule
          ];
        };

        # rpi4 = prelude.mkEmulator {
        #   host = "rpi4";
        #   system = "aarch64-linux";
        #   format = "sd-aarch64-installer";

        #   emulatorModules = [
        #     ./hosts/rpi4
        #   ];
        # };
      };

      packages.x86_64-linux.rpi4 = inputs.nixos-generators.nixosGenerate {
        pkgs = inputs.unstable.legacyPackages.x86_64-linux;
        modules = [
          ./modules/meta.nix

          ./nixos/git.nix
          ./nixos/nix.nix
          ./nixos/user.nix

          ./hosts/rpi4
        ];
        format = "sd-aarch64-installer";
      };


      templates = import ./templates;
    } // inputs.utils.lib.eachDefaultSystem (system:
      let pkgs = prelude.mkNixpkgs { inherit system; };
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [
            nixpkgs-fmt
            rnix-lsp
          ];
        };
      }
    );
}
