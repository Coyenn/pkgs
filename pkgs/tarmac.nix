{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "tarmac";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = "Roblox";
    repo = pname;
    rev = "v${version}";
    sha256 = "164gdkrx8qn72nj2a8736xky248ls9mwc8fr8dmgnr1kjq5is6aq";
  };

  cargoHash = "sha256-u6EQLCdANSi1TBy2O1P5Ro5gJlfBjh/Xm7/uzCHtRu0=";

  passthru.updateScript = nix-update-script {};

  buildInputs = [openssl];

  nativeBuildInputs = [pkg-config];

  meta = {
    description = "Resource compiler and asset manager for Roblox projects";
    homepage = "https://github.com/Roblox/tarmac";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
