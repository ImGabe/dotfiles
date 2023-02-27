{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.gabe = {
      settings = {
        # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
        "gfx.webrender.all" = true;
        "media.ffvpx.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.navigator.mediadatadecoder_vpx_enabled" = true;
        "layout.css.devPixelsPerPx" = "0.8";

        # Disable what's new toolbar
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        # No Pocket
        "extensions.pocket.enabled" = false;
        # No Firefox Sync
        "identity.fxaccounts.enabled" = false;
        # No recommended extensions
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        # No recommended features
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        # Don't show bookmarks toolbar
        "browser.toolbars.bookmarks.visibility" = "never";
      };

      extensions = with config.nur.repos.rycee.firefox-addons; [
        privacy-badger
        decentraleyes
        link-cleaner
        ublock-origin
        bitwarden
      ];
    };
  };
}
