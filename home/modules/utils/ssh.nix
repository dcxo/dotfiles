{...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "3h";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "dcxo";
        identityFile = "~/.ssh/id_github";
      };
    };
  };
}
