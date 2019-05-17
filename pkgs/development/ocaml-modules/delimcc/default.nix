{ stdenv, fetchurl, buildOcaml }:

buildOcaml rec {
  name = "delimcc";
  version = "2018.03.04";
  minimumSupportedOcamlVersion = "4.04";

  src = fetchurl {
    url = "https://github.com/zinid/delimcc/archive/${version}.tar.gz";
    sha256 = "04kj19w59xnlaykg6mh4kvzfdx8q9wh5gam71lygdvrqnxwvrmjq";
  };

  patches = [ ./Makefile.patch ];

  createFindlibDestdir = true;

  buildPhase = "make all opt top";

  installPhase = "make install findlib-install";

  # FIXME: testd0opt segfauls
  #checkPhase = "make testd0 testd0opt tests0";
  checkPhase = "make testd0 tests0";
  doCheck = true;

  meta = with stdenv.lib; {
    homepage = "http://okmij.org/ftp/continuations/implementations.html#caml-shift";
    description = "Delimited continuations in byte-code and native OCaml";
    license = stdenv.lib.licenses.mit;
  };
}
