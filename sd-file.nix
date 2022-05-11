{
  description = "Build image";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
  outputs = { self, nixpkgs }: rec {
    nixosConfigurations.rpi4 = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        {
          nixpkgs.config.allowUnsupportedSystem = true;
          nixpkgs.crossSystem.system = "aarch64-linux";

          users.extraUsers.root.openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCmZ68QCEx2cqhyzzu5WkfjloEJYA3pjlTi2XTFI26s gabrielpmonte@hotmail.com"
          ];
        }
      ];
    };
    images.rpi4 = nixosConfigurations.rpi4.config.system.build.sdImage;
  };
}

