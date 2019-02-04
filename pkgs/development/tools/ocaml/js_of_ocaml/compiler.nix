{ stdenv, fetchFromGitHub, ocaml, findlib, dune
, cmdliner, cppo, yojson, buildDunePackage
}:

buildDunePackage rec {
	minimumOcamlVersion = "4.02";
	pname = "js_of_ocaml-compiler";
	version = "3.3.0";

	src = fetchFromGitHub {
		owner = "ocsigen";
		repo = "js_of_ocaml";
		rev = version;
		sha256 = "0bg8x2s3f24c8ia2g293ikd5yg0yjw3hkdgdql59c8k2amqin8f8";
	};

	buildInputs = [ cmdliner cppo ];
	propagatedBuildInputs = [ yojson ];

	meta = {
		description = "Compiler from OCaml bytecode to Javascript";
		license = stdenv.lib.licenses.gpl2;
		maintainers = [ stdenv.lib.maintainers.vbgl ];
		inherit (src.meta) homepage;
		inherit (ocaml.meta) platforms;
	};
}
