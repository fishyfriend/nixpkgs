{ stdenv, fetchFromGitHub, ocaml, findlib, ocamlbuild, topkg }:
let pname = "higher"; in
stdenv.mkDerivation rec {
  name = "ocaml-${pname}-${version}";
  version = "0.3.1";

  # N.B. Per the paper it could be supported in 4.01 using a compiler switch.
  minimumSupportedOcamlVersion = "4.02";

  src = fetchFromGitHub {
    rev = version;
    owner = "ocamllabs";
    repo = "higher";
    sha256 = "0ahk6bp5lz12g8qi83zxmwy6rbgwbj4155bdfmbcvvwrplfv9z59";
  };

  buildInputs = [ ocaml findlib ocamlbuild topkg ];

  inherit (topkg) buildPhase installPhase;

  meta = with stdenv.lib; {
    homepage = https://github.com/ocamllabs/higher;
    description = "Higher-kinded programming in OCaml";
    license = licenses.mit;
  };
}
