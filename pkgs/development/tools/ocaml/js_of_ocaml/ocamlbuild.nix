{ stdenv, ocaml, findlib, dune, js_of_ocaml-compiler
, ocamlbuild, buildDunePackage
}:

buildDunePackage rec {
	pname = "js_of_ocaml-ocamlbuild"; 
	inherit (js_of_ocaml-compiler) version src meta;
	propagatedBuildInputs = [ ocamlbuild ];
}
