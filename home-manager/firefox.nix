{ config, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.gabe = {
      settings = {
        # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
        # "gfx.webrender.all" = true;
        # "media.ffvpx.enabled" = true;
        # "media.ffmpeg.vaapi.enabled" = true;
        # "media.navigator.mediadatadecoder_vpx_enabled" = true;
        # "layout.css.devPixelsPerPx" = "0.8";

        # Disable what's new toolbar
        # "browser.messaging-system.whatsNewPanel.enabled" = false;
        # No Pocket
        # "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        # "extensions.pocket.enabled" = false;
        # "extensions.pocket.api" = "";
        # "extensions.pocket.oAuthConsumerKey" = "";
        # "extensions.pocket.showHome" = false;
        # "extensions.pocket.site" = "";

        # # No Firefox Sync
        # "identity.fxaccounts.enabled" = false;
        # # No recommended extensions
        # "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        # # No recommended features
        # "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        # # Don't show bookmarks toolbar
        # "browser.toolbars.bookmarks.visibility" = "never";

        # Enable HTTPS-Only Mode
        # "dom.security.https_only_mode" = true;
        # "dom.security.https_only_mode_ever_enabled" = true;

        # Privacy settings
        # "privacy.donottrackheader.enabled" = true;
        # "privacy.trackingprotection.enabled" = true;
        # "privacy.trackingprotection.socialtracking.enabled" = true;
        # "privacy.partition.network_state.ocsp_cache" = true;

        # As well as Firefox 'experiments'
        # "experiments.activeExperiment" = false;
        # "experiments.enabled" = false;
        # "experiments.supported" = false;
        # "network.allow-experiments" = false;

        # Telemetry
        # "datareporting.policy.dataSubmissionEnabled" = false;
        # "datareporting.healthreport.uploadEnabled" = false;
        # "toolkit.telemetry.server" = "data:,";
        # "toolkit.telemetry.coverage.opt-out" = true;
        # "toolkit.coverage.opt-out" = true;
        # "toolkit.coverage.endpoint.base" = "";
        # "toolkit.telemetry.archive.enabled" = false;
        # "toolkit.telemetry.bhrPing.enabled" = false;
        # "toolkit.telemetry.enabled" = false;
        # "toolkit.telemetry.firstShutdownPing.enabled" = false;
        # "toolkit.telemetry.hybridContent.enabled" = false;
        # "toolkit.telemetry.newProfilePing.enabled" = false;
        # "toolkit.telemetry.reportingpolicy.firstRun" = false;
        # "toolkit.telemetry.shutdownPingSender.enabled" = false;
        # "toolkit.telemetry.unified" = false;
        # "toolkit.telemetry.updatePing.enabled" = false;

        # "browser.ping-centre.telemetry" = false;
        # "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        # "browser.newtabpage.activity-stream.telemetry" = false;

        # "beacon.enabled" = false;
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        /* hides the title bar */
        #titlebar {
          visibility: collapse;
        }

        /* hides the sidebar */
        #sidebar-header {
          visibility: collapse !important;
        } 

      '';

      extensions = with config.nur.repos.rycee.firefox-addons; [
        privacy-badger
        decentraleyes
        link-cleaner
        ublock-origin
        bitwarden
        tampermonkey
        clearurls

        tree-style-tab
        tst-indent-line

        search-by-image
        auto-tab-discard
        clearurls
        disconnect
        istilldontcareaboutcookies
        sponsorblock
        steam-database
      ];
    };
  };
}
