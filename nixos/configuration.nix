{ inputs, lib, config, pkgs, ... }:

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

    checkConfig = true;

    optimise.automatic = true;

    # Garbage collector
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  nix.extraOptions = ''
    trusted-users = root gabe
  '';

  # Hostname
  networking.hostName = "navi";

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  # secure boot 
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  boot.initrd.kernelModules = [ "amdgpu" ];

  # Time zone 
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true;

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      57621 # spotify 
      65535 # minecraft
      51413 # torrent
    ];
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

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    cheese # webcam tool
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    totem # video player
    gnome-music
  ]);

  programs.nix-ld.enable = true;

  environment.systemPackages = [
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.docker
    pkgs.gnomeExtensions.wallhub
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.weather-or-not

    pkgs.gnome-settings-daemon
  ];

  # Hardware Support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs;[
      amdvlk
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      driversi686Linux.amdvlk
    ];
  };

  # Console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents
  services.printing.enable = true;

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Fonts
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    jetbrains-mono

    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
  ];

  services.tailscale.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  programs.adb.enable = true;

  # Users
  users.users = {
    gabe = {
      initialPassword = "foobar";
      isNormalUser = true;
      description = "Gabriel P Monte";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "adbusers"
      ];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
