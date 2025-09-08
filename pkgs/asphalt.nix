{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "asphalt";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "jackTabsCode";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Qv3luatCEbxbs2dvFlfvQ7foOR7mVgyr4+PFYnZFTyc=";
  };

  cargoHash = "sha256-bE7xgIgw+vgq7XJog/hor9f2khMNuL8AfIR8XyABQdM=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Upload and reference Roblox assets in code";
    homepage = "https://github.com/jackTabsCode/asphalt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
