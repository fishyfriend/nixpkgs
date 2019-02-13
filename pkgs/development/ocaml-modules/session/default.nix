{ stdenv, buildDunePackage, fetchFromGitHub, nocrypto, ounit, result }:

buildDunePackage rec {
  pname = "session";
  version = "0.4.0";
  minimumSupportedOcamlVersion = "4.03";

  src = fetchFromGitHub {
    owner = "inhabitedtype";
    repo = "ocaml-session";
    rev = "0.4.0";
    sha256 = "164s7bcgcmxn32gshsp4fh83lmz1lkw1ph3hzb2ijs55iwqvkgl3";
  };

  buildInputs = [
    ounit
    # result # listed in opam file, but should be unnecessary with ocaml >= 4.03
  ];

  propagatedBuildInputs = [
    nocrypto
  ];

  meta = with stdenv.lib; {
    homepage = https://github.com/inhabitedtype/ocaml-session;
    description = "A session manager for your everyday needs";
    license = stdenv.lib.licenses.bsd3;
  };
}
