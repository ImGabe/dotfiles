{ lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    package = pkgs.swayfx;
    checkConfig = false;

    config = {
      terminal = "alacritty";
      menu = "fuzzel";

      modifier = "Mod4";

      window.border = 1;

      bars = [{ command = "waybar"; }];

      gaps.inner = 2;
      gaps.smartGaps = true;

      input."*" = {
        xkb_layout = "br";
        xkb_variant = "abnt2";
      };

      keybindings =
        let
          win = "Mod4";
        in
        lib.mkOptionDefault {


          # printscreen
          "${win}+shift+s" = ''exec ${pkgs.grim} -g "$(${pkgs.slurp})" - | wl-copy --type image/png'';

          # lockscreen
          "${win}+l" = "exec ${pkgs.swaylock}";

          # workspace
          "${win}+Ctrl+left" = "workspace prev";
          "${win}+Ctrl+right" = "workspace next";

          "${win}+tab" = "workspace back_and_forth";

          "${win}+XF86AudioRaiseVolume" = "exec ${pkgs.pw-volume} change +2.5%; pkill -RTMIN+8 waybar";
          "${win}+XF86AudioLowerVolume" = "exec ${pkgs.pw-volume} change -2.5%; pkill -RTMIN+8 waybar";
          "${win}+XF86AudioMute" = "exec ${pkgs.pw-volume} mute toggle; pkill -RTMIN+8 waybar";
        };

      startup = [
        { command = "firefox"; }
        { command = "swww-daemon --format xrgb"; }
      ];
    };

    # extraConfig = ''
    #   corner_radius 10

    #   blur on
    #   blur_passes 3
    #   blur_radius 8

    #   shadows on
    #   shadow_blur_radius 50
    #   shadow_color #000000FF
    # '';
  };
}
