{
  lib,
  pkgs,
  config,
  ...
}: {
  options.firefox.enable = lib.mkEnableOption "Enable Firefox";

  config = {
    programs.firefox = {
      enable = true;
      policies = {
        DefaultDownloadDirectory = "/home/dcxo/downloads";
        SearchEngines = {
          Default = "DuckDuckGo";
        };
      };
    };
  };
}
