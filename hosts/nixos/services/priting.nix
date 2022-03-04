{ pkgs, ... }:

{
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplipWithPlugin ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
}
