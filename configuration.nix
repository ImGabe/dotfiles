{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./desktop/i3
    # ./desktop/gnome
    ./nixos/user.nix
    ./nixos/nix.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "/dev/sda";

  # Time Zone.
  time.timeZone = "America/Sao_Paulo";

  # Hostname.
  networking.hostName = "gxbe";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  fonts.fonts = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    mplus-outline-fonts
    dina-font
    proggyfonts
    hasklig
    siji
  ];

  # Enable unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Enable Nvidia drivers.
  services.xserver.videoDrivers = [ "n" ];

  # Configure keymap in X11.
  services.xserver.layout = "br";

  # Configure Wacom.
  services.xserver.wacom.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable supoort for 32 bits.
  hardware.opengl.driSupport32Bit = true;

  # System version.
  system.stateVersion = "21.05";

}

