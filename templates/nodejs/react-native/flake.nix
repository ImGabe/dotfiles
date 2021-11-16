{
  description = "React Native Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        # nix develop
        devShell = with pkgs; mkShell {
          nativeBuildInputs = [
            nodejs
            yarn

            react-native-debugger

            nodePackages.expo-cli
            nodePackages_latest.react-native-cli
          ];
        };
      }
    );
}
