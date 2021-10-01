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
      # ./../../pkgs/urxvt
      ./../../pkgs/alacritty

      ## notification
      ./../../pkgs/dunst

      ## bar
      ./../../pkgs/lemonbar

      ## input
      ./../../pkgs/sxhkd.nix
    ];

    home.file = {
      ".xinitrc".source = ./.xinitrc;
      ".config/berry/autostart".source = ./autostart;
    };
  };
}
