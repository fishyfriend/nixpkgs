{ stdenv, fetchzip, ocaml, findlib, ocamlbuild, uutf, markup, ppx_tools_versioned, re, buildDunePackage
, withP4 ? true
, camlp4 ? null
}:

assert stdenv.lib.versionAtLeast ocaml.version "4.02";

buildDunePackage rec {
  pname = "tyxml";
  version = "4.3.0";

  src = fetchzip {
    url = "http://github.com/ocsigen/tyxml/archive/${version}.tar.gz";
    sha256 = "0wv19xipkj8l2sks1h53105ywbjwk7q93fb7b8al4a2g9wr109c0";
  };

  buildInputs = [ ocaml findlib ocamlbuild ppx_tools_versioned markup ]
  ++ stdenv.lib.optional withP4 camlp4;

  propagatedBuildInputs = [ uutf re ];

  meta = with stdenv.lib; {
    homepage = http://ocsigen.org/tyxml/;
    description = "A library that makes it almost impossible for your OCaml programs to generate wrong XML output, using static typing";
    license = licenses.lgpl21;
    platforms = ocaml.meta.platforms or [];
    maintainers = with maintainers; [ gal_bolle vbgl ];
  };
}
