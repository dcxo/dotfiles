{
  pkgs,
  lib,
  config,
  ...
}: let
  workspacesBinds = with builtins; (
    concatMap
    (workspace: [
      "$mod,${workspace},workspace,${workspace}"
      "$mod SHIFT,${workspace},movetoworkspace,${workspace}"
      "$mod SHIFT CTRL,${workspace},movetoworkspacesilent,${workspace}"
    ])
    (genList (x: toString x) 10)
  );
in {
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = {
    home.packages = with pkgs; [
      wl-clipboard-rs
    ];
    wayland.windowManager.hyprland = {
      enable = config.hyprland.enable;
      systemd.enable = true;
      settings = {
        monitor = ",preferred,auto,auto";

        input = {
          kb_layout = "us";
          follow_mouse = 0;
        };

        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          "col.active_border" = "rgb(f7b42c)";
          "col.inactive_border" = "rgba(f7b42c55)";

          layout = "master";

          allow_tearing = false;
        };

        decoration = {
          rounding = 10;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.2;
          };

          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1a33)";
        };

        animations = {
          enabled = false;
        };

        master = {
          new_is_master = false;
        };

        "$mod" = "SUPER";
        bind =
          [
            "$mod SHIFT CTRL, m, exit"
            "$mod, q, killactive"
            "$mod, Return, exec, ${config.terminal}"
            "$mod, B, exec, ${config.browser}"

            "$mod, h, movefocus, l"
            "$mod, j, movefocus, d"
            "$mod, k, movefocus, u"
            "$mod, l, movefocus, r"
            "$mod, Tab, cyclenext"
            "$mod SHIFT, Tab, cyclenext, prev"
          ]
          ++ workspacesBinds;

        binde = [
          ",XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0"
          ",XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ];
      };
    };
  };
}
