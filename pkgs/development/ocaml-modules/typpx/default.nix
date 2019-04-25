{ fetchFromBitbucket, buildDunePackage, ppxx }:

buildDunePackage rec {
  pname = "typpx";
  version = "1.4.3";
  minimumOCamlVersion = "4.02.3";

  src = fetchFromBitbucket {
    owner = "camlspotter";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "1ikq0wzlxn09far81jyg71zibrqpjzncvk0lrmihclrb89q4rmby";
  };

  buildInputs = [ ppxx ];
}
