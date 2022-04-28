{ mkDerivation, base, cassandra-util, conduit, containers
, galley-types, imports, lens, lib, optparse-applicative, text
, tinylog, types-common
}:
mkDerivation {
  pname = "billing-team-member-backfill";
  version = "1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cassandra-util conduit containers galley-types imports lens
    optparse-applicative text tinylog types-common
  ];
  description = "Backfill billing_team_member table";
  license = lib.licenses.agpl3Only;
}
