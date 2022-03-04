{ config, pkgs, lib, ... }:

{
  imports = [
    # grub theme
    ./grub/themes/fallout.nix

    # picom
    ./services/picom.nix
    #redshift
    ./services/redshift.nix
    # priting
    ./services/priting.nix
    # wacom
    ./services/wacom.nix

    # nix
    ./modules/nix.nix
    # docker
    ./modules/docker.nix

    # hardware configuration
    ./hardware-configuration.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "/dev/sda";

  # clear /tmp
  boot.cleanTmpDir = true;

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

  # Enable Nvidia drivers.
  services.xserver.videoDrivers = [ "nvidia" ];

  # enable i3
  services.xserver = {
    enable = true;

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
  hardware.opengl.driSupport = true;
  # Enable suport for 32 bits.
  hardware.opengl.driSupport32Bit = true;

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "image/png" = "feh.desktop";
    };
  };

  # User config.
  users.users.gabe = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "docker" ];
    password = "...";
  };

  # System version.
  system.stateVersion = "21.05";

}

