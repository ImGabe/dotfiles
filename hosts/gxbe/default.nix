{ config, lib, hardware, homeManager, nixpkgs, pkgs, ... }:

{
  imports = [
    ./grub/themes/fallout.nix

    ./services/priting.nix
    ./services/wacom.nix

    ./hardware-configuration.nix
  ];

  boot = {
    cleanTmpDir = true;

    loader.grub = {
      enable = true;
      version = 2;
      useOSProber = true;
      device = "/dev/sda";
    };
  };

  # Time Zone.
  time.timeZone = "America/Sao_Paulo";

  networking = {
    hostName = "gxbe";
    networkmanager.enable = true;
  };

  networking.firewall.allowedTCPPorts = [ 19000 36455 ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    hasklig
  ];

  # Enable unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Set Gnome to DE
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Nvidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Configure keymap in X11.
  services.xserver.layout = "br";

  # Enable sound and pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.pulseaudio.enable = false;

  # For Vscode keyring.
  services.gnome.gnome-keyring.enable = true;

  # Enable Vulkan.
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  # For "Obsidian".
  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];

  # adb
  programs.adb.enable = true;

  # Docker
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
  users.users.gabe.extraGroups = [ "docker" "adbusers" ];

  # System version.
  system.stateVersion = "22.05";

}

