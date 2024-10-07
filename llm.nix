{ config, pkgs, lib, ... }:

let 
  unstablepkgs = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable) {};
in {
  disabledModules = [ "services/misc/ollama.nix" ];
  imports = [
    "${unstablepkgs.path}/nixos/modules/services/misc/ollama.nix"
  ];

  services.ollama.enable = true;
  services.ollama.acceleration = "cuda";
  services.ollama.package = unstablepkgs.ollama;
}
