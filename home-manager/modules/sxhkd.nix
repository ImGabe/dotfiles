{
  services.sxhkd = {
    enable = true;

    keybindings = {

      # wm independent hotkeys
      "super + Return" = "alacritty";
      "super + d" = "rofi -show drun";
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # Berry hotkeys
      "super + {h, j, k, l}" = "berryc window_move {-50 0, 0 50, 0 -50, 50 0}";
      "super + shift + {h, j, k, l}" = "berryc window_resize {-50 0, 0 50, 0 -50, 50 0}";
      "super + {1-9}" = "berryc switch_workspace {0-9}";
      "super + shift + {1-9}" = "berryc send_to_workspace {0-9}";
      "super + m" = "berryc window_monocle";
      "super + f" = "berryc fullscreen";
      "super + p" = "berryc snap_right";
      "super + o" = "berryc snap_left";
      "super + n" = "berryc toggle_decorations";
      "super + Tab" = "berryc cycle_focus";
      "super + q" = " berryc window_close";
      "super + c" = "berryc window_center";
      "~button1" = "pointer_focus";
    };
  };
}
