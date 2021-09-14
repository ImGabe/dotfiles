{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

    windowManager.berry.enable = true;
    displayManager.startx.enable = true;
  };

  home-manager.users.gabe = {
    imports = [
      ## terminal
      # ./../../home-manager/modules/urxvt
      ./../../home-manager/modules/alacritty

      ## notification
      ./../../home-manager/modules/dunst

      ## bar
      ./../../home-manager/modules/lemonbar

      ## input
      ./../../home-manager/modules/sxhkd.nix
    ];

    home.file = {
      ".xinitrc".source = ./.xinitrc;
      ".config/berry/autostart".source = ./autostart;
    };
  };
}
