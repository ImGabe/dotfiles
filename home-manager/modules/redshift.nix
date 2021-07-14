{ pkgs, ... }:

{
  services.redshift = {
    enable = true;
    provider = "geoclue2";

    brightness-day = "1";
    brightness-night = "1";

    temperature = {
      day = 5500;
      night = 3700;
    };
  };
}
