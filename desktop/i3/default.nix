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
      ./../../pkgs/alacritty # terminal
      ## rofi
      ./../../pkgs/rofi # launcher
      ## polybar (TO-DO)
      ./../../pkgs/polybar # bar
      ## dunst
      ./../../pkgs/dunst # notification
      ## compton
      ./../../pkgs/compton # shadown effect
    ];

    home.packages = with pkgs; [ flashfocus xclip maim killall ]; # https://github.com/fennerm/flashfocus

    # polybar launch
    home.file."./.config/polybar/launch.sh".source = ./launch.sh;

    # wallpaper
    home.file."./.background-image".source = ./wallpaper.png;
  };
}
