{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };
}
