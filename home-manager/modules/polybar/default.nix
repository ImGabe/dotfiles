{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
    };

    config = ./config;

    script = "polybar top-center &";
  };

  home.packages = with pkgs; [ playerctl zscroll ];

  home.file.".config/polybar/get_spotify_status.sh".source = ./get_spotify_status.sh;
  home.file.".config/polybar/scroll_spotify_status.sh".source = ./scroll_spotify_status.sh;

}
