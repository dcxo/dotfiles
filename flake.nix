{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    unstable-overlay = final: prev: {
      unstable = nixpkgs-unstable.legacyPackages."${system}";
    };
  in {
    homeConfigurations = {
      dcxo = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        modules = [./home];
      };
    };
    nixosConfigurations = {
      dcxo = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # ({ config, pkgs, ... }: { nixpkgs.overlays = [ unstable-overlay ]; })
          ./system
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dcxo = import ./home;
          }
        ];
      };
    };
  };
}
