{ stdenv, fetchFromGitHub, buildDunePackage, opium_kernel, cohttp-lwt-unix,
	ocaml_lwt, logs, cmdliner, ppx_fields_conv, ppx_sexp_conv, re, magic-mime,
	stringext, alcotest, cow }:

buildDunePackage rec {
	inherit (opium_kernel) version minimumOCamlVersion src meta;

	pname = "opium";

	propagatedBuildInputs = [
		opium_kernel
		cohttp-lwt-unix
		ocaml_lwt
		logs
		cmdliner
		ppx_fields_conv
		ppx_sexp_conv
		re
		magic-mime
		stringext
		alcotest
		cow
	];
}
