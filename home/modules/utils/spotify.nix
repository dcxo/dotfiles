{config, ...}: {
  services.spotifyd = {
    enable = false;
    settings = {
      global = {
        username = "{daviz}";
        device_name = "LinuxTorreDavid";
      };
    };
  };
}
