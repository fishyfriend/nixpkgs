{ buildOcaml ocaml gen_js_api }:

let pname = "vdom"; in

with ocamlPackages;

buildOcaml {
  version = "master";
  name = "ocaml{ocaml.version}-${pname}-${version}";

  src = fetchFromGitHub {
    owner = "LexiFi";
    repo = "ocaml-${pname}";
    rev = "${version}";
    sha256 = "0lbipic87bm7jzy6hjjks59ixffdb4wxam8rrqsd11scppf2n0q1";
  };

  propagatedBuildInputs = [ gen_js_api ];

  installPhase = ''
    export OCAMLPATH=$out/lib/ocaml/${ocaml.version}/site-lib/:$OCAMLPATH
    make install
    opaline -prefix $out
  '';
}
