{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "lune";
  version = "0.9.4";

  src = fetchFromGitHub {
    owner = "lune-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-ZqlPImggZbvsUtq3BRGiDLzKsig3+odVx+yzUnpRTZw=";
  };

  cargoHash = "sha256-bp6Bg9i0fIi9eqtNd1BUGZ+R8AO/ZwDol98d4Ub+3iw=";

  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A standalone Luau runtime";
    homepage = "https://github.com/lune-org/lune";
    license = licenses.mpl20;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
