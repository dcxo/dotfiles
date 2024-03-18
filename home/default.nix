{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/browser
    ./modules/desktop
    ./modules/editor/neovim
    ./modules/shell
    ./modules/terminal
    ./modules/utils/power.nix
    ./modules/utils/spotify.nix
    ./modules/utils/ssh.nix
  ];

  desktop = "hyprland";
  terminal = "alacritty";
  browser = "firefox";
  shell = "fish";

  home.username = "dcxo";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    neovide
  ];

  programs.git = {
    enable = true;
    delta.enable = true;

    userName = "David Castilla Ortiz";
    userEmail = "dcxo@proton.me";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  ########## DO NOT REMOVE ###########
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  ####################################
}
