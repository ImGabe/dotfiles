{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.gabe = {
      settings = {
        "media.ffmpeg.vaapi.enabled" = true;
        "media.ffvpx.enabled" = true;
        "media.navigator.mediadatadecoder_vpx_enabled" = true;

        ## Test
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true; # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
        "svg.context-properties.content.enabled" = true;
      };

      userChrome = (builtins.readFile ./userChrome.css);
      userContent = (builtins.readFile ./userContent.css);
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
