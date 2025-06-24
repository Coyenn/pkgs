{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "rokit";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "rojo-rbx";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-cGsxfz3AT8W/EYk3QxVfZ8vd6zGNx1Gn6R1SWCYbVz0=";
  };

  cargoHash = "sha256-km14/9SCXUSzr4rhuhjXoUKfUBj8ULiP8XRcmp/N7Mg=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Next-generation toolchain manager for Roblox projects";
    homepage = "https://github.com/rojo-rbx/rokit";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
