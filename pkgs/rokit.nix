{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "rokit";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "rojo-rbx";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-N81GYmaXFrSJ1m7tH2jpi5S0V6dOdvkpDNNfqyfHnjY=";
  };

  cargoHash = "sha256-bu3cuHsplfKcogA5HEdhcYGMZ6b4xf9NsnL9d8ESCe0=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Next-generation toolchain manager for Roblox projects";
    homepage = "https://github.com/rojo-rbx/rokit";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
