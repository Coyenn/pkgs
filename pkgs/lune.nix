{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "lune";
  version = "0.10.3";

  src = fetchFromGitHub {
    owner = "lune-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-YmKZjT7d0zQGos+/4XB6qsOrX8r5Pa8DeKDuUo1ViMk=";
  };

  cargoHash = "sha256-cq7Sgq9f2XpVTgEOMfR/G7sTqcWLwuJBgG9U+h4IMWQ=";

  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A standalone Luau runtime";
    homepage = "https://github.com/lune-org/lune";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
