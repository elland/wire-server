{ mkDerivation, base, brig-types, cassandra-util, conduit, imports
, lens, lib, optparse-applicative, tinylog, types-common, unliftio
}:
mkDerivation {
  pname = "service-backfill";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base brig-types cassandra-util conduit imports lens
    optparse-applicative tinylog types-common unliftio
  ];
  description = "Backfill service tables";
  license = lib.licenses.agpl3Only;
}
