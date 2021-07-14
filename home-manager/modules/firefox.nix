{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.gabe = {
      settings = {
        # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
        "gfx.webrender.all" = true;
        "browser.quitShortcut.disabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.ffvpx.enabled" = true;
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
