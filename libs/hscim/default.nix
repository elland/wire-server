{ mkDerivation, aeson, aeson-qq, attoparsec, base, bytestring
, case-insensitive, email-validate, hashable, hedgehog, hspec
, hspec-discover, hspec-expectations, hspec-wai, http-api-data
, http-media, http-types, hw-hspec-hedgehog, indexed-traversable
, lib, list-t, microlens, mmorph, mtl, network-uri, retry
, scientific, servant, servant-client, servant-client-core
, servant-server, stm, stm-containers, string-conversions
, template-haskell, text, time, unordered-containers, uuid, wai
, wai-extra, warp
}:
mkDerivation {
  pname = "hscim";
  version = "0.3.6";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson aeson-qq attoparsec base bytestring case-insensitive
    email-validate hashable hedgehog hspec hspec-expectations hspec-wai
    http-api-data http-media http-types hw-hspec-hedgehog list-t
    microlens mmorph mtl network-uri retry scientific servant
    servant-client servant-client-core servant-server stm
    stm-containers string-conversions template-haskell text time
    unordered-containers uuid wai wai-extra warp
  ];
  executableHaskellDepends = [
    aeson aeson-qq attoparsec base bytestring case-insensitive
    email-validate hashable hedgehog hspec hspec-expectations hspec-wai
    http-api-data http-media http-types hw-hspec-hedgehog list-t
    microlens mmorph mtl network-uri retry scientific servant
    servant-client servant-client-core servant-server stm
    stm-containers string-conversions template-haskell text time
    unordered-containers uuid wai wai-extra warp
  ];
  testHaskellDepends = [
    aeson aeson-qq attoparsec base bytestring case-insensitive
    email-validate hashable hedgehog hspec hspec-expectations hspec-wai
    http-api-data http-media http-types hw-hspec-hedgehog
    indexed-traversable list-t microlens mmorph mtl network-uri retry
    scientific servant servant-client servant-client-core
    servant-server stm stm-containers string-conversions
    template-haskell text time unordered-containers uuid wai wai-extra
    warp
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "https://github.com/wireapp/wire-server/libs/hscim/README.md";
  description = "hscim json schema and server implementation";
  license = lib.licenses.agpl3Only;
}
