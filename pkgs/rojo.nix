{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  openssl,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "rojo";
  version = "7.5.1";

  src = fetchFromGitHub {
    owner = "rojo-rbx";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-awMio62guyP5qZH4i5hwXV5re6o45HDwqIJb3Dd71Is=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-iWRjXC+JaBA/z2eOHiiqFFtS2gug5/hkIpYrPdHyux0=";

  passthru.updateScript = nix-update-script {};

  buildInputs = [openssl];

  # tests flaky on darwin on hydra
  doCheck = !stdenv.hostPlatform.isDarwin;

  meta = with lib; {
    description = "Enables professional-grade development tools for Roblox developers";
    homepage = "https://rojo.space";
    license = licenses.mpl20;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
