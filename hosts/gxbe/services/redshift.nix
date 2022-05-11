{
  location.provider = "geoclue2";

  services.redshift = {
    enable = true;

    temperature = {
      day = 5500;
      night = 3700;
    };
  };
}
