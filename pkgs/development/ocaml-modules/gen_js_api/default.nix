{ buildOCaml ocaml }:

let pname = "gen_js_api"; in

buildOcaml {
  version = "1.0.5";
  name = "ocaml{ocaml.version}-${pname}-${version}";

  src = fetchFromGitHub {
    owner = "LexiFi";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "12fwkgj8ha7vhsambc19czd1dsrdhqj23cjg1pb0m6rf52c27pf4";
  };

  installPhase = ''
    export OCAMLPATH=$out/lib/ocaml/${ocaml.version}/site-lib/:$OCAMLPATH
    make install
    opaline -prefix $out
  '';
}
