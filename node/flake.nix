{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ ... }:
    {
      nixosConfigurations = {
        seedling-host = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            inputs.disko.nixosModules.disko
            ./configuration.nix
            ./hardware-configuration.nix
            ./disks.nix
          ];
        };
      };
    };
}
