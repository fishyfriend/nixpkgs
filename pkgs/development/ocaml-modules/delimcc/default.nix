{ stdenv, fetchurl, buildOcaml }:

buildOcaml rec {
  name = "delimcc";
  version = "2018.02.27";
  minimumSupportedOcamlVersion = "4.04";

  src = fetchurl {
    url = "https://github.com/zinid/delimcc/archive/${version}.tar.gz";
    sha256 = "1g0a7m95fpmjv4x14bsgr8hijc6575kh99bdrp8nj96dl57ih8ds";
  };

  createFindlibDestdir = true;
  hasSharedObjects = true;
  patches = [ ./Makefile.patch ];
  #hardeningDisable = [ "all" ];
  buildPhase = "make all opt top";
  installPhase = "make findlib-install";
  doCheck = true;
  checkPhase = "make testd0 testd0opt tests0";

  meta = with stdenv.lib; {
    homepage = "http://okmij.org/ftp/continuations/implementations.html#caml-shift";
    description = "Delimited continuations in byte-code and native OCaml";
    license = stdenv.lib.licenses.mit;
  };
}
