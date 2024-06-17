{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings.import = [ pkgs.alacritty-theme.solarized_dark ];

    settings = {
      window = {
        dimensions = { columns = 120; lines = 30; };
        position = { x = 50; y = 50; };
        padding = { x = 10; y = 10; };
        dynamic_title = true;
      };

      font = {
        size = 12;

        normal = { family = "JetBrainsMono Nerd Font Mono"; style = "Regular"; };
        bold = { family = "JetBrainsMono Nerd Font Mono"; style = "Bold"; };
        italic = { family = "JetBrainsMono Nerd Font Mono"; style = "Italic"; };
      };

      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };

      shell.program = "fish";

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      live_config_reload = true;
    };
  };
}
