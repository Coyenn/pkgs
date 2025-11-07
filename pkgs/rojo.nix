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
  version = "7.6.1";

  src = fetchFromGitHub {
    owner = "rojo-rbx";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-h8gd91Nc35jTQ4u9YyQGOB+rkgRAos8lsjX+bWzvpDs=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-zl1L8q1AJwVn0o2BazJ30FyBCMq5F5nAQ0FGuEAPGms=";

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
