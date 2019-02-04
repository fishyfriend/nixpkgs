{ stdenv, fetchFromGitHub, buildDunePackage, hmap, cohttp-lwt, ezjsonm, base64,
	ocaml_lwt, fieldslib, sexplib, ppx_fields_conv, ppx_sexp_conv, re, alcotest,
	cow }:

buildDunePackage rec {
	pname = "opium_kernel";
	version = "0.17.0";
	minimumOCamlVersion = "4.04.1";

	src = fetchFromGitHub {
		owner = "rgrinberg";
		repo = pname;
		rev = "v${version}";
		sha256 = "0vi28a86ir42ijfrs6ji03cyb8yzz2xs9ljngd5jfib480b2fz85";
	};

	propagatedBuildInputs = [
		hmap
		cohttp-lwt
		ezjsonm
		base64
		ocaml_lwt
		fieldslib
		sexplib
		ppx_fields_conv
		ppx_sexp_conv
		re
		alcotest
		cow
	];

	meta = {
		description = "Sinatra like web toolkit based on Lwt + Cohttp";
		license = stdenv.lib.licenses.mit;
		inherit (src.meta) homepage;
	};
}
