{ stdenv, fetchurl, ocaml, findlib, which, react, ssl
, ocamlnet, ocaml_pcre, cryptokit, tyxml, ipaddr, zlib
, libev, openssl, ocaml_sqlite3, tree, uutf, makeWrapper, camlp4
, camlzip, pgocaml, lwt_log, lwt_react, lwt_ssl, xml-light
}:

if !stdenv.lib.versionAtLeast ocaml.version "4.03"
then throw "ocsigenserver is not available for OCaml ${ocaml.version}"
else

let mkpath = p: n:
  "${p}/lib/ocaml/${ocaml.version}/site-lib/${n}";
in

stdenv.mkDerivation rec {
  name = "ocsigenserver-${version}";
  version = "2.11.0";

  src = fetchurl {
    url = "https://github.com/ocsigen/ocsigenserver/archive/${version}.tar.gz";
    sha256 = "1plvmgbk23kfkfsx1ixlis4ssg71by7m1k2xci2j6fp0gnkdybf3";
  };

  patches = [
    ./lwt_react.patch
    ./version.patch
  ];

  buildInputs = [ ocaml which findlib ];

  # TODO: move to buildInputs as many of these as possible
  propagatedBuildInputs = [ react ssl lwt_react lwt_ssl lwt_log
  ocamlnet ocaml_pcre cryptokit tyxml ipaddr zlib libev openssl
  ocaml_sqlite3 tree uutf makeWrapper camlp4 pgocaml camlzip
  xml-light ];

  configureFlags = [ "--root $(out)" "--prefix /" ];

  dontAddPrefix = true;

  createFindlibDestdir = true;

  postFixup =
  ''
  rm -rf $out/var/run
  wrapProgram $out/bin/ocsigenserver \
    --prefix CAML_LD_LIBRARY_PATH : "${mkpath ssl "ssl"}:${mkpath ocamlnet "netsys"}:${mkpath ocamlnet "netstring"}:${mkpath ocaml_pcre "pcre"}:${mkpath cryptokit "cryptokit"}:${mkpath ocaml_sqlite3 "sqlite3"}"
  '';

  dontPatchShebangs = true;

  meta = {
    homepage = http://ocsigen.org/ocsigenserver/;
    description = "A full featured Web server";
    longDescription =''
      A full featured Web server. It implements most features of the HTTP protocol, and has a very powerful extension mechanism that make very easy to plug your own OCaml modules for generating pages.
      '';
    license = stdenv.lib.licenses.lgpl21;
    platforms = ocaml.meta.platforms or [];
    maintainers = [ stdenv.lib.maintainers.gal_bolle ];
  };

}
