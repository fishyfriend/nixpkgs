{ stdenv, buildDunePackage, session-cohttp, cohttp-lwt, ocaml_lwt }:

buildDunePackage rec {
  inherit (session-cohttp) version minimumSupportedOcamlVersion src meta;
  pname = "session-cohttp-lwt";

  propagatedBuildInputs = [
    cohttp-lwt
    ocaml_lwt
    session-cohttp
  ];
}
