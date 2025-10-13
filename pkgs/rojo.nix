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
  version = "7.6.0";

  src = fetchFromGitHub {
    owner = "rojo-rbx";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-4i0Oo4M7SP09E+D81Lf7coaEQWgM03PbQ0lB6PwTjr0=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-UkK/QQI98bIty8lT3UrekeAISEAwo/QD8AScRUkIvgE=";

  passthru.updateScript = nix-update-script {};

  buildInputs = [openssl];

  # tests flaky on darwin on hydra
  doCheck = !stdenv.hostPlatform.isDarwin;

  meta = with lib; {
    description = "Enables professional-grade development tools for Roblox developers";
    homepage = "https://rojo.space";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
