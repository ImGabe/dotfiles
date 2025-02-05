{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        dimensions = { columns = 60; lines = 15; };
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

      terminal.shell.program = "fish";

      scrolling = {
        history = 10000;
        multiplier = 3;
      };
    };
  };
}
