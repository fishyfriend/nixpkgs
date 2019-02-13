{ stdenv, buildOcaml, fetchFromGitHub, base64, cryptokit, re, yojson }:

buildOcaml rec {
  version = "0.1";
  name = "jwt";

  src = fetchFromGitHub {
    owner = "besport";
    repo = "ocaml-jwt";
    rev = "0.1";
    sha256 = "09933szwfjhdg4yfsr3plnjasmyk1vihr77l1r81dn8p2pbi1n2k";
  };

  buildInputs = [
    base64
    re
  ];

  propagatedBuildInputs = [
    cryptokit
    yojson
  ];

  meta = with stdenv.lib; {
    homepage = https://github.com/besport/ocaml-jwt;
    description = "Implementation of JSON Web Tokens in OCaml";
    license = stdenv.lib.licenses.lgpl21;
  };
}
