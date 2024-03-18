{pkgs, ...}: let
  windowsBoot = pkgs.writeShellScriptBin "windows-boot" "systemctl reboot --boot-loader-entry=auto-windows";
  firmwareBoot = pkgs.writeShellScriptBin "firmware-boot" "systemctl reboot --boot-loader-entry=auto-reboot-to-firmware-setup";
  reloadHome = pkgs.writeShellScriptBin "reload-home" "home-manager switch --flake /home/dcxo/nixos#dcxo";
in {
  home.packages = [
    windowsBoot
    firmwareBoot
    reloadHome
  ];
}
