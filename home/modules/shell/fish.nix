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
      shellInit = ''
        function fish_greeting
          neofetch
        end
      '';
    };
  };
}
