{ mkDerivation, aeson, aeson-pretty, async, base, bytestring
, bytestring-conversion, case-insensitive, containers, either
, errors, exceptions, hspec, hspec-discover, http-types, http2
, HUnit, imports, kan-extensions, lib, lifted-base, metrics-wai
, mtl, network, QuickCheck, retry, servant, servant-client
, servant-client-core, servant-server, singletons, sop-core
, streaming-commons, template-haskell, text, time, time-manager
, tls, types-common, uuid, wai-utilities, wire-api
}:
mkDerivation {
  pname = "wire-api-federation";
  version = "0.1.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson async base bytestring bytestring-conversion case-insensitive
    containers either errors exceptions http-types http2 imports
    kan-extensions lifted-base metrics-wai mtl network QuickCheck
    servant servant-client servant-client-core servant-server
    singletons sop-core streaming-commons template-haskell text time
    time-manager tls types-common wai-utilities wire-api
  ];
  testHaskellDepends = [
    aeson aeson-pretty async base bytestring bytestring-conversion
    case-insensitive containers either errors exceptions hspec
    http-types http2 HUnit imports kan-extensions lifted-base
    metrics-wai mtl network QuickCheck retry servant servant-client
    servant-client-core servant-server singletons sop-core
    streaming-commons template-haskell text time time-manager tls
    types-common uuid wai-utilities wire-api
  ];
  testToolDepends = [ hspec-discover ];
  description = "The Wire server-to-server API for federation";
  license = lib.licenses.agpl3Only;
}
