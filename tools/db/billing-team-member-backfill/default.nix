# WARNING: GENERATED FILE, DO NOT EDIT.
# This file is generated by running hack/bin/generate-local-nix-packages.sh and
# must be regenerated whenever local packages are added or removed, or
# dependencies are added or removed.
{ mkDerivation, base, cassandra-util, conduit, containers
, gitignoreSource, imports, lens, lib, optparse-applicative, text
, tinylog, types-common, wire-api
}:
mkDerivation {
  pname = "billing-team-member-backfill";
  version = "1.0.0";
  src = gitignoreSource ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cassandra-util conduit containers imports lens
    optparse-applicative text tinylog types-common wire-api
  ];
  description = "Backfill billing_team_member table";
  license = lib.licenses.agpl3Only;
  mainProgram = "billing-team-member-backfill";
}
