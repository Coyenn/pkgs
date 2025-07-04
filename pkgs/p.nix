{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
  openssl,
  pkg-config,
}:
rustPlatform.buildRustPackage rec {
  pname = "p";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "RevisionOrg";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-W8yOy+a3FWKofLA5mWOwhRTkIcGh2d7JoA0W10bRXEc=";
  };

  cargoHash = "sha256-qTI2zbmn21EAhu08jVYfrUYKNkvPZWsmy1mNGCekc4I=";

  nativeBuildInputs = [pkg-config];
  buildInputs = [openssl];

  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A simple project management tool for the command line written in Rust";
    homepage = "https://github.com/RevisionOrg/p";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
