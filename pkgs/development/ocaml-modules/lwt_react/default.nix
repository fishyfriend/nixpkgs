{ stdenv, fetchzip, ocaml, findlib, ocamlbuild, lwt, react, buildDunePackage }:

buildDunePackage rec {
	inherit (lwt) src version;
	pname = "lwt_react";
	propagatedBuildInputs = [ lwt react ];

	meta = {
		description = "Helpers for using React with Lwt";
		inherit (lwt.meta) homepage license maintainers;
    inherit (ocaml.meta) platforms;
	};
}
