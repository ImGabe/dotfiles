{ pkgs, ... }:

let
  av = pkgs.fetchFromGitHub {
    owner = "amanharwara";
    repo = "spicetify-autoVolume";
    rev = "d7f7962724b567a8409ef2898602f2c57abddf5a";
    sha256 = "1pnya2j336f847h3vgiprdys4pl0i61ivbii1wyb7yx3wscq7ass";
  };

  spicetify = fetchTarball {
    url = https://github.com/cidkidnix/spicetify-nix/archive/master.tar.gz;
    sha256 = "1zcdpbq8pzw8d99ynh1bf1vb0dn1m84ph14ac09awsw4giv1hmij";
  };
in
{
  imports = [
    (import "${spicetify}/module.nix")
  ];

  programs.spicetify = {
    enable = true;
    theme = "Dribbblish";
    colorScheme = "nord-dark";
    enabledCustomApps = [ "lyrics plus" ];
    enabledExtensions = [ "newRelease.js" "autoVolume.js" "fullAppDisplay.js" "popupLyrics.js" ];
    thirdParyExtensions = {
      "autoVolume.js" = "${av}/autoVolume.js";
    };
  };
}
