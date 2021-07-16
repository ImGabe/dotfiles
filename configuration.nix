{ config, pkgs, lib, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in
{
  imports = [
    ./hardware-configuration.nix
    ./nixos/user.nix
    ./nixos/nix.nix
  ];

  # Support hardware 32 bits.
  hardware.opengl.driSupport32Bit = true;

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable Nvidia drivers.
  services.xserver.videoDrivers = [ "nvidia" ];
  # Enable the GNOME 3 Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Configure keymap in X11.
  services.xserver.layout = "br";

  nixpkgs.config = baseconfig // {
    packageOverrides = pkgs: {
      pipewire = unstable.pipewire;
    };
  };

  # Enable sound with PipeWire.
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # 
  location.provider = "geoclue2";

  # Disable /tmpfs.
  boot.tmpOnTmpfs = false;

  # Enable docker.
  virtualisation.docker.enable = true;

  # System version.
  system.stateVersion = "21.05";
}

