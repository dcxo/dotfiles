import ../../../utils/options.nix {
  options = ["firefox"];
  optionName = "browser";
  basePath = builtins.toString ./.;
}
