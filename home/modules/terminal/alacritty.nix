{
  lib,
  config,
  ...
}: {
  options = {
    alacritty.enable = lib.mkEnableOption "Enable Alacritty";
  };

  config = {
    programs.alacritty = {
      enable = config.alacritty.enable;
      settings = {
        font = {
          normal = {family = "GeistMono NF";};
        };
        keyboard = {
          bindings = [
            {
              key = "N";
              mods = "Control|Shift";
              action = "CreateNewWindow";
            }
          ];
        };
      };
    };
  };
}
