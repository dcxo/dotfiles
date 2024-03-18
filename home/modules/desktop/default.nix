import ../../../utils/options.nix {
  options = ["hyprland"];
  optionName = "desktop";
  basePath = builtins.toString ./.;
}
