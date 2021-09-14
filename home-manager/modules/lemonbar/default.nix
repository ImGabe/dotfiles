{ pkgs, ... }:

{
  home.packages = with pkgs; [ bar-xft ];

  home.file.".config/lemonbar/bar.sh".source = ./bar.sh;
}
