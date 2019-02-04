{ stdenv, ocaml, findlib, dune, js_of_ocaml-compiler
, js_of_ocaml-ppx, ocaml-migrate-parsetree, ppx_tools_versioned
, js_of_ocaml, reactivedata, tyxml, buildDunePackage
}:

buildDunePackage rec {
	pname = "js_of_ocaml-tyxml";

	inherit (js_of_ocaml-compiler) version src meta;

	buildInputs = [ js_of_ocaml-ppx ocaml-migrate-parsetree ppx_tools_versioned ];

	propagatedBuildInputs = [ js_of_ocaml reactivedata tyxml ];
}
