{ config, ... }:

{
  # try to use calendar and email
  programs.khal.enable = true;
  programs.vdirsyncer.enable = true;

  accounts.calendar = {
    basePath = "${config.home.homeDirectory}/calendars";

    accounts = {
      gmail = {
        khal.enable = true;
        vdirsyncer.enable = true;

        local = {
          type = "filesystem";
          fileExt = ".ics";
        };

        remote = {
          type = "http";
          url = "https://calendar.google.com/calendar/ical/gabrielpmonte%40gmail.com/private-78d4abd4e2c3a28d88c014142e6cd9f3/basic.ics";
        };
      };
    };
  };
}
