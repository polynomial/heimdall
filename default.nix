{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let
  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  modifiedHaskellPackages = haskellPackages.override {
    overrides = self: super: {
      # work-around for some older versions of nixpkgs
      tasty-discover = 
         if super ? tasty-discover_3_0_2
         then pkgs.haskell.lib.dontCheck super.tasty-discover_3_0_2
         else  super.tasty-discover;
    };
  };

  heimdall = modifiedHaskellPackages.callPackage ./heimdall.nix {};
  modified-heimdall = pkgs.haskell.lib.overrideCabal heimdall (drv: { checkPhase = "true"; });
in
  modified-heimdall

