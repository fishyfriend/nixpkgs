{ stdenv, buildDunePackage, fetchFromGitHub, ocaml, findlib, ocaml-migrate-parsetree }:

buildDunePackage rec {
  pname = "ppx_tools_versioned";
  version = "master";
  minimumOcamlVersion = "4.02";

  src = fetchFromGitHub {
    owner = "ocaml-ppx";
    repo = "ppx_tools_versioned";
    rev = version;
    sha256 = "0rh4443l2cgbcmgfka41x1rkiw4mxv7jgrxqhwsffnmy20zzarxq";
  };

  buildInputs = [ ocaml findlib ];

  propagatedBuildInputs = [ ocaml-migrate-parsetree ];

  createFindlibDestdir = true;

  meta = with stdenv.lib; {
    homepage = https://github.com/ocaml-ppx/ppx_tools_versioned;
    description = "Tools for authors of syntactic tools (such as ppx rewriters)";
    license = licenses.gpl2;
    maintainers = [ maintainers.volth ];
  };
}
