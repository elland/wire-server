# WARNING: GENERATED FILE, DO NOT EDIT.
# This file is generated by running hack/bin/generate-local-nix-packages.sh and
# must be regenerated whenever local packages are added or removed, or
# dependencies are added or removed.
{ mkDerivation, base, cassandra-util, conduit, gitignoreSource
, imports, lens, lib, optparse-applicative, tinylog, types-common
, unliftio, wire-api
}:
mkDerivation {
  pname = "service-backfill";
  version = "1.0.0";
  src = gitignoreSource ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cassandra-util conduit imports lens optparse-applicative
    tinylog types-common unliftio wire-api
  ];
  description = "Backfill service tables";
  license = lib.licenses.agpl3Only;
  mainProgram = "service-backfill";
}
