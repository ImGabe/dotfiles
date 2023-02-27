{ config, pkgs, ... }:


{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Gabriel Pereira Monte";
    userEmail = "gabrielpmonte@hotmail.com";
  };
}
