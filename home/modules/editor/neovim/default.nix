{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/dcxo/nixos/home/modules/editor/neovim/";
  };

  home.packages = with pkgs; [
    stylua
    alejandra
    lua51Packages.luacheck
  ];
}
