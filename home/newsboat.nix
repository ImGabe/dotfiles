{ pkgs, ... }:

let
  w3m = "${pkgs.w3m}/bin/w3m";
  mpv = "${pkgs.mpv}/bin/mpv";
in
{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        title = "The Go Programming Language Blog";
        url = "https://go.dev/blog/feed.atom?format=xml";
        tags = [ "tech" "go" ];
      }

      # Aggregators
      {
        title = "Lobste.rs - Nix/Go";
        url = "https://lobste.rs/t/nix,rust,go.rss";
        tags = [ "tech" "go" "rust" "nix" ];
      }
      {
        title = "Lobste.rs - Frontpage";
        url = "https://lobste.rs/rss";
        tags = [ "tech" ];
      }
      {
        title = "Hacker News - Frontpage";
        url = "https://hnrss.org/newest?q=rust+OR+go";
        tags = [ "tech" "go" "rust" ];
      }
      {
        title = "Hacker News - Frontpage";
        url = "https://news.ycombinator.com/rss";
        tags = [ "tech" ];
      }

      # youtube
      {
        title = "NixOS";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3vIimi9q4AT8EgxYp_dWIw";
        tags = [ "tech" "youtube" ];
      }
      {
        title = "GambiConf";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnTbfjNNWxFMyqW-d2QgHYw";
        tags = [ "tech" "youtube" ];
      }
      {
        title = "Raffael Chess";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSAo4zvM1oAJ_i4C6q6ejBA";
        tags = [ "chess" "youtube" ];
      }

    ];
    extraConfig = ''
      html-renderer      "${w3m} -dump -T text/html"
      refresh-on-startup yes
      text-width         72
      # open video on mpv
      macro v set browser "${mpv} %u" ; open-in-browser ; set browser "${w3m} %u"
    '';
  };
}
