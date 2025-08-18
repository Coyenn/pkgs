{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "asphalt";
  version = "1.0.0-pre.15";

  src = fetchFromGitHub {
    owner = "jackTabsCode";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-UL3815/apFUSwN2L1LymWo7v+4vsgGTNosx5zhqXtOo=";
  };

  cargoHash = "sha256-NCQROTyXTK9nnFk8eaqEOwquhMNMS9sPDg3mmNqzhtc=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Upload and reference Roblox assets in code";
    homepage = "https://github.com/jackTabsCode/asphalt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
