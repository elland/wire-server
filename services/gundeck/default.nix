{ mkDerivation, aeson, aeson-pretty, amazonka, amazonka-sns
, amazonka-sqs, async, attoparsec, auto-update, base
, base16-bytestring, bilge, bytestring, bytestring-conversion
, cassandra-util, containers, criterion, data-default, errors
, exceptions, extended, extra, gundeck-types, hedis, HsOpenSSL
, http-client, http-client-tls, http-types, imports, kan-extensions
, lens, lens-aeson, lib, metrics-core, metrics-wai, MonadRandom
, mtl, multiset, network, network-uri, optparse-applicative
, psqueues, QuickCheck, quickcheck-instances
, quickcheck-state-machine, random, raw-strings-qq, resourcet
, retry, safe, safe-exceptions, scientific, streaming-commons
, string-conversions, swagger, tagged, tasty, tasty-hunit
, tasty-quickcheck, text, time, tinylog, tls, tree-diff
, types-common, unix, unliftio, unordered-containers, uuid, wai
, wai-extra, wai-middleware-gunzip, wai-predicates, wai-routing
, wai-utilities, warp, warp-tls, websockets, wire-api, yaml
}:
mkDerivation {
  pname = "gundeck";
  version = "1.45.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson amazonka amazonka-sns amazonka-sqs async attoparsec
    auto-update base bilge bytestring bytestring-conversion
    cassandra-util containers data-default errors exceptions extended
    extra gundeck-types hedis HsOpenSSL http-client http-client-tls
    http-types imports lens lens-aeson metrics-core metrics-wai mtl
    network network-uri optparse-applicative psqueues resourcet retry
    safe-exceptions swagger text time tinylog tls types-common unliftio
    unordered-containers uuid wai wai-extra wai-middleware-gunzip
    wai-predicates wai-routing wai-utilities wire-api yaml
  ];
  executableHaskellDepends = [
    aeson async base base16-bytestring bilge bytestring
    bytestring-conversion cassandra-util containers exceptions extended
    gundeck-types HsOpenSSL http-client http-client-tls imports
    kan-extensions lens lens-aeson metrics-wai mtl network network-uri
    optparse-applicative random raw-strings-qq retry safe
    streaming-commons tagged tasty tasty-hunit text time tinylog
    types-common unix unordered-containers uuid wai wai-utilities warp
    warp-tls websockets wire-api yaml
  ];
  testHaskellDepends = [
    aeson aeson-pretty amazonka async base bytestring containers
    exceptions extended gundeck-types HsOpenSSL imports lens
    metrics-wai MonadRandom mtl multiset network-uri QuickCheck
    quickcheck-instances quickcheck-state-machine scientific
    string-conversions tasty tasty-hunit tasty-quickcheck text time
    tinylog tree-diff types-common unordered-containers uuid
    wai-utilities wire-api
  ];
  benchmarkHaskellDepends = [
    aeson amazonka base bytestring criterion extended gundeck-types
    HsOpenSSL imports lens random text time types-common
    unordered-containers uuid
  ];
  description = "Push Notification Hub";
  license = lib.licenses.agpl3Only;
}
