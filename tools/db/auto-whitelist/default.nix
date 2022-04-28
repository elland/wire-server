{ mkDerivation, base, brig-types, cassandra-util, extra, imports
, lens, lib, optparse-applicative, tinylog, types-common, unliftio
}:
mkDerivation {
  pname = "auto-whitelist";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base brig-types cassandra-util extra imports lens
    optparse-applicative tinylog types-common unliftio
  ];
  description = "Backfill service tables";
  license = lib.licenses.agpl3Only;
}
