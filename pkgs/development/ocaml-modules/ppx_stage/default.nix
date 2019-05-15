{ stdenv, buildDunePackage, fetchFromGitHub, ocaml-migrate-parsetree, ppx_tools_versioned }:

buildDunePackage rec {
  pname = "ppx_stage";
  version = "master";

  src = fetchFromGitHub {
    owner = "stedolan";
    repo = pname;
    rev = version;
    sha256 = "0amxjp5zbk94ivxr7v0cvr377p4xzw4vn0r9rpwn6fzimhv7vdb4";
  };

  buildInputs = [ ocaml-migrate-parsetree ppx_tools_versioned ];

  meta = with stdenv.lib; {
    homepage = https://github.com/stedolan/ppx_stage;
    description = "Staged metaprogramming in stock OCaml";
    license = stdenv.lib.licenses.mit;
  };
}
