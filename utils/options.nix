{
  options,
  optionName,
  basePath ? (builtins.toString ./.),
  imports ? (map (opt: basePath + "/${opt}.nix") options),
  ...
}: {
  lib,
  config,
  modulesPath,
  ...
}: {
  inherit imports;

  options = {
    "${optionName}" = with lib;
      mkOption {
        type = types.enum options;
        default = head options;
      };
  };

  config = with builtins;
    listToAttrs (
      map (term: {
        name = term;
        value = {enable = config."${optionName}" == term;};
      })
      options
    );
}
