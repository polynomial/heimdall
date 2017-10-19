{ nixpkgs ? import <nixpkgs> {}}:
let
  inherit (nixpkgs) pkgs;
  heimdall = import ./default.nix {};
in
  if pkgs.lib.inNixShell then heimdall.env else heimdall
