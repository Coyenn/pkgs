{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "argon";
  version = "2.0.26";

  src = fetchFromGitHub {
    owner = "argon-rbx";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-3IftPWrBETU7zJLaB9uTrc08c37XGmFPPArzrlIFG3Q=";
  };

  cargoHash = "sha256-60BQ7PsKATq5jX5DqCGdOx3xvRzwm5TAM1RtKuPy49M=";
  passthru.updateScript = nix-update-script {};
  doCheck = false;

  meta = with lib; {
    description = "Fully featured tool for Roblox development";
    homepage = "https://github.com/argon-rbx/argon";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
