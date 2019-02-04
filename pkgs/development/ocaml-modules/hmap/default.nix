{ stdenv, fetchurl, ocaml, findlib, ocamlbuild, topkg }:

let pname = "hmap"; in

if !stdenv.lib.versionAtLeast ocaml.version "4.02"
then throw "${pname} is not available for OCaml ${ocaml.version}"
else

stdenv.mkDerivation rec {
  name = "ocaml${ocaml.version}-${pname}-${version}";
  version = "0.8.1";

  src = fetchurl {
    url = "https://erratique.ch/software/hmap/releases/hmap-${version}.tbz";
    sha256 = "10xyjy4ab87z7jnghy0wnla9wrmazgyhdwhr4hdmxxdn28dxn03a";
  };

  buildInputs = [ ocaml findlib ocamlbuild topkg ];

  inherit (topkg) buildPhase installPhase;

  meta = with stdenv.lib; {
    description = "Heterogeneous value maps for OCaml";
    homepage = "http://erratique.ch/software/${pname}";
    platforms = ocaml.meta.platforms or [];
    maintainers = [ maintainers.vbgl ];
    license = stdenv.lib.licenses.isc;
  };
}
