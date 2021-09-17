{
  programs.urxvt = {
    enable = true;

    shading = 0;

    fonts = [ "xft:Monoid:size=9" ];

    keybindings =
      {
        "Shift-Control-C" = "eval:selection_to_clipboard";
        "Shift-Control-V" = "eval:paste_clipboard";
      };

    scroll = {
      bar.enable = false;
      keepPosition = true;
      lines = 10000;
      scrollOnKeystroke = true;
      scrollOnOutput = false;
    };

    extraConfig = {
      "*.foreground" = "#93a1a1";
      "*.background" = "#141c21";
      "*.cursorColor" = "#afbfbf";
    };
  };
}
