{ config, inputs, username, nixpkgs, ... }:

let
  inherit (inputs) nixColors;
in
{
  colorscheme = nixColors.colorSchemes.gruvbox-dark-medium;
  fonts.fontconfig.enable = true;

  nix.registry.nixpkgs.flake = nixpkgs;

  meta = {
    username = "gabe";
    email = "gabrielpmonte@hotmail.com";
  };

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "21.05";
  };
}
