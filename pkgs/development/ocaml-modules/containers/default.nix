{ stdenv, fetchFromGitHub, ocaml, findlib, ocamlbuild, cppo, gen, sequence, qtest, ounit, result
, uutf, qcheck, buildDunePackage }:

buildDunePackage rec {
  pname = "containers";
  version = "2.4";
  minimumOcamlVersion = "4.02";

  src = fetchFromGitHub {
    owner = "c-cube";
    repo = "ocaml-containers";
    rev = "${version}";
    sha256 = "101pvy6mni8z1agjc6xwkws9lzrra8nk2dcda5km1qin7b0g9i3i";
  };

  #TODO: check whether qtest and cppo are still needed
  #buildInputs = [ cppo gen sequence qtest ounit qcheck ];
  buildInputs = [ gen sequence ounit qcheck uutf ];

  propagatedBuildInputs = [ result ];

  doCheck = true;
  checkTarget = "test";

  meta = {
    homepage = https://github.com/c-cube/ocaml-containers;
    description = "A modular standard library focused on data structures";
    longDescription = ''
      Containers is a standard library (BSD license) focused on data structures,
      combinators and iterators, without dependencies on unix. Every module is
      independent and is prefixed with 'CC' in the global namespace. Some modules
      extend the stdlib (e.g. CCList provides safe map/fold_right/append, and
      additional functions on lists).

      It also features optional libraries for dealing with strings, and
      helpers for unix and threads.
    '';
    license = stdenv.lib.licenses.bsd2;
    platforms = ocaml.meta.platforms or [];
  };
}
