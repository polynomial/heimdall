{ mkDerivation
, array
, base
, Cabal
, cabal-doctest
, stdenv
, dns
}:
mkDerivation {
  pname = "heimdall";
  version = "0.0.1";
  src = ./.;
  setupHaskellDepends = [ base Cabal cabal-doctest ];
  libraryHaskellDepends = [
    base dns
  ];
  testHaskellDepends = [
    base 
  ];
  homepage = "https://github.com/polynomial/heimdall";
  description = "Source code for a testing tool";
  license = stdenv.lib.licenses.bsd3;
}
