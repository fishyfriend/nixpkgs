{ stdenv, buildDunePackage, fetchurl, ounit, result }:

buildDunePackage rec {
  pname = "dispatch";
  version = "0.4.0";

  src = fetchurl {
    url = "https://github.com/inhabitedtype/ocaml-dispatch/archive/${version}.tar.gz";
    sha256 = "1cp5dl1dwwnvyin1rybv6wygh7zmv8dvsmbk31pc2hh7jvr7g3kc";
  };

  buildInputs = [
    ounit
    result
  ];

  meta = with stdenv.lib; {
    homepage = https://github.com/inhabitedtype/ocaml-dispatch;
    description = "Path-based dispatching for client- and server-side applications.";
    license = stdenv.lib.licenses.bsd3;
  };
}
