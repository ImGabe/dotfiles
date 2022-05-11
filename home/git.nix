{ config, pkgs, ... }:

let
  inherit (config.meta) email name;
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = name;
    userEmail = email;
  };
}
