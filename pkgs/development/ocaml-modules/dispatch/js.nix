{ buildDunePackage, dispatch, js_of_ocaml-lwt, result }:

buildDunePackage rec {
  inherit (dispatch) version src meta;

  pname = "dispatch-js";
  minimumSupportedOcamlVersion = "4.03.0";

  src = fetchurl {
    url = "https://github.com/inhabitedtype/ocaml-dispatch/archive/${version}.tar.gz";
    sha256 = "1flsy4w3pk2bxi2r9jmv5yaizsy6fswvs6d9n6jah9z2c088c63b";
  };

  buildInputs = [
    dispatch
    js_of_ocaml-lwt
    result
  ];
}
