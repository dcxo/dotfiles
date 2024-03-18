{
  pkgs,
  lib,
  config,
  ...
}: {
  options.zsh.enable = lib.mkEnableOption "Enable ZSH";

  config = {
    home.packages = with pkgs; [
      neofetch
    ];

    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      initExtra = "neofetch";
      zplug = {
        enable = true;
        zplugHome = "${config.xdg.configHome}/zsh/zplug";
        plugins = [
          {
            name = "zsh-users/zsh-syntax-highlighting";
            tags = ["defer:2"];
          }
          {
            name = "zsh-users/zsh-history-substring-search";
          }
          {
            name = "zsh-users/zsh-autosuggestions";
          }
          {
            name = "OdilonDamasceno/dino-zsh-theme";
            tags = [
              "as:theme"
              "use:\"src/*\""
            ];
          }
        ];
      };
    };
  };
}
