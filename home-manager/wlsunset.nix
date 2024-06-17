{
  services.wlsunset = {
    enable = true;
    systemdTarget = "graphical.target";

    latitude = -22.9068;
    longitude = -43.1729;

    gamma = "1.0";

    temperature = {
      day = 6500;
      night = 3400;
    };
  };
}
