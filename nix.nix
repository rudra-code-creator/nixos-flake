{ config, pkgs, lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #for nixD
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}