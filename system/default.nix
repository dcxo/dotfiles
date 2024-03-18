{
  config,
  lib,
  pkgs,
  nixpkgs-unstable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "max";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "LinuxTorreDavid";

  time = {
    timeZone = "Europe/Madrid";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "dcxo";
      };
      default_session = initial_session;
    };
  };

  users.users.dcxo = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = ["wheel" "power"];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    ntfs3g
    unzip
    cage
    greetd.regreet
    greetd.greetd
    swww
    tree
    ripgrep
    fd
    home-manager
    cargo
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
    ];
    fontconfig = {
      defaultFonts = {
        monospace = ["GeistMono NF"];
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.fish.enable = true;
  programs.dconf.enable = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  ##############################################
  system.stateVersion = "23.11";
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  ##############################################
}
