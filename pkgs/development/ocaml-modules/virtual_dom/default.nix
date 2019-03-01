{ buildDunePackage, ocaml base js_of_ocaml, js_of_ocaml-ppx,
  ocaml-migrate-parsetree, ppx_jane, ppxlib, ppx_tools_versioned, tyxml,
  bin_prot, ppx_assert, ppx_bench, ppx_expect, ppx_hash, typerep
}:

buildDunePackage {
  pname = "virtual_dom";
  version = "0.11.0";
  minimumOCamlVersion = "4.04.1";

  src = fetchFromGithub {
    owner = "janestreet";
    repo = "${pname};
    rev = "v${version};
    sha256 = "03gb429pm4invb1fvwhqa84bvbs8fqv645nd1lf3xpr6nqh98q97";
  };

  buildInputs = [
    base
    js_of_ocaml
    js_of_ocaml-ppx
    ocaml-migrate-parsetree
    ppx_jane
    ppxlib
    ppx_tools_versioned
    tyxml
  ];

  propagatedBuildInputs = [
    bin_prot
    ppx_assert
    ppx_bench
    ppx_expect
    ppx_hash
    typerep
  ];
};
