{ config, pkgs, lib, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #for nixD
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}