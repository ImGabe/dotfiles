{
  boot.loader.grub.device = "/dev/sda";
  fileSystems."/".device = "/dev/sda1";

  networking = {
    hostName = "rpi4";
    wireless = {
      enable = true;
      networks."CLARO_2G847D4C".psk = "70847D4C";
      interfaces = [ "wlan0" ];
    };
  };

  services.openssh.enable = true;
}
