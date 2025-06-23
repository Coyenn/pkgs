{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "argon";
  version = "2.0.18";

  src = fetchFromGitHub {
    owner = "argon-rbx";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Argon - Full featured tool for Roblox development";
    homepage = "https://github.com/argon-rbx/argon";
    license = licenses.mit;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
