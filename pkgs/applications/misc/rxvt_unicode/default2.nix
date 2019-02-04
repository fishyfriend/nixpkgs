with import <nixpkgs> {};

stdenv.mkDerivation (rec {

  name = "urxvt";

  buildInputs =
    [ xorg.libX11 xorg.libXt xorg.libXft ncurses fontconfig freetype pkgconfig
      xorg.libXrender perl gdk_pixbuf systemd.dev systemd.lib autoconf ];

  src = ./.;

  outputs = [ "out" "terminfo" ];

  preConfigure =
    ''
      ./autogen.sh
      mkdir -p $terminfo/share/terminfo
      configureFlags="--with-terminfo=$terminfo/share/terminfo --enable-256-color --enable-perl --enable-unicode3 --enable-systemd";
      export TERMINFO=$terminfo/share/terminfo # without this the terminfo won't be compiled by tic, see man tic
      NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -I${freetype.dev}/include/freetype2"
      NIX_LDFLAGS="$NIX_LDFLAGS -lfontconfig -lXrender "
    ''
    # make urxvt find its perl file lib/perl5/site_perl is added to PERL5LIB automatically
    + ''
      mkdir -p $out/lib/perl5
      ln -s $out/{lib/urxvt,lib/perl5/site_perl}
    '';

  postInstall = ''
    mkdir -p $out/nix-support
    echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
  '';
})
