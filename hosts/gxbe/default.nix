{ config, lib, hardware, homeManager, nixpkgs, pkgs, ... }:

{
  imports = [
    ./grub/themes/fallout.nix

    ./services/picom.nix
    ./services/priting.nix
    ./services/redshift.nix
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
    liberation_ttf
    mplus-outline-fonts
  ];

  # Enable unfree packages.
  nixpkgs.config.allowUnfree = true;

  # enable i3
  services.xserver = {
    enable = true;

    videoDrivers = [ "nvidia" ];

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";
    };

    desktopManager.xterm.enable = false;
  };

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
  users.users.gabe.extraGroups = [ "docker" "adbusers"];

  # Enable emulation
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "image/png" = "feh.desktop";
    };
  };

  # System version.
  system.stateVersion = "22.05";

}

