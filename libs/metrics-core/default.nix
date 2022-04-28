{ mkDerivation, base, containers, hashable, immortal, imports, lib
, prometheus-client, text, unordered-containers
}:
mkDerivation {
  pname = "metrics-core";
  version = "0.3.2";
  src = ./.;
  libraryHaskellDepends = [
    base containers hashable immortal imports prometheus-client text
    unordered-containers
  ];
  description = "Metrics core";
  license = lib.licenses.agpl3Only;
}
