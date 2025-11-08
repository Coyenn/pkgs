{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "mantle";
  version = "0.11.18";

  src = fetchFromGitHub {
    owner = "blake-mealey";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-h4MBHs0NxjW1eXUgpw1LdCV0kF1s5URCaFVULNkLZq0=";
  };

  sourceRoot = "${src.name}/mantle";
  cargoHash = "sha256-iuFRLAyf+NZ45oFF3sQtwC2uYbgs6u64QWGaTP60o04=";
  cargoBuildFlags = ["-p" "mantle"];
  passthru.updateScript = nix-update-script {};
  doCheck = false;

  buildInputs = [openssl];
  nativeBuildInputs = [pkg-config];

  meta = with lib; {
    description = "An infrastructure-as-code and deployment tool for Roblox";
    homepage = "https://github.com/blake-mealey/mantle";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
