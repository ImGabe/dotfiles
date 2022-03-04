{ pkgs, ... }:

let
  falloutGrubTheme = pkgs.fetchFromGitHub {
    owner = "imGabe";
    repo = "fallout-grub-theme";
    rev = "1636fbca54ec86e44bfc4c93b0d2e17b39d844b3";
    sha256 = "sha256-+yY9RlyjV6jcMmWHsNALIqr26cNJp+odXPOwfrPwnXI=";
  };
in
{
  boot.loader.grub = {
    font = "${falloutGrubTheme}/fixedsys-regular-32.pf2";
    splashImage = "${falloutGrubTheme}/background.png";

    extraConfig = ''
      set theme=($drive2)/boot/themes/fallout-grub-theme/theme.txt
    '';
  };

  system.activationScripts.copyGrubTheme = ''
    mkdir -p /boot/themes
    cp -R ${falloutGrubTheme}/ /boot/themes/fallout-grub-theme
  '';
}
