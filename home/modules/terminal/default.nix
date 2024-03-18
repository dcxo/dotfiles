import ../../../utils/options.nix {
  options = ["alacritty"];
  optionName = "terminal";
  basePath = builtins.toString ./.;
}
