{
  config,
  lib,
  ...
}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "3h";
  };
}
