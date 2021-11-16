{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.gabe = {
      settings = {
        "gfx.webrender.all" = true; # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
        "media.ffvpx.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.navigator.mediadatadecoder_vpx_enabled" = true;
      };
    };

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      https-everywhere
      privacy-badger
      decentraleyes
      link-cleaner
      octotree
      ublock-origin
      bitwarden
    ];
  };
}
