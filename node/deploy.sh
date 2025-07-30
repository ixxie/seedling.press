#!/usr/bin/env bash

nix run github:nix-community/nixos-anywhere -- \
   --generate-hardware-config nixos-generate-config ./hardware-configuration.nix \
   --flake .#seedling-host \
   --target-host "${1}"
