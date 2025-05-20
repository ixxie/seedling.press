{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    colmena.url = "github:zhaofengli/colmena";
  };
  outputs =
    {
      self,
      nixpkgs,
      colmena,
      ...
    }:
    {
      colmenaHive = colmena.lib.makeHive self.outputs.colmena;
      colmena = {
        meta = {
          nixpkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ ];
          };
        };

        seedling-1 =
          { pkgs, ... }:
          {
            deployment = {
              targetHost = "37.27.5.128";
              targetUser = "root";
            };

            imports = [
              ./hetzner/configuration.nix
              ./hetzner/hardware-configuration.nix
            ];

          };
      };
    };
}
