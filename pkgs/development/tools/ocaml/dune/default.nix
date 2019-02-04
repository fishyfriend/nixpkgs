{ stdenv, fetchurl, ocamlPackages, opaline }:

stdenv.mkDerivation rec {
  name = "dune-${version}";
  version = "1.6.3";
  src = fetchurl {
    url = "https://github.com/ocaml/dune/releases/download/${version}/dune-${version}.tbz";
    sha256 = "bfd52160d88578c404af1267abfba6eb4928988e51aef0e92dbebdea1607ae36";
  };

  buildInputs = with ocamlPackages; [ ocaml findlib ];

  buildFlags = "release";

  dontAddPrefix = true;

  installPhase = ''
    runHook preInstall
    ${opaline}/bin/opaline -prefix $out -libdir $OCAMLFIND_DESTDIR
    runHook postInstall
  '';

  meta = {
    homepage = https://github.com/ocaml/dune;
    description = "A composable build system";
    maintainers = [ stdenv.lib.maintainers.vbgl ];
    license = stdenv.lib.licenses.mit;
    inherit (ocamlPackages.ocaml.meta) platforms;
  };
}
