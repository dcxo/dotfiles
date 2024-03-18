import ../../../utils/options.nix {
  options = ["zsh" "fish"];
  optionName = "shell";
  basePath = builtins.toString ./.;
}
