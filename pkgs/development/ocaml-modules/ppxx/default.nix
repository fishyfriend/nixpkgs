{ fetchFromBitbucket, buildDunePackage, ppx_tools_versioned, ocaml-compiler-libs, ocaml-migrate-parsetree }:

buildDunePackage rec {
  pname = "ppxx";
  version = "2.3.1";
  minimumOCamlVersion = "4.04.0";

  src = fetchFromBitbucket {
    owner = "camlspotter";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "1aqg7kb1hdaq237sj8gz0wa5mjp7w50f3q33iwask1a70nf4fbh3";
  };

  buildInputs = [ ppx_tools_versioned ocaml-compiler-libs ocaml-migrate-parsetree ];
}
