{

  home.packages = with pkgs; [
    wezterm
  ];

  # config
  home.file."./.background-image".text = ''
    local wezterm = require 'wezterm';

    return {
      enable_tab_bar = false,
      font = wezterm.font("Hasklig"),
      font_size = 10.0,
      color_scheme = "Gruvbox Dark",
    }
  '';
}
