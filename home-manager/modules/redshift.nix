{ pkgs, ... }:

{
  services.redshift = {
    enable = true;
    provider = "geoclue2";

    temperature = {
      day = 5500;
      night = 3700;
    };
  };
}
