{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;
    displayManager.defaultSession = "none+i3";
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        i3lock # default i3 screen locker
      ];

      configFile = ./config;
    };
  };

  home-manager.users.gabe = {
    imports = [
      ## alacritty
      ./../../home-manager/modules/alacritty # terminal
      ## rofi
      ./../../home-manager/modules/rofi # launcher
      ## polybar (TO-DO)
      ./../../home-manager/modules/polybar # bar
      ## dunst
      ./../../home-manager/modules/dunst # notification
      ## compton
      ./../../home-manager/modules/compton # shadown effect
    ];

    home.packages = with pkgs; [ flashfocus xclip maim killall ]; # https://github.com/fennerm/flashfocus

    # polybar launch
    home.file."./.config/polybar/launch.sh".source = ./launch.sh;

    # wallpaper
    home.file."./.background-image".source = ./wallpaper.png;
  };
}
