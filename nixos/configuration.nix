{ inputs
, lib
, config
, pkgs
, ...
}:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [ ];

    config.allowUnfree = true;
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    optimise.automatic = true;
    optimise.dates = [ "08:00" ];

    # Garbage colletcor\
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # Hostname.
  networking.hostName = "nixos";

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  # Time zone.
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true;

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 57621 ]; # spotify
  };

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];

    config.common.default = [
      "wlr"
      "gtk"
    ];
  };

  security.pam.services.swaylock = {
    text = "auth include login";
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "gabe";
      };

      default_session = initial_session;
    };
  };

  # Hardware Support
  hardware.opengl = {
    enable = true;

    driSupport = true;
    driSupport32Bit = true;
  };

  # Console keymap.
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Fonts.
  fonts.packages = with pkgs; [
    jetbrains-mono

    noto-fonts-color-emoji
    noto-fonts-emoji
    noto-fonts-cjk
    noto-fonts

    dejavu_fonts

    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
  ];

  # Docker
  virtualisation.docker.enable = true;

  # Users.
  users.users = {
    gabe = {
      initialPassword = "foobar";
      isNormalUser = true;
      description = "Gabriel P Monte";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
