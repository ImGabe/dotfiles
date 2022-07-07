{ pkgs, inputs, config, ... }:

let theme = config.colorscheme.slug;
in
{
  programs.kitty = {
    enable = true;

    theme = "Gruvbox Material Dark Medium";

    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
      size = 10;
    };

    settings = {
      enable_audio_bell = "no";
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      window_padding_width = 2;
    };
  };
}
