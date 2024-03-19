{
  lib,
  pkgs,
  ...
}: {
  options.fish.enable = lib.mkEnableOption "Enable FiSH";
  config = {
    home.packages = [pkgs.neofetch];
    programs.fish = {
      enable = true;
      functions = {
        fish_greeting = "neofetch";
      };
    };
  };
}
