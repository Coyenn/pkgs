{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "argon";
  version = "2.0.27";

  src = fetchFromGitHub {
    owner = "argon-rbx";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-AcgaY7XmecqvWan81tVxV6UJ+A38tAYDlvUSLLKlYuU=";
  };

  cargoHash = "sha256-0VIPAcCK7+te7TgH/+x0Y7pP0fYWuRT58/h9OIva0mQ=";
  passthru.updateScript = nix-update-script {};
  doCheck = false;

  meta = with lib; {
    description = "Fully featured tool for Roblox development";
    homepage = "https://github.com/argon-rbx/argon";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
