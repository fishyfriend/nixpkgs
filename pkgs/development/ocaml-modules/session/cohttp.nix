{ stdenv, buildDunePackage, session, cohttp}:

buildDunePackage rec {
  inherit (session) version minimumSupportedOcamlVersion src meta;
  pname = "session-cohttp";

  propagatedBuildInputs = [
    cohttp
    session
  ];
}
